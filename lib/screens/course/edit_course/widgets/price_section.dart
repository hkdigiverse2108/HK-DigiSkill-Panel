import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/data/models/course_model.dart';
import 'package:hkdigiskill_admin/screens/course/edit_course/controllers/edit_course_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';

class EditPriceSection extends StatelessWidget {
  const EditPriceSection({super.key, required this.courseModel});

  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    final controller = EditCourseController.instance;
    return AdminRoundedContainer(
      child: Form(
        key: controller.priceSectionForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Information Title
            Text(
              "Price and Other Details",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Gap(AdminSizes.spaceBtwItems),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Selling Price (₹)"),
                    validator: (value) => AdminValidators.validateEmptyText(
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
                    decoration: InputDecoration(labelText: "MRP Price (₹)"),
                    controller: controller.mrpPriceController,
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        AdminValidators.validateEmptyText("MRP price", value),
                  ),
                ),
              ],
            ),
            const Gap(AdminSizes.spaceBtwInputFields),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Language"),
                    controller: controller.languageController,
                    validator: (value) =>
                        AdminValidators.validateEmptyText("language", value),
                  ),
                ),
                const Gap(AdminSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Duration (minutes)",
                    ),
                    controller: controller.durationController,
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        AdminValidators.validateEmptyText("duration", value),
                  ),
                ),
              ],
            ),
            const Gap(AdminSizes.spaceBtwInputFields),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Enrolled Learners"),
                    controller: controller.enrolledLearnersController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const Gap(AdminSizes.spaceBtwInputFields),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "class Completed"),
                    controller: controller.classCompletedController,
                  ),
                ),

                const Gap(AdminSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Satisfaction"),
                    controller: controller.satisfactionController,
                  ),
                ),
              ],
            ),
            const Gap(AdminSizes.spaceBtwInputFields),
            // Featured Checkbox
            Obx(
              () => CheckboxListTile(
                contentPadding: EdgeInsets.all(0),
                title: const Text('Purchased Courses Show'),
                value: controller.purchasedCoursesShow.value,
                onChanged: (value) {
                  controller.purchasedCoursesShow.value = value ?? false;
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            const Gap(AdminSizes.spaceBtwInputFields),
            // Featured Checkbox
            Obx(
              () => ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : () {
                        controller.updateCourse(courseModel);
                      },
                child: controller.isLoading.value
                    ? CircularProgressIndicator()
                    : Text("Update Course"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
