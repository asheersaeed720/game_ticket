import 'package:get/get.dart';

class GameController extends GetxController {
  int gameRoundCounter = 0;
  int hitsCounter = 0;
  void increament() {
    gameRoundCounter++;
    update();
  }

  void decreament() {
    if (gameRoundCounter > 0) {
      gameRoundCounter--;
    }
    update();
  }

  void increamentHit() {
    hitsCounter++;
    update();
  }

  void decreamentHit() {
    if (hitsCounter > 0) {
      hitsCounter--;
    }
    update();
  }
}
