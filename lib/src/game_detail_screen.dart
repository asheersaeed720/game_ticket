import 'package:flutter/material.dart';
import 'package:game_ticket/src/counter.dart';
import 'package:game_ticket/src/ticket/create_ticket_screen.dart';
import 'package:game_ticket/utils/bubble_indicator.dart';
import 'package:game_ticket/utils/constants.dart';
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
                      const SizedBox(height: 18.0),
                      Text('Game type', style: kBodyStyle),
                      const SizedBox(height: 16.0),
                      const SizedBox(
                        height: 60.0,
                        child: TabScreenBuilder(),
                      ),
                      Text('Game Rounds', style: kBodyStyle),
                      const SizedBox(height: 16.0),
                      const StepperTouch(),
                      const SizedBox(height: 16.0),
                      Text('How you', style: kBodyStyle),
                      const SizedBox(height: 16.0),
                      const StepperTouch(),
                      const SizedBox(height: 16.0),
                      Text('Who is Begining', style: kBodyStyle),
                      const SizedBox(height: 16.0),
                      _buildPlayerView(),
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
              () => const CreateTicketScreen(),
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
                width: 82.0,
                height: 82.0,
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
                width: 82.0,
                height: 82.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text('Selena', style: TextStyle(color: Colors.white)),
          ],
        ),
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                'assets/images/person3.png',
                width: 82.0,
                height: 82.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text('Helena', style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
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
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
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
                    fontSize: 16.0,
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
                    fontSize: 16.0,
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
