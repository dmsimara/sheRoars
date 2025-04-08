import 'package:flutter/material.dart';
import 'package:to_yudi/src/constants/colors.dart';
import 'package:to_yudi/src/constants/text_strings.dart';
import 'package:to_yudi/src/constants/image_strings.dart';
import 'package:to_yudi/src/features/authentication/screens/welcome/welcome_screen.dart'; 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _imageAnimation;
  late Animation<double> _textOpacity;
  late Animation<double> _appNameOpacity;
  late Animation<double> _subTextOpacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    Future.delayed(const Duration(seconds: 1), () {
      _controller.forward();
    });

    _imageAnimation = Tween<double>(begin: 0, end: 460).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _textOpacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _appNameOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _subTextOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        _fadePageRoute(WelcomeScreen()), 
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  PageRouteBuilder _fadePageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        const curve = Curves.easeIn;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var opacity = animation.drive(tween);

        return FadeTransition(opacity: opacity, child: child);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.2,
            colors: [
              tTertiaryColor,
              tSecondaryColor,
            ],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _imageAnimation.value),
                        child: child,
                      );
                    },
                    child: Image.asset(
                      tSplashImage,
                      width: 60,
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeTransition(
                    opacity: _textOpacity,
                    child: Text.rich(
                      TextSpan(
                        text: 'Where do we \n',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(color: tWhiteColor),
                        children: [
                          TextSpan(
                            text: 'report this?',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(color: tPrimaryColor),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeTransition(
                    opacity: _appNameOpacity,
                    child: Image.asset(
                      tLogo,  
                      width: 160, 
                      height: 160,  
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 70.0), 
                child: FadeTransition(
                  opacity: _subTextOpacity,
                  child: Text.rich(
                    TextSpan(
                      text: 'Where do we ',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: tWhiteColor,
                            fontSize: 16, 
                          ),
                      children: [
                        TextSpan(
                          text: '\nreport this?',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: tPrimaryColor,
                                fontSize: 16, 
                              ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
