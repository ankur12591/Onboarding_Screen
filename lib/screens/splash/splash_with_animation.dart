import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:onboarding_screen/base_project/common/constants.dart';
import 'package:onboarding_screen/screens/animation/liquide_swipe_animation.dart';
import 'package:onboarding_screen/screens/components/default_button.dart';
import 'package:onboarding_screen/screens/sign_in/sign_in_screen.dart';
import 'package:onboarding_screen/screens/splash/splash_content.dart';
import 'dart:ui';
import 'package:flutter/material.dart';


class SplashScreen1 extends StatefulWidget {
  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  late double height, width;

  int currentPage = 0;
  List splashData = [
    {
      "text": "Welcome to Shopify, Let’s shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "We help people conect with store \naround India",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];

  final page = [



  ];


  ValueNotifier<double> _notifier = ValueNotifier(0.0);
  final _button = GlobalKey();
  final _pageController = PageController();

  @override
  void initState() {
    _pageController.addListener(() {
      _notifier.value = _pageController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: ColorConstants.primaryColor,
      body:
      Stack(
        children: [
          // Custom Painter
          AnimatedBuilder(
            animation: _notifier,
            builder: (_, __) => CustomPaint(
              painter: FlowPainter(
                context: context,
                notifier: _notifier,
                target: _button,
                colors: items,
              ),
            ),
          ),

          // PageView
          SizedBox(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child:
                  // Container(
                  //   color: Colors.green,
                  // )
                  PageView.builder(
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => SplashContent(
                      //image: splashData[index]["image"],
                      image: splashData[index]["image"],

                      text: splashData[index]['text'],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.06 * width,
                      //getProportionateScreenWidth(20)
                    ),
                    child: Column(
                      children: <Widget>[
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            splashData.length,
                                (index) => buildDot(index: index),
                          ),
                        ),
                        Spacer(flex: 3),
                        DefaultButton(
                          text: "Continue",
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LiquideSwipe()
                                  //SignInScreen()
                                )
                            );
                          },
                          //  press: () {
                          // Navigator.pushNamed(context, SignInScreen.routeName);
                          // },
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Anchor Button
          IgnorePointer(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(bottom: 110),
                child: ClipOval(
                  child: AnimatedBuilder(
                    animation: _notifier,
                    builder: (_, __) {
                      final animatorVal =
                          _notifier.value - _notifier.value.floor();
                      double opacity = 0, iconPos = 0;
                      int colorIndex;
                      if (animatorVal < 0.5) {
                        opacity = (animatorVal - 0.5) * -2;
                        iconPos = 80 * -animatorVal;
                        colorIndex = _notifier.value.floor() + 1;
                      } else {
                        colorIndex = _notifier.value.floor() + 2;
                        iconPos = -80;
                      }
                      if (animatorVal > 0.9) {
                        iconPos = -250 * (1 - animatorVal) * 10;
                        opacity = (animatorVal - 0.9) * 10;
                      }
                      colorIndex = colorIndex % items.length;
                      return SizedBox(
                        key: _button,
                        width: 80,
                        height: 80,
                        child: Transform.translate(
                          offset: Offset(iconPos, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: items[colorIndex],
                            ),
                            child: Icon(
                              Icons.chevron_right,
                              color: Color(0xFFFF7643),
                              size: 30,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      // LiquidSwipe(
      //   pages: LiquidSwipe(
      //     pages: page,
      //     enableLoop: true,
      //     fullTransitionValue: 300,
      //     enableSideReveal: true,
      //
      //     //enableSlideIcon: true,
      //     waveType: WaveType.liquidReveal,
      //     positionSlideIcon: 0.5,
      //   ),,
      //   enableLoop: true,
      //   fullTransitionValue: 300,
      //   enableSideReveal: true,
      //
      //   //enableSlideIcon: true,
      //   waveType: WaveType.liquidReveal,
      //   positionSlideIcon: 0.5,
      // ),


      // SafeArea(
      //   child: SizedBox(
      //     width: double.infinity,
      //     child: Column(
      //       children: <Widget>[
      //         Expanded(
      //           flex: 3,
      //           child:
      //               // Container(
      //               //   color: Colors.green,
      //               // )
      //               PageView.builder(
      //             onPageChanged: (value) {
      //               setState(() {
      //                 currentPage = value;
      //               });
      //             },
      //             itemCount: splashData.length,
      //             itemBuilder: (context, index) => SplashContent(
      //               //image: splashData[index]["image"],
      //               image: splashData[index]["image"],
      //
      //               text: splashData[index]['text'],
      //             ),
      //           ),
      //         ),
      //         Expanded(
      //           flex: 2,
      //           child: Padding(
      //             padding: EdgeInsets.symmetric(
      //               horizontal: 0.06 * width,
      //               //getProportionateScreenWidth(20)
      //             ),
      //             child: Column(
      //               children: <Widget>[
      //                 Spacer(),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: List.generate(
      //                     splashData.length,
      //                     (index) => buildDot(index: index),
      //                   ),
      //                 ),
      //                 Spacer(flex: 3),
      //                 DefaultButton(
      //                   text: "Continue",
      //                   press: () {
      //                     Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                             builder: (context) =>
      //                             LiquideSwipe()
      //                                 //SignInScreen()
      //                         )
      //                     );
      //                   },
      //                   //  press: () {
      //                   // Navigator.pushNamed(context, SignInScreen.routeName);
      //                   // },
      //                 ),
      //                 Spacer(),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}










const items = [
  Color(0xFFFDE0D9),
  Color(0xffF5F0E6),
  Color(0xffEEEFF2),
  Color(0xFFFCFFE9),
  Color(0xffff9100),
  Color(0xFFFB7883),
  Color(0xffff1744),
  Color(0xffff9100),
  Color(0xff00695c),
  Color(0xff5c6bc0),
  Color(0xff37474f),
  Color(0xfff50057),
];





class FlowPainter extends CustomPainter {
  final BuildContext context;
  final ValueNotifier<double> notifier;
  final GlobalKey target;
  final List<Color> colors;

  RenderBox? _renderBox;

  FlowPainter({required this.context, required this.notifier, required this.target, required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    final screen = MediaQuery.of(context).size;
    if (_renderBox == null) {
      _renderBox = target.currentContext!.findRenderObject() as RenderBox?;
    }
    if (_renderBox == null || notifier == null) return;
    final page = notifier.value.floor();
    final animatorVal = notifier.value - page;
    final targetPos = _renderBox!.localToGlobal(Offset.zero);
    final xScale = screen.height * 8, yScale = xScale / 2;
    var curvedVal = Curves.easeInOut.transformInternal(animatorVal);
    final reverseVal = 1 - curvedVal;

    Paint buttonPaint = Paint(), bgPaint = Paint();
    Rect buttonRect, bgRect = Rect.fromLTWH(0, 0, screen.width, screen.height);

    if (animatorVal < 0.5) {
      bgPaint..color = colors[page % colors.length];
      buttonPaint..color = colors[(page + 1) % colors.length];
      buttonRect = Rect.fromLTRB(
        targetPos.dx - (xScale * curvedVal), //left
        targetPos.dy - (yScale * curvedVal), //top
        targetPos.dx + _renderBox!.size.width * reverseVal, //right
        targetPos.dy + _renderBox!.size.height + (yScale * curvedVal), //bottom
      );
    } else {
      bgPaint..color = colors[(page + 1) % colors.length];
      buttonPaint..color = colors[page % colors.length];
      buttonRect = Rect.fromLTRB(
        targetPos.dx + _renderBox!.size.width * reverseVal, //left
        targetPos.dy - yScale * reverseVal, //top
        targetPos.dx + _renderBox!.size.width + xScale * reverseVal, //right
        targetPos.dy + _renderBox!.size.height + yScale * reverseVal, //bottom
      );
    }

    canvas.drawRect(bgRect, bgPaint);
    canvas.drawRRect(
      RRect.fromRectAndRadius(buttonRect, Radius.circular(screen.height)),
      buttonPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
