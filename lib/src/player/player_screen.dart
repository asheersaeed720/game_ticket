import 'package:flutter/material.dart';
import 'package:game_ticket/utils/constants.dart';

class PlayerScreen extends StatelessWidget {
  static const String routeName = '/player';

  PlayerScreen({Key? key}) : super(key: key);

  final List<Widget> _playersList = [
    Wrap(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 18.0),
          padding: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(32.0),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 32.0,
          ),
        ),
      ],
    ),
    Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.asset(
            'assets/images/person1.png',
            width: 96.0,
            height: 96.0,
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
            width: 96.0,
            height: 96.0,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8.0),
        const Text('Serena', style: TextStyle(color: Colors.white)),
      ],
    ),
    Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.asset(
            'assets/images/person3.png',
            width: 96.0,
            height: 96.0,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8.0),
        const Text('Julia', style: TextStyle(color: Colors.white)),
      ],
    ),
  ];

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
            padding: const EdgeInsets.only(top: 62.0, right: 18.0, left: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAppBarView(),
                const SizedBox(height: 38.0),
                RichText(
                  textAlign: TextAlign.right,
                  text: TextSpan(
                    text: 'Select ',
                    style: kTitleStyle.copyWith(fontSize: 22.0),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Players,',
                        style: kTitleStyle.copyWith(color: primaryColor, fontSize: 22.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),
                Container(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 96.0,
                                height: 96.0,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.0,
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              Text('Player 1', style: kBodyStyle)
                            ],
                          ),
                          const Text(
                            'VS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 38.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                width: 98.0,
                                height: 98.0,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.0,
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              Text('Player 2', style: kBodyStyle)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28.0),
                _buildAddPlayerSliderView(context),
                const SizedBox(height: 32.0),
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
                        backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAppBarView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ClipRRect(
          borderRadius: BorderRadius.circular(32.0),
          child: Image.asset(
            'assets/images/person1.png',
            width: 42.0,
            height: 42.0,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _buildAddPlayerSliderView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Add Players', style: kBodyStyle),
        const SizedBox(height: 18.0),
        SizedBox(
          height: 130.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) => _playersList[i],
            separatorBuilder: (context, i) => const SizedBox(width: 20.0),
            itemCount: _playersList.length,
          ),
        ),
      ],
    );
  }
}
