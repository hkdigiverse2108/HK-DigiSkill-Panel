import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/course_curriculums_model.dart';
import 'package:hkdigiskill_admin/data/models/course_model.dart';
import 'package:hkdigiskill_admin/data/models/image_model.dart';
import 'package:hkdigiskill_admin/data/models/lesson_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/screens/course/course_list/controllers/course_list_controller.dart';
import 'package:hkdigiskill_admin/screens/course/curriculum/curriculums_list/controllers/course_curriculum_controller.dart';
import 'package:hkdigiskill_admin/screens/media/controllers/media_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:intl/intl.dart';

class EditCourseCurriculumController extends GetxController {
  static EditCourseCurriculumController get instance => Get.find();

  var isLoading = false.obs;
  var isLessonLoading = false.obs;

  var thumbnail = ''.obs;
  var attachment = ''.obs;

  var selectedCourse = ''.obs;
  var courseId = ''.obs;

  var courseList = <CourseModel>[].obs;

  var lessonList = <CourseLessonModel>[].obs;
  Rx<CourseLessonModel?> selectedLesson = Rx<CourseLessonModel?>(null);

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
    setCourseList();
  }

  // ---------------------------
  // SET INITIAL FIELDS
  // ---------------------------
  void initFields(CourseCurriculumsModel curriculums) {
    titleController.text = curriculums.title;
    descriptionController.text = curriculums.description;
    priorityController.text = curriculums.courseLessonsPriority.toString();
    durationController.text = curriculums.duration;

    courseId.value = curriculums.courseId.id;
    selectedCourse.value = curriculums.courseId.name;

    thumbnail.value = curriculums.thumbnail;
    attachment.value = curriculums.attachment;

    videoUrlController.text = curriculums.videoLink;
    dateController.text = DateFormat('yyyy-MM-dd').format(curriculums.date);

    /// fetch lessons for this course
    getLessonByCourseId().then((_) {
      if (curriculums.courseLessonsAssigned.isNotEmpty) {
        final assignedLessonId = curriculums.courseLessonsAssigned.first.id;

        selectedLesson.value = lessonList.firstWhereOrNull(
          (lesson) => lesson.id == assignedLessonId,
        );
      }
    });
  }

  void setCourseList() {
    courseList.value = courseController.dataList;
  }

  // ---------------------------
  // THUMBNAIL PICKER
  // ---------------------------
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

  // ---------------------------
  // PICK DATE
  // ---------------------------
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

  // ---------------------------
  // SELECT COURSE
  // ---------------------------
  void selectCourse(String courseT) {
    if (courseT.isEmpty) {
      selectedCourse.value = "";
      courseId.value = "";
      lessonList.clear();
      selectedLesson.value = null;
      return;
    }

    final course = courseList.firstWhere((course) => course.name == courseT);

    selectedCourse.value = course.name;
    courseId.value = course.id;

    selectedLesson.value = null;
    getLessonByCourseId();
  }

  // ---------------------------
  // GET LESSONS BY COURSE ID
  // ---------------------------
  Future<void> getLessonByCourseId() async {
    try {
      isLessonLoading.value = true;

      final response = await apiService.get(
        path: ApiConstants.lessonByCourseId + courseId.value,
        headers: {'Authorization': storageService.token!},
        decoder: (json) {
          final data = json['data']['course_lesson_data'] as List;
          return data.map((e) => CourseLessonModel.fromJson(e)).toList();
        },
      );

      lessonList.value = response;
    } catch (e) {
      log(e.toString());
    } finally {
      isLessonLoading.value = false;
    }
  }

  // ---------------------------
  // UPDATE CURRICULUM
  // ---------------------------
  Future<void> updateCourseCurriculum(
    CourseCurriculumsModel curriculums,
  ) async {
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
        path: ApiConstants.courseCurriculumsUpdate,
        headers: {'Authorization': '${storageService.token}'},
        body: {
          'courseCurriculumId': curriculums.id,
          'title': titleController.text,
          'description': descriptionController.text,
          'courseLessonsPriority': int.parse(priorityController.text),
          'duration': durationController.text,
          'courseId': courseId.value,
          'thumbnail': thumbnail.value,
          'attachment': attachment.value,
          'videoLink': videoUrlController.text,
          'date': dateController.text,

          /// Single selected lesson but API expects a list → wrap it in a list
          'courseLessonsAssigned': selectedLesson.value == null
              ? []
              : [selectedLesson.value!.id],
        },
        decoder: (json) => json as Map<String, dynamic>,
      );

      if (response['status'] == 200) {
        curriculumsController.fetchCurriculums();
        Get.back();
        AdminLoaders.successSnackBar(
          title: "Curriculum",
          message: "Curriculum updated successfully",
        );
      }
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Curriculum",
        message: "Failed to update curriculum",
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
    selectedLesson.value = null;
  }
}
