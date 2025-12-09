import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/animations/animation_loader.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';
import 'package:iconsax/iconsax.dart';

class AdminPaginatedDataTable extends StatelessWidget {
  const AdminPaginatedDataTable({
    super.key,
    this.sortAscending = true,
    this.sortColumnIndex,
    this.rowPerPage = 10,
    required this.source,
    required this.columns,
    this.onPageChanged,
    this.dataRowHeight = AdminSizes.xl * 2,
    this.tableHeight = 760,
    this.minWidth = 1000,
    this.showCheckboxColumn = false,
  });

  /// Whether the data is sorted in ascending order.
  final bool sortAscending;

  /// Index of the column to sort by.
  final int? sortColumnIndex;

  final int rowPerPage;

  final DataTableSource source;

  final List<DataColumn> columns;

  final Function(int)? onPageChanged;

  final double dataRowHeight;

  final double tableHeight;

  final double? minWidth;

  final bool showCheckboxColumn;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tableHeight,
      child: Theme(
        data: Theme.of(
          context,
        ).copyWith(cardTheme: CardThemeData(elevation: 0)),
        child: PaginatedDataTable2(
          columns: columns,
          source: source,
          columnSpacing: 12,
          minWidth: minWidth,
          dividerThickness: 0,
          horizontalMargin: 12,
          dataRowHeight: dataRowHeight,
          rowsPerPage: rowPerPage,
          sortAscending: sortAscending,
          sortColumnIndex: sortColumnIndex,
          sortArrowBuilder: (ascending, sorted) {
            if (sorted) {
              return Icon(
                ascending ? Iconsax.arrow_up_3 : Iconsax.arrow_down,
                size: AdminSizes.iconSm,
              );
            } else {
              return const Icon(Iconsax.arrow_3, size: AdminSizes.iconSm);
            }
          },
          headingTextStyle: Theme.of(context).textTheme.titleMedium,
          headingRowColor: WidgetStateProperty.resolveWith(
            (states) => AdminHelperFunctions.isDarkMode(context)
                ? AdminColors.dark
                : AdminColors.light,
          ),
          headingRowDecoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AdminSizes.borderRadiusMd),
              topRight: Radius.circular(AdminSizes.borderRadiusMd),
            ),
          ),
          showCheckboxColumn: showCheckboxColumn,
          onPageChanged: onPageChanged,
          showFirstLastButtons: true,
          // renderEmptyRowsInTheEnd: false,
          onRowsPerPageChanged: (value) {},

          empty: Center(
            child: AdminAnimationLoaderWidget(
              text: 'Nothing Found',
              animation: AdminImages.emptyAnimation,
              height: 200,
              width: 200,
            ),
          ),
        ),
      ),
    );
  }
}
