import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/screens/legality/privacy_policy/controllers/privacy_policy_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class PrivacyPolicyForm extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return AdminRoundedContainer(
        padding: const EdgeInsets.all(AdminSizes.defaultSpace),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Privacy Policy",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: controller.contentController,
                maxLines: 15,
                decoration: const InputDecoration(
                  labelText: "Content",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: Obx(
                  () => ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.updateData,
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : const Text("Update"),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
