import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/screens/workshop/curriculum/edit_curriculum/controllers/edit_workshop_curriculum_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';
import 'package:iconsax/iconsax.dart';

class ResourceSection extends StatelessWidget {
  const ResourceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = EditWorkshopCurriculumController.instance;
    return AdminRoundedContainer(
      child: Form(
        key: controller.resourceSectionForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Information Title
            Text(
              "Curriculum Resource",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Gap(AdminSizes.spaceBtwItems),

            TextFormField(
              decoration: const InputDecoration(labelText: "Video URL"),
              validator: (value) =>
                  AdminValidators.validateEmptyText("video url", value),
              controller: controller.videoUrlController,
            ),
            const Gap(AdminSizes.spaceBtwInputFields),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Curriculum Date",
                suffixIcon: InkWell(
                  child: Icon(Iconsax.calendar_1),
                  onTap: () async {
                    controller.dateController.text =
                        await controller.pickDate(context) ??
                        controller.dateController.text;
                  },
                ),
              ),
              controller: controller.dateController,
            ),
            const Gap(AdminSizes.spaceBtwInputFields),

            TextFormField(
              validator: (value) =>
                  AdminValidators.validateEmptyText("Duration", value),
              decoration: const InputDecoration(labelText: "Duration"),
              controller: controller.durationController,
            ),
            const Gap(AdminSizes.spaceBtwInputFields),

            TextFormField(
              decoration: const InputDecoration(
                labelText: "Priority (In Number)",
                hintText: "Ex 1 or 2",
              ),
              controller: controller.priorityController,
            ),
          ],
        ),
      ),
    );
  }
}
