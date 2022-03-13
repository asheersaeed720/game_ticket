import 'package:flutter/material.dart';
import 'package:game_ticket/src/game/views/game_detail_screen.dart';
import 'package:game_ticket/src/game/views/select_game_screen.dart';
import 'package:game_ticket/src/main/main_controller.dart';
import 'package:game_ticket/src/player/select_player_screen.dart';
import 'package:game_ticket/utils/constants.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = '/main';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: primaryColor),
            borderRadius: BorderRadius.circular(32.0)),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.border_all_rounded,
            color: primaryColor,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 62.0, right: 16.0, left: 16.0),
            child: Column(
              children: [
                _buildAppBarView(),
                const SizedBox(height: 20.0),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  padding: const EdgeInsets.only(top: 30.0, bottom: 26.0, right: 16.0, left: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.3),
                        Colors.white.withOpacity(0.1),
                      ],
                    ),
                  ),
                  child: GetBuilder<MainController>(
                      init: MainController(),
                      builder: (mainController) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GetBuilder<MainController>(
                              init: MainController(),
                              builder: (mainController) => Row(
                                children: [
                                  Text(mainController.gameName, style: kTitleStyle),
                                  const SizedBox(width: 10.0),
                                  InkWell(
                                    onTap: () {
                                      mainController.editGameName();
                                    },
                                    child: const Icon(Icons.edit, color: primaryColor, size: 18.0),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Text('Select a Game', style: kBodyStyle),
                            const SizedBox(height: 10.0),
                            Row(
                              children: [
                                Center(
                                  child: InkWell(
                                    onTap: () => Get.to(
                                      () => const SelectGameScreen(),
                                      transition: Transition.rightToLeft,
                                      duration: const Duration(milliseconds: 400),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(14.0),
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(32.0),
                                      ),
                                      child: const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 50.0),
                                Container(
                                  height: 52.0,
                                  width: 1.0,
                                  color: Colors.white30,
                                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Text('Add Players', style: kBodyStyle),
                            const SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () => Get.to(
                                    () => const AddPlayerScreen(),
                                    transition: Transition.rightToLeft,
                                    duration: const Duration(milliseconds: 400),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(14.0),
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                    child: const Icon(Icons.arrow_forward_ios_rounded,
                                        color: Colors.white),
                                  ),
                                ),
                                mainController.isPlay
                                    ? _buildGameDetailsView()
                                    : const SizedBox.shrink(),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Text('Details', style: kBodyStyle),
                            const SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () => Get.to(
                                    () => const GameDetailScreen(),
                                    transition: Transition.rightToLeft,
                                    duration: const Duration(milliseconds: 400),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(14.0),
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                    child: const Icon(Icons.arrow_forward_ios_rounded,
                                        color: Colors.white),
                                  ),
                                ),
                                mainController.isPlay
                                    ? _buildPlayerProfileView()
                                    : const SizedBox.shrink(),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            if (mainController.isPlay)
                              Center(
                                child: Image.asset('assets/images/barcode.png',
                                    height: 75.0, color: Colors.white),
                              ),
                            const SizedBox(height: 10.0),
                            if (mainController.isPlay)
                              ElevatedButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.play_arrow),
                                    SizedBox(width: 10.0),
                                    Text('Play'),
                                  ],
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                              ),
                          ],
                        );
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAppBarView() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: primaryColor),
            borderRadius: BorderRadius.circular(32.0),
          ),
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: primaryColor,
          ),
        ),
        const SizedBox(width: 20.0),
        RichText(
          text: const TextSpan(
            text: 'Create ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
            children: <TextSpan>[
              TextSpan(text: 'Game', style: TextStyle(color: primaryColor)),
              TextSpan(text: ' Ticket!'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGameDetailsView() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.asset(
            'assets/images/person1.png',
            width: 52.0,
            height: 52.0,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 14.0),
        const Text(
          'VS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(width: 14.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.asset(
            'assets/images/person2.png',
            width: 52.0,
            height: 52.0,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }

  Widget _buildPlayerProfileView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: 'Game Rounds      ',
            style: kBodyStyle,
            children: const <TextSpan>[
              TextSpan(text: '02', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0)),
            ],
          ),
        ),
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: 'Hit per Field           ',
            style: kBodyStyle,
            children: const <TextSpan>[
              TextSpan(text: '02', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0)),
            ],
          ),
        ),
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: 'Game type           ',
            style: kBodyStyle,
            children: const <TextSpan>[
              TextSpan(
                  text: 'Basic', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0)),
            ],
          ),
        ),
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: 'Beginner Name      ',
            style: kBodyStyle,
            children: const <TextSpan>[
              TextSpan(text: '02', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0)),
            ],
          ),
        ),
      ],
    );
  }
}
