import 'package:flutter/material.dart';
import 'package:game_ticket/src/game/views/game_info_screen.dart';
import 'package:game_ticket/src/main/main_screen.dart';
import 'package:game_ticket/utils/constants.dart';
import 'package:get/get.dart';

class SelectGameScreen extends StatelessWidget {
  static const String routeName = '/select-game';

  const SelectGameScreen({Key? key}) : super(key: key);

  void navigateToBack() {
    Get.to(
      () => const MainScreen(),
      transition: Transition.leftToRight,
      duration: const Duration(milliseconds: 400),
    );
  }

  void navigateToGameInfo(String gameName, dynamic iconPath, String desc) {
    Get.to(
      () => GameInfoScreen(gameName, iconPath, desc),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 400),
    );
  }

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
                  padding: const EdgeInsets.only(top: 30.0, bottom: 28.0, right: 16.0, left: 16.0),
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
                  child: _buildGameItemView(context),
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
          child: InkWell(
            onTap: () => navigateToBack(),
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: primaryColor,
            ),
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

  Widget _buildGameItemView(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: 'Select a ',
            style: kTitleStyle,
            children: <TextSpan>[
              TextSpan(text: 'Game,', style: kTitleStyle.copyWith(color: primaryColor)),
            ],
          ),
        ),
        const SizedBox(height: 28.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    InkWell(
                      onTap: () => navigateToBack(),
                      child: Container(
                        padding: const EdgeInsets.all(30.0),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Image.asset(
                          'assets/icons/cricket.png',
                          width: 56.0,
                          height: 56.0,
                        ),
                      ),
                    ),
                    Positioned(
                      right: -6,
                      child: InkWell(
                        onTap: () => navigateToGameInfo(
                            'Cricket', 'assets/icons/cricket.png', 'Cricket The classic'),
                        child: Container(
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          child: const Icon(Icons.info, color: Colors.black87),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Text('Cricket', style: kBodyStyle),
              ],
            ),
            Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    InkWell(
                      onTap: () => navigateToBack(),
                      child: Container(
                        padding: const EdgeInsets.all(30.0),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: const Icon(
                          Icons.timelapse_rounded,
                          size: 52.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      right: -6,
                      child: InkWell(
                        onTap: () => navigateToGameInfo(
                            'Around the clock', Icons.timelapse_rounded, 'Around the clock desc'),
                        child: Container(
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          child: const Icon(Icons.info, color: Colors.black87),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Text('Around the clock', style: kBodyStyle),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    InkWell(
                      onTap: () => navigateToBack(),
                      child: Container(
                        padding: const EdgeInsets.all(30.0),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Image.asset(
                          'assets/icons/121.png',
                          width: 56.0,
                          height: 56.0,
                        ),
                      ),
                    ),
                    Positioned(
                      right: -6,
                      child: InkWell(
                        onTap: () =>
                            navigateToGameInfo('121', 'assets/icons/121.png', '121 the desc'),
                        child: Container(
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          child: const Icon(Icons.info, color: Colors.black87),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Text('121', style: kBodyStyle),
              ],
            ),
            Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    InkWell(
                      onTap: () => navigateToBack(),
                      child: Container(
                        padding: const EdgeInsets.all(30.0),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Image.asset(
                          'assets/icons/170.png',
                          width: 56.0,
                          height: 56.0,
                        ),
                      ),
                    ),
                    Positioned(
                      right: -6,
                      child: InkWell(
                        onTap: () =>
                            navigateToGameInfo('170', 'assets/icons/170.png', '170 is desc'),
                        child: Container(
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          child: const Icon(Icons.info, color: Colors.black87),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Text('170', style: kBodyStyle),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
