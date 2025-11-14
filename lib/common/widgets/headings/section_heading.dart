import 'package:flutter/material.dart';

class AdminSectionHeading extends StatelessWidget {
  const AdminSectionHeading({
    super.key,
    this.textColor,
    required this.title,
    this.rightSideWidget,
  });

  final Color? textColor;
  final String title;
  final Widget? rightSideWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (rightSideWidget != null) rightSideWidget!,
      ],
    );
  }
}
