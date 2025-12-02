import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/screens/newsletter/create_newsletter/controllers/create_newsletter_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';
import 'package:iconsax/iconsax.dart';

class CreateNewsletterForm extends GetView<CreateNewsletterController> {
  const CreateNewsletterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminRoundedContainer(
      width: 600,
      padding: const EdgeInsets.all(AdminSizes.defaultSpace),
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Newsletter Subscriber",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),

            TextFormField(
              controller: controller.emailController,
              validator: AdminValidators.emailValidator,
              decoration: const InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Iconsax.sms),
              ),
            ),

            const SizedBox(height: 40),

            Obx(
              () => SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.createNewsletter,
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text("Add Subscriber"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
