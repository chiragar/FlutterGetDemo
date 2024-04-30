import 'package:flutterlivedemo/src/data/model/user_model.dart';
import 'package:flutterlivedemo/src/data/repository/user_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  var userModel = <UserModel>[].obs;
  final UserRepository _userRepository = UserRepository();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserList();
  }

  Future<void> getUserList() async {
    // var data=await _userRepository.fetchAllUsers();

    userModel=RxList(userList);
  }
}