import 'package:asadamatic/main.dart';
import 'package:asadamatic/src/mvc/views/legacyweather/constants/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  final Function? selectScreen;
  const WelcomeScreen({Key? key, this.selectScreen}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int currentPage = 0;
  final pageController = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: <Widget>[
          PageView(
            allowImplicitScrolling: true,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            pageSnapping: true,
            controller: pageController,
            children: <Widget>[
              const Page(
                asset: 'Assets/raining.png',
                title: 'WEATHER UPDATES',
                message: 'See current temperature & humidity',
              ),
              const Page(
                asset: 'Assets/cold.png',
                title: 'WEATHER FORECAST',
                message: 'Weather forecast for up to 5 days coming soon',
              ),
              ThirdPage(widget: widget),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: PageIndicator(currentPage: currentPage),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Visibility(
              visible: currentPage < 2 ? true : false,
              child: TextButton(
                child: const Text(
                  'Next',
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.only(right: 30.0, bottom: 15.0)),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final WelcomeScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
    const Image(
      image: AssetImage('assets/legacyweather/sunny.png'),
      height: 350.0,
      fit: BoxFit.contain,
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          'MULTIPLE LOCATIONS',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          margin: const EdgeInsets.only(right: 25.0, left: 25.0, top: 15.0),
          child: ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                vertical: 18.0,
              )),
              shape: MaterialStateProperty.all(
                ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            child: const Text(
              "Choose Location",
            ),
            onPressed: () {
              widget.selectScreen!();
            },
          ),
        ),
      ],
    )
      ],
    );
  }
}

class Page extends StatelessWidget {
  const Page({Key? key, this.asset, this.title, this.message})
      : super(key: key);

  final String? asset;
  final String? title;
  final String? message;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
    Image(
      image: AssetImage(asset!),
      height: 350.0,
    ),
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: <Widget>[
          Text(title!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5),
          const SizedBox(
            height: 8.0,
          ),
          Text(message!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6),
        ],
      ),
    )
      ],
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0, left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Indicator(
            positionIndex: 0,
            currentPage: currentPage,
          ),
          const SizedBox(
            width: 10,
          ),
          Indicator(
            positionIndex: 1,
            currentPage: currentPage,
          ),
          const SizedBox(
            width: 10,
          ),
          Indicator(
            positionIndex: 2,
            currentPage: currentPage,
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final int? positionIndex, currentPage;
  const Indicator({Key? key, this.currentPage, this.positionIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (_themeController) {
      final currentColor = _themeController.themeMode == ThemeMode.dark
          ? Colors.white
          : primaryColor;
      final normalColor = _themeController.themeMode == ThemeMode.dark
          ? Colors.white24
          : primaryColor.withOpacity(.3);
      return Container(
        height: 12,
        width: 12,
        decoration: BoxDecoration(
            color: positionIndex == currentPage ? currentColor : normalColor,
            borderRadius: BorderRadius.circular(100)),
      );
    });
  }
}
