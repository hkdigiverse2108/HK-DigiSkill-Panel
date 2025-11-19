import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/workshop_model.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';

class WorkshopController extends GetxController {
  static WorkshopController get instance => Get.find();

  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;

  var dataList = <WorkshopModel>[].obs;
  var filteredDataList = <WorkshopModel>[].obs;
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchWorkshops();
  }

  void fetchWorkshops() {
    // TODO: Replace with actual API call
    dataList.addAll(
      List.generate(
        20,
        (index) => WorkshopModel(
          id: index + 1,
          name: "Workshop ${index + 1}",
          description: 'Workshop Description ${index + 1}',
          image: AdminImages.profile,
          instructor: 'Instructor ${(index % 3) + 1}',
          startDate: DateTime.now().add(Duration(days: index)),
          endDate: DateTime.now().add(Duration(days: index + 2)),
          maxParticipants: 50,
          currentParticipants: (index * 2) % 50,
          isFeatured: index % 5 == 0,
          price: (index + 1) * 100.0,
          location: 'Location ${(index % 3) + 1}',
          category: 'Category ${(index % 5) + 1}',
        ),
      ),
    );

    filteredDataList.assignAll(dataList);
  }

  void sort(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;

    filteredDataList.sort((a, b) {
      int compareResult;
      switch (columnIndex) {
        case 0: // ID column
          compareResult = a.id.compareTo(b.id);
          break;
        case 1: // Name column
          compareResult = a.name.compareTo(b.name);
          break;
        case 2: // Instructor column
          compareResult = a.instructor.compareTo(b.instructor);
          break;
        case 3: // Start Date column
          compareResult = a.startDate.compareTo(b.startDate);
          break;
        case 4: // Participants column
          compareResult = a.currentParticipants.compareTo(
            b.currentParticipants,
          );
          break;
        default:
          return 0;
      }
      return ascending ? compareResult : -compareResult;
    });
  }

  void searchQuery(String query) {
    if (query.isEmpty) {
      filteredDataList.assignAll(dataList);
      update();
      return;
    }
    filteredDataList.clear();
    filteredDataList.assignAll(
      dataList.where(
        (workshop) =>
            workshop.name.toLowerCase().contains(query.toLowerCase()) ||
            workshop.category!.toLowerCase().contains(query.toLowerCase()),
      ),
    );
    update();
  }

  void deleteWorkshop(int id) {
    // TODO: Implement delete functionality with API call
    dataList.removeWhere((workshop) => workshop.id == id);
    filteredDataList.removeWhere((workshop) => workshop.id == id);
  }

  void toggleFeatured(int id) {
    // TODO: Implement toggle featured status with API call
    final index = dataList.indexWhere((workshop) => workshop.id == id);
    if (index != -1) {
      final workshop = dataList[index];
      dataList[index] = workshop.copyWith(isFeatured: !workshop.isFeatured);

      final filteredIndex = filteredDataList.indexWhere((w) => w.id == id);
      if (filteredIndex != -1) {
        filteredDataList[filteredIndex] = dataList[index];
      }
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
