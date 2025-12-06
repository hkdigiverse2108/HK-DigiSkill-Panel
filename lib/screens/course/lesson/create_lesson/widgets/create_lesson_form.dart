import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/screens/course/lesson/create_lesson/controllers/create_lesson_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';
import 'package:iconsax/iconsax.dart';

class CreateLessonForm extends GetView<CreateLessonController> {
  const CreateLessonForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminRoundedContainer(
      width: 700,
      padding: EdgeInsets.all(AdminSizes.defaultSpace),
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create Lesson',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: AdminSizes.spaceBtwSections),

            // =======================
            // COURSE DROPDOWN
            // =======================
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
                  showSearchBox: true,
                ),
                validator: (v) =>
                    AdminValidators.validateEmptyText("Course", v),
                onChanged: (value) => controller.selectCourse(value!),
              ),
            ),
            SizedBox(height: AdminSizes.spaceBtwInputFields),

            // TITLE
            TextFormField(
              controller: controller.titleController,
              validator: (v) => AdminValidators.validateEmptyText("Title", v),
              decoration: const InputDecoration(
                labelText: 'Title',
                prefixIcon: Icon(Iconsax.text),
              ),
            ),
            SizedBox(height: AdminSizes.spaceBtwInputFields),

            // SUBTITLE
            TextFormField(
              controller: controller.subtitleController,
              decoration: const InputDecoration(
                labelText: 'Subtitle (optional)',
                prefixIcon: Icon(Iconsax.text_block),
              ),
            ),
            SizedBox(height: AdminSizes.spaceBtwInputFields),

            // PRIORITY
            TextFormField(
              controller: controller.priorityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Priority',
                prefixIcon: Icon(Iconsax.ranking_1),
                hintText: 'Enter priority (higher number = higher priority)',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a priority';
                }
                final priority = int.tryParse(value);
                if (priority == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
            SizedBox(height: AdminSizes.spaceBtwInputFields),

            // LESSON LOCK SWITCH
            Obx(
              () => CheckboxMenuButton(
                value: controller.lessonLock.value,
                child: const Text("Lesson Locked"),
                onChanged: (value) {
                  controller.lessonLock.value = value ?? false;
                },
              ),
            ),
            SizedBox(height: AdminSizes.spaceBtwInputFields * 2),

            // SUBMIT BUTTON
            SizedBox(
              width: double.infinity,
              child: Obx(
                () => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.createLesson,
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text("Create Lesson"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
