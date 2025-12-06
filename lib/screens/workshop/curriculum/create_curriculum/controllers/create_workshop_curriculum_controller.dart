import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/image_model.dart';
import 'package:hkdigiskill_admin/data/models/workshop_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/screens/media/controllers/media_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/all_workshop/controllers/workshop_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/curriculum/curriculums_list/controllers/workshop_curriculum_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:intl/intl.dart';

class CreateWorkshopCurriculumController extends GetxController {
  static CreateWorkshopCurriculumController get instance => Get.find();

  var isLoading = false.obs;
  var thumbnail = ''.obs;
  var attachment = ''.obs;
  var selectedWorkshop = ''.obs;
  var workshopId = ''.obs;
  var workshopList = <WorkshopModel>[].obs;
  var isDataLoading = false.obs;

  final dateController = TextEditingController();
  final videoUrlController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priorityController = TextEditingController();
  final durationController = TextEditingController();

  final titleSectionForm = GlobalKey<FormState>();
  final resourceSectionForm = GlobalKey<FormState>();

  final workshopController = WorkshopController.instance;
  final curriculumsController = WorkshopCurriculumController.instance;

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  @override
  void onInit() {
    super.onInit();
    setWorkshopList();
  }

  void setWorkshopList() {
    workshopList.value = workshopController.dataList;
  }

  void selectThumbnailImage() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    if (selectedImages != null && selectedImages.isNotEmpty) {
      thumbnail.value = selectedImages.first.url;
    }
  }

  void selectPdfFile() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    if (selectedImages != null && selectedImages.isNotEmpty) {
      attachment.value = selectedImages.first.url;
    }
  }

  Future<String?> pickDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AdminColors.primary,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (date == null) return null;

    return DateFormat('yyyy-MM-dd').format(date);
  }

  void selectWorkshop(String workshopT) {
    if (workshopT == "") {
      selectedWorkshop.value = "";
      workshopId.value = "";
      return;
    }

    final workshop = workshopList.firstWhere(
      (workshop) => workshop.title == workshopT,
    );
    selectedWorkshop.value = workshop.title;
    workshopId.value = workshop.id;
  }

  Future<void> createWorkshopCurriculum() async {
    try {
      isLoading.value = true;
      if (!titleSectionForm.currentState!.validate()) return;
      if (!resourceSectionForm.currentState!.validate()) return;

      if (workshopId.value.isEmpty) {
        AdminLoaders.errorSnackBar(
          title: "Curriculum",
          message: "Please select a workshop",
        );
        return;
      }
      if (thumbnail.value.isEmpty) {
        AdminLoaders.errorSnackBar(
          title: "Curriculum",
          message: "Please select a thumbnail",
        );
        return;
      }

      final response = await apiService.post(
        path: ApiConstants.workshopCurriculumsCreate,
        headers: {'Authorization': '${storageService.token}'},
        body: {
          'title': titleController.text,
          'description': descriptionController.text,
          'priority': priorityController.text,
          'duration': durationController.text,
          'workshopId': workshopId.value,
          'thumbnail': thumbnail.value,
          'attachment': attachment.value,
          'videoLink': videoUrlController.text,
          'date': dateController.text,
        },
        decoder: (json) => json as Map<String, dynamic>,
      );

      if (response['status'] == 200) {
        curriculumsController.fetchCurriculums();
        Get.back();
        AdminLoaders.successSnackBar(
          title: "Curriculum",
          message: "Curriculum created successfully",
        );
      }
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Curriculum",
        message: "Failed to create curriculum",
      );
    } finally {
      isLoading.value = false;
    }
  }

  void clearField() {
    titleController.clear();
    descriptionController.clear();
    priorityController.clear();
    durationController.clear();
    workshopId.value = "";
    thumbnail.value = "";
    attachment.value = "";
    videoUrlController.clear();
    dateController.clear();
  }
}
