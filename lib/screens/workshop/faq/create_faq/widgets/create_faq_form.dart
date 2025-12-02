import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/screens/workshop/faq/create_faq/controllers/create_faq_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/animations/animation_loader.dart'
    show AdminAnimationLoaderWidget;

class WorkshopCreateFaqForm extends GetView<WorkshopCreateFaqController> {
  const WorkshopCreateFaqForm({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create FAQ', style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: AdminSizes.spaceBtwSections),
              TextFormField(
                controller: controller.questionController,
                validator: (value) =>
                    AdminValidators.validateEmptyText('Question', value),
                decoration: const InputDecoration(
                  labelText: 'Question',
                  prefixIcon: Icon(Iconsax.message_question),
                ),
              ),
              SizedBox(height: AdminSizes.spaceBtwInputFields),
              TextFormField(
                controller: controller.answerController,
                validator: (value) =>
                    AdminValidators.validateEmptyText('Answer', value),
                decoration: const InputDecoration(
                  labelText: 'Answer',
                  prefixIcon: Icon(Iconsax.message_text),
                ),
                maxLines: 4,
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
                  selectedItem: controller.selectedWorkshopName.value.isEmpty
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
                      AdminValidators.validateEmptyText("workshop", value),

                  // 👉 Proper selection handler
                  onChanged: (value) {
                    controller.selectWorkshop(value!);
                  },
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.createFaq,
                  child: const Text('Create'),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
