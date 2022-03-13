import 'package:flutter/material.dart';
import 'package:game_ticket/src/game/views/select_game_screen.dart';
import 'package:game_ticket/utils/constants.dart';
import 'package:get/get.dart';

class GameInfoScreen extends StatelessWidget {
  static const String routeName = '/game-info';

  const GameInfoScreen(this.whichGame, this.whichIcon, this.whichDesc, {Key? key})
      : super(key: key);

  final String whichGame;
  final dynamic whichIcon;
  final String whichDesc;

  void navigateToBack() {
    Get.to(
      () => const SelectGameScreen(),
      transition: Transition.leftToRight,
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
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        whichGame,
                        style: kTitleStyle.copyWith(color: primaryColor),
                      ),
                      const SizedBox(height: 20.0),
                      InkWell(
                        onTap: () => navigateToBack(),
                        child: Container(
                          padding: const EdgeInsets.all(30.0),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(70.0),
                          ),
                          child: Image.asset(
                            'assets/icons/cricket.png',
                            width: 50.0,
                            height: 50.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Image.asset('assets/images/divider.png'),
                      const SizedBox(height: 20.0),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                        style: kBodyStyle,
                      ),
                    ],
                  ),
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
}
