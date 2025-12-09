import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/screens/course/create_course/controllers/create_course_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';

class PriceSection extends StatelessWidget {
  const PriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CreateCourseController.instance;

    return AdminRoundedContainer(
      child: Form(
        key: controller.priceSectionForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Price and Other Details",
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const Gap(AdminSizes.spaceBtwItems),

            /// Selling Price & MRP
            LayoutBuilder(
              builder: (context, _) => AdminHelperFunctions.isWidthValid(500)
                  ? Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Selling Price (₹)",
                          ),
                          validator: (value) =>
                              AdminValidators.validateEmptyText(
                                "selling price",
                                value,
                              ),
                          controller: controller.priceController,
                          keyboardType: TextInputType.number,
                        ),
                        const Gap(AdminSizes.spaceBtwInputFields),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "MRP Price (₹)",
                          ),
                          controller: controller.mrpPriceController,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              AdminValidators.validateEmptyText(
                                "MRP price",
                                value,
                              ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Selling Price (₹)",
                            ),
                            validator: (value) =>
                                AdminValidators.validateEmptyText(
                                  "selling price",
                                  value,
                                ),
                            controller: controller.priceController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const Gap(AdminSizes.spaceBtwInputFields),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "MRP Price (₹)",
                            ),
                            controller: controller.mrpPriceController,
                            keyboardType: TextInputType.number,
                            validator: (value) =>
                                AdminValidators.validateEmptyText(
                                  "MRP price",
                                  value,
                                ),
                          ),
                        ),
                      ],
                    ),
            ),

            const Gap(AdminSizes.spaceBtwInputFields),

            /// Language & Duration
            LayoutBuilder(
              builder: (context, _) => AdminHelperFunctions.isWidthValid(500)
                  ? Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Language",
                          ),
                          controller: controller.languageController,
                          validator: (value) =>
                              AdminValidators.validateEmptyText(
                                "language",
                                value,
                              ),
                        ),
                        const Gap(AdminSizes.spaceBtwInputFields),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Duration (minutes)",
                          ),
                          controller: controller.durationController,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              AdminValidators.validateEmptyText(
                                "duration",
                                value,
                              ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Language",
                            ),
                            controller: controller.languageController,
                            validator: (value) =>
                                AdminValidators.validateEmptyText(
                                  "language",
                                  value,
                                ),
                          ),
                        ),
                        const Gap(AdminSizes.spaceBtwInputFields),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Duration (minutes)",
                            ),
                            controller: controller.durationController,
                            keyboardType: TextInputType.number,
                            validator: (value) =>
                                AdminValidators.validateEmptyText(
                                  "duration",
                                  value,
                                ),
                          ),
                        ),
                      ],
                    ),
            ),

            const Gap(AdminSizes.spaceBtwInputFields),

            /// Enrolled
            TextFormField(
              decoration: const InputDecoration(labelText: "Enrolled Learners"),
              controller: controller.enrolledLearnersController,
              keyboardType: TextInputType.number,
            ),

            const Gap(AdminSizes.spaceBtwInputFields),

            /// class completed + satisfaction
            LayoutBuilder(
              builder: (context, _) => AdminHelperFunctions.isWidthValid(500)
                  ? Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "class Completed",
                          ),
                          controller: controller.classCompletedController,
                        ),
                        const Gap(AdminSizes.spaceBtwInputFields),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Satisfaction",
                          ),
                          controller: controller.satisfactionController,
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "class Completed",
                            ),
                            controller: controller.classCompletedController,
                          ),
                        ),
                        const Gap(AdminSizes.spaceBtwInputFields),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Satisfaction",
                            ),
                            controller: controller.satisfactionController,
                          ),
                        ),
                      ],
                    ),
            ),

            const Gap(AdminSizes.spaceBtwInputFields),

            /// Purchased show
            Obx(
              () => CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Purchased Courses Show'),
                value: controller.purchasedCoursesShow.value,
                onChanged: (value) {
                  controller.purchasedCoursesShow.value = value ?? false;
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),

            const Gap(AdminSizes.spaceBtwInputFields),

            Obx(
              () => ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : controller.createCourse,
                child: controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : const Text("Create Course"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
