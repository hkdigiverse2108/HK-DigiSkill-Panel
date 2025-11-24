import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:hkdigiskill_admin/screens/gallery/all_gallery/controllers/gallery_controller.dart';
import 'package:hkdigiskill_admin/screens/gallery/all_gallery/table/table_source.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class GalleryTable extends StatelessWidget {
  const GalleryTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GalleryController.instance;

    return Obx(() {
      Visibility(
        visible: false,
        child: Text(controller.filteredDataList.length.toString()),
      );
      return AdminPaginatedDataTable(
        minWidth: 1000,
        tableHeight: 640,
        dataRowHeight: AdminSizes.xl * 1.8,
        sortAscending: controller.sortAscending.value,
        sortColumnIndex: controller.sortColumnIndex.value,
        onPageChanged: (page) {},
        source: GalleryDataSource(),
        columns: const [
          DataColumn2(label: Text('Title'), fixedWidth: 150),
          DataColumn2(label: Text('Images')),
          DataColumn2(label: Text('Actions'), fixedWidth: 120),
        ],
      );
    });
  }
}
