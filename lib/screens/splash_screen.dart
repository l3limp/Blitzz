import 'package:blitzz/screens/home_screen.dart';
import 'package:blitzz/screens/login_page.dart';
import 'package:blitzz/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

class Initialising extends StatefulWidget {
  const Initialising({Key? key}) : super(key: key);

  @override
  _InitialisingState createState() => _InitialisingState();
}

class _InitialisingState extends State<Initialising> {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    User? _user;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: FutureBuilder(
            future: Firebase.initializeApp(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final FirebaseAuth _auth = FirebaseAuth.instance;
                _user = _auth.currentUser;
                if (_user != null) {
                  return const HomeScreen();
                } else {
                  return const LoginPage();
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 700),
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation1 = Tween<Offset>(
    begin: const Offset(0.0, -1.0),
    end: const Offset(0.0, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  ));
  late final Animation<Offset> _offsetAnimation2 = Tween<Offset>(
    begin: const Offset(0.0, 1.0),
    end: const Offset(0.0, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  ));

  @override
  void initState() {
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 2;
    OurTheme _theme = OurTheme();
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/initialise');
        },
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.6,
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.55,
                              child: AnimationLimiter(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children:
                                      AnimationConfiguration.toStaggeredList(
                                    duration:
                                        const Duration(milliseconds: 1200),
                                    childAnimationBuilder: (widget) =>
                                        SlideAnimation(
                                      horizontalOffset: -50.0,
                                      child: FadeInAnimation(
                                        child: widget,
                                      ),
                                    ),
                                    children: [
                                      Text(
                                        "THINK\n",
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color: _theme.secondaryColor,
                                              letterSpacing: .5,
                                              fontSize: 30),
                                        ),
                                      ),
                                      Text(
                                        "TRAVEL?\n",
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color: _theme.primaryColor,
                                              letterSpacing: .5,
                                              fontSize: 30),
                                        ),
                                      ),
                                      Text(
                                        "THINK\n",
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color: _theme.secondaryColor,
                                              letterSpacing: .5,
                                              fontSize: 30),
                                        ),
                                      ),
                                      Hero(
                                        tag: 'tag',
                                        child: Material(
                                          color: Colors.transparent,
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: Center(
                                              child: Text(
                                                "BLITZZ\n",
                                                style: GoogleFonts.roboto(
                                                  textStyle: TextStyle(
                                                      color:
                                                          _theme.primaryColor,
                                                      letterSpacing: .5,
                                                      fontSize: 30),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                height: MediaQuery.of(context).size.height / 8),
                            Hero(
                              tag: 'logo',
                              child: Material(
                                color: Colors.transparent,
                                child: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    child: Image.asset(
                                        "assets/images/blitzz_logo.png")),
                              ),
                            ),
                          ],
                        ),
                      )),
                  SlideTransition(
                    position: _offsetAnimation1,
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * 0.2,
                        color: _theme.secondaryColor),
                  ),
                  SlideTransition(
                    position: _offsetAnimation2,
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * 0.2,
                        color: _theme.primaryColor),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
