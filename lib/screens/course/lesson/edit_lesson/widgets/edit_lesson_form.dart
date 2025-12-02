import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/data/models/lesson_model.dart';
import 'package:hkdigiskill_admin/screens/course/lesson/edit_lesson/controllers/edit_lesson_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';
import 'package:iconsax/iconsax.dart';

class EditLessonForm extends GetView<EditLessonController> {
  const EditLessonForm({super.key, required this.lesson});

  final CourseLessonModel lesson;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: EditLessonController(),
      initState: (state) {
        controller.initFields(lesson);
      },
      builder: (controller) {
        return AdminRoundedContainer(
          width: 700,
          padding: EdgeInsets.all(AdminSizes.defaultSpace),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Edit Lesson',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: AdminSizes.spaceBtwSections),

                // ============= COURSE DROPDOWN ============
                Obx(
                  () => DropdownSearch<String>(
                    decoratorProps: DropDownDecoratorProps(
                      decoration: const InputDecoration(
                        labelText: "Course",
                        prefixIcon: Icon(Iconsax.book),
                      ),
                    ),
                    items: (filter, props) =>
                        controller.courseList.map((e) => e.name).toList(),
                    selectedItem: controller.selectedCourse.value.isEmpty
                        ? null
                        : controller.selectedCourse.value,
                    popupProps: PopupProps.dialog(
                      showSearchBox: true,
                      title: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Select Course",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    validator: (value) =>
                        AdminValidators.validateEmptyText("Course", value),
                    onChanged: (value) => controller.selectCourse(value!),
                  ),
                ),
                SizedBox(height: AdminSizes.spaceBtwInputFields),

                // ============= TITLE ============
                TextFormField(
                  controller: controller.titleController,
                  validator: (value) =>
                      AdminValidators.validateEmptyText('Title', value),
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    prefixIcon: Icon(Iconsax.text),
                  ),
                ),
                SizedBox(height: AdminSizes.spaceBtwInputFields),

                // ============= SUBTITLE ============
                TextFormField(
                  controller: controller.subtitleController,
                  decoration: const InputDecoration(
                    labelText: 'Subtitle (optional)',
                    prefixIcon: Icon(Iconsax.text_block),
                  ),
                ),
                SizedBox(height: AdminSizes.spaceBtwInputFields),

                // ============= LOCK SWITCH ============
                Obx(
                  () => CheckboxMenuButton(
                    value: controller.lessonLock.value,
                    onChanged: (value) {
                      controller.lessonLock.value = value ?? false;
                    },
                    child: const Text("Lesson Locked"),
                  ),
                ),
                SizedBox(height: AdminSizes.spaceBtwInputFields * 2),

                // ============= UPDATE BUTTON ============
                SizedBox(
                  width: double.infinity,
                  child: Obx(
                    () => ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : () => controller.updateLesson(lesson),
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : const Text('Update'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
