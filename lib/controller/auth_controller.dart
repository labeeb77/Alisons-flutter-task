import 'package:alisons_flutter_test/services/api_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final ApiServices _apiServices ;
  
  var isLoggedIn = false.obs;

  AuthController(this._apiServices);

  Future<bool> login(String emailPhone, String password) async {
    final success = await _apiServices.login(emailPhone, password);
    
    isLoggedIn.value = success;
    return success;
  }

  void logout() {
   
    Get.find<GetStorage>().remove('token');
    isLoggedIn.value = false;
  }
}