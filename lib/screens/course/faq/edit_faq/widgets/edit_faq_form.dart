import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/data/models/faq_model.dart';
import 'package:hkdigiskill_admin/screens/course/faq/edit_faq/controllers/edit_faq_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';
import 'package:iconsax/iconsax.dart';

class CourseEditFaqForm extends GetView<CourseEditFaqController> {
  const CourseEditFaqForm({super.key, required this.faq});

  final FaqModel faq;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CourseEditFaqController(),
      initState: (state) {
        controller.initFaq(faq);
      },
      builder: (controller) {
        return AdminRoundedContainer(
          width: 700,
          padding: EdgeInsets.all(AdminSizes.defaultSpace),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Edit FAQ', style: Theme.of(context).textTheme.titleLarge),
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
                    onPressed: () => controller.updateFaq(faq),
                    child: const Text('Update'),
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
