import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/screens/course/curriculum/create_curriculum/controllers/create_course_curriculum_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';

class CurriculumTitleAndDescription extends StatelessWidget {
  const CurriculumTitleAndDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CreateCourseCurriculumController.instance;
    return AdminRoundedContainer(
      child: Form(
        key: controller.titleSectionForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Information Title
            Text(
              "Basic Information",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Gap(AdminSizes.spaceBtwItems),

            // course title
            TextFormField(
              validator: (value) =>
                  AdminValidators.validateEmptyText("title", value),
              decoration: const InputDecoration(labelText: "Title"),
              controller: controller.titleController,
            ),
            const Gap(AdminSizes.spaceBtwInputFields),

            // course
            Obx(
              () => DropdownSearch<String>(
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(labelText: "course"),
                ),
                items: (filter, infiniteScrollProps) => [
                  ...controller.courseList.map((e) => e.name),
                ],
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
                      "Select course",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      labelText: "Search course...",
                      hintText: "Type to search courses",
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade50,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                    ),
                  ),
                ),
                validator: (value) =>
                    AdminValidators.validateEmptyText("course", value),
                onChanged: (value) => controller.selectCourse(value!),
              ),
            ),
            const Gap(AdminSizes.spaceBtwInputFields),

            // Description
            SizedBox(
              height: 200,
              child: TextFormField(
                controller: controller.descriptionController,
                expands: true,
                maxLines: null,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.multiline,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  labelText: "Description (Optional)",
                  hintText: "Add Description here...",
                  alignLabelWithHint: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
