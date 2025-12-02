import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/animations/animation_loader.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/images/image_uploader.dart';
import 'package:hkdigiskill_admin/data/models/testimonial_model.dart';
import 'package:hkdigiskill_admin/screens/workshop/testimonials/edit_testimonial/controllers/edit_testimonial_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';
import 'package:iconsax/iconsax.dart';

class WorkshopEditTestimonialForm
    extends GetView<WorkshopEditTestimonialController> {
  const WorkshopEditTestimonialForm({super.key, required this.item});

  final TestimonialModel item;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: WorkshopEditTestimonialController(),
      initState: (state) {
        controller.initItem(item);
      },
      builder: (controller) {
        return Obx(() {
          if (controller.workshopController.isLoading.value) {
            return const Center(
              child: AdminAnimationLoaderWidget(
                text: 'Loading Faqs',
                animation: AdminImages.loadingAnimation,
                height: 200,
                width: 200,
              ),
            );
          }
          return AdminRoundedContainer(
            width: 700,
            padding: EdgeInsets.all(AdminSizes.defaultSpace),
            child: Form(
              key: controller.editTestimonialFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Edit Testimonial',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: AdminSizes.spaceBtwSections),
                  TextFormField(
                    controller: controller.nameController,
                    validator: (v) =>
                        AdminValidators.validateEmptyText('Name', v),
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                  SizedBox(height: AdminSizes.spaceBtwInputFields),
                  // workshop
                  Obx(
                    () => DropdownSearch<String>(
                      decoratorProps: DropDownDecoratorProps(
                        decoration: InputDecoration(labelText: "Workshop"),
                      ),

                      // 👉 Load workshop titles
                      items: (filter, infiniteScrollProps) => [
                        ...controller.workshopList.map((e) => e.title),
                      ],

                      // 👉 Correct selected value binding
                      selectedItem:
                          controller.selectedWorkshopName.value.isEmpty
                          ? null
                          : controller.selectedWorkshopName.value,

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
                            "Select Workshop",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        showSearchBox: true,
                        searchFieldProps: TextFieldProps(
                          decoration: InputDecoration(
                            labelText: "Search workshop...",
                            hintText: "Type to search workshops",
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
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
                          AdminValidators.validateEmptyText("workshop", value),

                      // 👉 Proper selection handler
                      onChanged: (value) {
                        controller.selectWorkshop(value!);
                      },
                    ),
                  ),
                  SizedBox(height: AdminSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.designationController,
                    validator: (v) =>
                        AdminValidators.validateEmptyText('Designation', v),
                    decoration: const InputDecoration(
                      labelText: 'Designation',
                      prefixIcon: Icon(Iconsax.briefcase),
                    ),
                  ),
                  SizedBox(height: AdminSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description (optional)',
                      prefixIcon: Icon(Iconsax.document_text),
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: AdminSizes.spaceBtwInputFields),
                  Row(
                    children: [
                      Text('Rate'),
                      SizedBox(width: AdminSizes.spaceBtwItems),
                      Obx(
                        () => DropdownButton<int>(
                          value: controller.rate.value,
                          items: List.generate(
                            5,
                            (i) => DropdownMenuItem(
                              value: i + 1,
                              child: Text('${i + 1}'),
                            ),
                          ),
                          onChanged: (val) {
                            if (val != null) controller.rate.value = val;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AdminSizes.spaceBtwInputFields),
                  Obx(
                    () => AdminImageUploader(
                      width: 80,
                      height: 80,
                      image: controller.pickedImagePath.value.isEmpty
                          ? AdminImages.defaultImage
                          : controller.pickedImagePath.value,
                      imageType: controller.pickedImagePath.value.isEmpty
                          ? ImageType.asset
                          : controller.imageType.value,
                      onIconButtonPressed: controller.onIconButtonPressed,
                    ),
                  ),
                  SizedBox(height: AdminSizes.spaceBtwInputFields),
                  Obx(
                    () => CheckboxMenuButton(
                      value: controller.isFeatured.value,
                      onChanged: (value) {
                        controller.isFeatured.value = value ?? false;
                      },
                      child: const Text('Featured'),
                    ),
                  ),
                  SizedBox(height: AdminSizes.spaceBtwInputFields * 2),
                  Obx(
                    () => SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => controller.isLoading.value
                            ? null
                            : controller.updateItem(item),
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
        });
      },
    );
  }
}
