import 'package:flutter/material.dart';
import 'package:flutterlivedemo/src/data/model/user_model.dart';
import 'package:flutterlivedemo/src/data/repository/user_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var userModel = <UserModel>[].obs;
  var fiteruserModel = <UserModel>[];
  final UserRepository _userRepository = UserRepository();
  Rx<DateTime> startselectedDate = Rx(DateTime.now());
  Rx<DateTime> endselectedDate = Rx(DateTime.now());

  final TextEditingController textEditingController = TextEditingController();

  Map<int, Map<int, List<UserModel>>> groupedUsers = {};

  List<UserModel> filteredCandidates = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserList();
  }

  Future<void> getUserList() async {
    // var data=await _userRepository.fetchAllUsers();
    userModel = RxList(userList);
    groupedUsers.clear();
    for (var candidate in userModel) {
      final hireDate = candidate.hireDt!.split("-");
      final year = int.parse(hireDate[2]);
      final month = int.parse(hireDate[1]);

      groupedUsers.putIfAbsent(year, () => {});
      groupedUsers[year]!.putIfAbsent(month, () => []);
      groupedUsers[year]![month]!.add(candidate);
    }
  }

  Future<void> startPickDate() async {
    final pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: startselectedDate.value,
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null &&
        (pickedDate.isBefore(endselectedDate.value) ||
            endselectedDate.value == null)) {
      startselectedDate.value = pickedDate;
    } else {
      Get.snackbar("Error", "From Date to Select Not More then To Date",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> endPickDate() async {
    final pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: endselectedDate.value,
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null &&
        (pickedDate.isAfter(startselectedDate.value) ||
            startselectedDate.value == null)) {
      endselectedDate.value = pickedDate;
    } else {
      Get.snackbar("Error", "To Date to Select Not Less then From Date",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
