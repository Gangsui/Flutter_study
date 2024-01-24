import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'WelcomeScreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    // animation = CurvedAnimation(parent: controller, curve: Curves.slowMiddle);

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset(
                      'images/logo.png',
                    ),
                    height: 100,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFF7B914),
                      ),
                    ),
                  ],
                  isRepeatingAnimation: false,
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            buttonWidget(
              text: 'Log In',
              color: Colors.lightBlueAccent,
              function: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            buttonWidget(
                color: Colors.blueAccent,
                function: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
                text: 'Register'),
          ],
        ),
      ),
    );
  }
}


class buttonWidget extends StatelessWidget {
  buttonWidget(
      {required this.color, required this.function, required this.text});

  final Color color;
  final String text;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: function,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}


