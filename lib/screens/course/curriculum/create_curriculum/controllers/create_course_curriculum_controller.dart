import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/course_model.dart';
import 'package:hkdigiskill_admin/data/models/image_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/screens/course/course_list/controllers/course_list_controller.dart';
import 'package:hkdigiskill_admin/screens/course/curriculum/curriculums_list/controllers/course_curriculum_controller.dart';
import 'package:hkdigiskill_admin/screens/media/controllers/media_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:intl/intl.dart';

class CreateCourseCurriculumController extends GetxController {
  static CreateCourseCurriculumController get instance => Get.find();

  var isLoading = false.obs;
  var thumbnail = ''.obs;
  var attachment = ''.obs;
  var selectedCourse = ''.obs;
  var courseId = ''.obs;
  var courseList = <CourseModel>[].obs;

  final dateController = TextEditingController();
  final videoUrlController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priorityController = TextEditingController();
  final durationController = TextEditingController();

  final titleSectionForm = GlobalKey<FormState>();
  final resourceSectionForm = GlobalKey<FormState>();

  final courseController = CourseListController.instance;
  final curriculumsController = CourseCurriculumController.instance;

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  @override
  void onInit() {
    super.onInit();
    setcourseList();
  }

  void setcourseList() {
    courseList.value = courseController.dataList;
  }

  void selectThumbnailImage() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    if (selectedImages != null && selectedImages.isNotEmpty) {
      thumbnail.value = selectedImages.first.url;
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

  void selectCourse(String courseT) {
    if (courseT == "") {
      selectedCourse.value = "";
      courseId.value = "";
      return;
    }

    final course = courseList.firstWhere((course) => course.name == courseT);
    selectedCourse.value = course.name;
    courseId.value = course.id;
  }

  Future<void> createCourseCurriculum() async {
    try {
      isLoading.value = true;
      if (!titleSectionForm.currentState!.validate()) return;
      if (!resourceSectionForm.currentState!.validate()) return;

      if (courseId.value.isEmpty) {
        AdminLoaders.errorSnackBar(
          title: "Curriculum",
          message: "Please select a course",
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
        path: ApiConstants.courseCurriculumsCreate,
        headers: {'Authorization': '${storageService.token}'},
        body: {
          'title': titleController.text,
          'description': descriptionController.text,
          'courseLessonsPriority': priorityController.text,
          'duration': durationController.text,
          'courseId': courseId.value,
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
    courseId.value = "";
    thumbnail.value = "";
    attachment.value = "";
    videoUrlController.clear();
    dateController.clear();
  }
}
