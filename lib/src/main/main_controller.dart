import 'package:get/get.dart';

class MainController extends GetxController {
  bool isPlay = false;

  String gameName = 'Your Game Name';

  void editGameName() {
    gameName = 'Cricket Fiesta';
    update();
  }
}
