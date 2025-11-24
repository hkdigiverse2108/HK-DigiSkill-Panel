import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';

class WorkshopTitleAndDescription extends StatelessWidget {
  const WorkshopTitleAndDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminRoundedContainer(
      child: Form(
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
              decoration: const InputDecoration(labelText: "Workshop Title"),
            ),
            const Gap(AdminSizes.spaceBtwInputFields),

            // workshop subtitle
            TextFormField(
              decoration: const InputDecoration(labelText: "Workshop SubTitle"),
            ),
            const Gap(AdminSizes.spaceBtwInputFields),

            // Description
            SizedBox(
              height: 200,
              child: TextFormField(
                expands: true,
                maxLines: null,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.multiline,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  labelText: "Description",
                  hintText: "Add Workshop Description here...",
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
