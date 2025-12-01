import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/screens/course/edit_course/controllers/edit_course_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';

class EditTitleSection extends StatelessWidget {
  const EditTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = EditCourseController.instance;
    return AdminRoundedContainer(
      child: Form(
        key: controller.nameSectionForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Information Title
            Text(
              "Basic Information",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Gap(AdminSizes.spaceBtwItems),

            // workshop title
            TextFormField(
              validator: (value) =>
                  AdminValidators.validateEmptyText("title", value),
              decoration: const InputDecoration(labelText: "Title"),
              controller: controller.nameController,
            ),
            const Gap(AdminSizes.spaceBtwInputFields),

            // workshop
            Obx(
              () => DropdownSearch<String>(
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(labelText: "Category"),
                ),
                items: (filter, infiniteScrollProps) => [
                  ...controller.categoryList.map((e) => e.name),
                ],
                selectedItem: controller.selectedCategory.value.isEmpty
                    ? null
                    : controller.selectedCategory.value,
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
                      "Select Category",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      labelText: "Search Category...",
                      hintText: "Type to search Category",
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
                    AdminValidators.validateEmptyText("Category", value),
                onChanged: (value) => controller.selectCategory(value!),
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
