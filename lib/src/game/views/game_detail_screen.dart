import 'package:flutter/material.dart';
import 'package:game_ticket/src/game/game_controller.dart';
import 'package:game_ticket/src/main/main_controller.dart';
import 'package:game_ticket/src/main/main_screen.dart';
import 'package:game_ticket/utils/bubble_indicator.dart';
import 'package:game_ticket/utils/constants.dart';
import 'package:game_ticket/widgets/float_btn.dart';
import 'package:get/get.dart';

class GameDetailScreen extends StatefulWidget {
  static const String routeName = '/game-details';

  const GameDetailScreen({Key? key}) : super(key: key);

  @override
  State<GameDetailScreen> createState() => _GameDetailScreenState();
}

class _GameDetailScreenState extends State<GameDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatBtnWidget(),
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
            padding: const EdgeInsets.only(top: 50.0, right: 16.0, left: 16.0),
            child: Column(
              children: [
                _buildAppBarView(),
                const SizedBox(height: 20.0),
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  padding: const EdgeInsets.only(top: 28.0, bottom: 28.0, right: 16.0, left: 16.0),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Game ',
                          style: kTitleStyle.copyWith(color: primaryColor),
                          children: const <TextSpan>[
                            TextSpan(text: 'details', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text('Game type', style: kBodyStyle),
                      const SizedBox(height: 14.0),
                      const SizedBox(
                        height: 60.0,
                        child: TabScreenBuilder(),
                      ),
                      Text('Game Rounds', style: kBodyStyle),
                      const SizedBox(height: 14.0),
                      //! Add Counter
                      _buildGameCounterView(),
                      // const CounterWidget(),
                      const SizedBox(height: 14.0),
                      Text('Hits per Field', style: kBodyStyle),
                      const SizedBox(height: 14.0),
                      //! Add Counter
                      _buildHitPerFieldCounterView(),
                      // const CounterWidget(),
                      const SizedBox(height: 14.0),
                      Text('Who is Beginning?', style: kBodyStyle),
                      const SizedBox(height: 14.0),
                      _buildPlayerView(),
                      const SizedBox(height: 14.0),
                      Image.asset('assets/images/divider.png'),
                      const SizedBox(height: 14.0),
                      Center(
                        child: SizedBox(
                          width: 128.0,
                          height: 48.0,
                          child: ElevatedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('Next'),
                                SizedBox(width: 10.0),
                                Icon(Icons.arrow_forward_rounded),
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
                            onPressed: () {
                              Get.put(MainController()).isPlay = true;
                              Get.put(MainController()).update();
                              Get.back();
                            },
                          ),
                        ),
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
            onTap: () => Get.to(
              () => const MainScreen(),
              transition: Transition.leftToRight,
              duration: const Duration(milliseconds: 400),
            ),
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

  Widget _buildPlayerView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                'assets/images/person1.png',
                width: 62.0,
                height: 62.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text('Helena', style: TextStyle(color: Colors.white)),
          ],
        ),
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                'assets/images/person2.png',
                width: 62.0,
                height: 62.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text('Selena', style: TextStyle(color: Colors.white)),
          ],
        ),
        Column(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(70.0),
                ),
                child: Image.asset(
                  'assets/icons/bull.png',
                  width: 20.0,
                  height: 20.0,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            const Text('Hit the Bull', style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }

  Widget _buildGameCounterView() {
    return GetBuilder<GameController>(
      init: GameController(),
      builder: (gameController) => Row(
        children: [
          InkWell(
            onTap: () => gameController.decreament(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                color: Colors.white,
              ),
              child: const Icon(
                Icons.remove,
                color: Colors.black87,
              ),
            ),
          ),
          Container(
            width: 50.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            // padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
            child: Center(
              child: Text(
                '${gameController.gameRoundCounter}',
                style: kBodyStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     color: primaryColor,
          //     borderRadius: BorderRadius.circular(8.0),
          //   ),
          //   padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
          //   child: AnimatedTextKit(
          //     isRepeatingAnimation: false,
          //     pause: const Duration(milliseconds: 800),
          //     animatedTexts: [
          //       RotateAnimatedText(
          //         '1',
          //         rotateOut: false,
          //         // transitionHeight: 20.0,
          //         duration: const Duration(milliseconds: 800),
          //         textStyle: kBodyStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 17.0),
          //       ),
          //     ],
          //     onTap: () {
          //       print("Tap Event");
          //     },
          //   ),
          // ),
          InkWell(
            onTap: () => gameController.increament(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                color: Colors.white,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHitPerFieldCounterView() {
    return GetBuilder<GameController>(
      init: GameController(),
      builder: (gameController) => Row(
        children: [
          InkWell(
            onTap: () => gameController.decreamentHit(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                color: Colors.white,
              ),
              child: const Icon(
                Icons.remove,
                color: Colors.black87,
              ),
            ),
          ),
          Container(
            width: 50.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                '${gameController.hitsCounter}',
                style: kBodyStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
          ),
          InkWell(
            onTap: () => gameController.increamentHit(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                color: Colors.white,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabScreenBuilder extends StatefulWidget {
  const TabScreenBuilder({Key? key}) : super(key: key);

  @override
  _TabScreenBuilderState createState() => _TabScreenBuilderState();
}

class _TabScreenBuilderState extends State<TabScreenBuilder> with SingleTickerProviderStateMixin {
  PageController? _pageController;

  Color left = Colors.white;
  Color right = Colors.grey;

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              // gradient: LinearGradient(
              //   colors: <Color>[
              //     primaryColor,
              //     primaryColor.withOpacity(0.8),
              //   ],
              //   begin: const FractionalOffset(0.0, 0.0),
              //   end: const FractionalOffset(1.0, 1.0),
              //   stops: const <double>[0.0, 1.0],
              //   tileMode: TileMode.clamp,
              // ),
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _buildMenuBar(context),
              Expanded(
                flex: 4,
                child: PageView(
                  controller: _pageController,
                  physics: const ClampingScrollPhysics(),
                  onPageChanged: (int i) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (i == 0) {
                      setState(() {
                        right = Colors.grey;
                        left = Colors.white;
                      });
                    } else if (i == 1) {
                      setState(() {
                        right = Colors.white;
                        left = Colors.grey;
                      });
                    }
                  },
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: const Text(''),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: const Text(''),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 280.0,
      height: 42.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      child: CustomPaint(
        painter: BubbleIndicatorPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: TextButton(
                onPressed: _onSignInButtonPress,
                child: Text(
                  'Basic Game',
                  style: TextStyle(
                    color: left,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: _onSignUpButtonPress,
                child: Text(
                  'Custom Game',
                  style: TextStyle(
                    color: right,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController?.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
