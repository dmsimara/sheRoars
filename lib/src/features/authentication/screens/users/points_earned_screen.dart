import 'package:flutter/material.dart';
import 'package:to_yudi/src/constants/colors.dart';
import 'package:to_yudi/src/constants/image_strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_yudi/src/features/authentication/screens/dashboards/user_screen.dart';
import 'package:to_yudi/src/features/authentication/screens/users/add_report_screen.dart';

class ClassificationScreen extends StatelessWidget {
  const ClassificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [tTertiaryColor, tSecondaryColor],
              ),
            ),
          ),
          Positioned.fill(
            child: Image.asset(
              tOverlay,
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.2),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Positioned(
            top: 30,
            left: 25,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            top: 35,
            left: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HELLO',
                  style: GoogleFonts.kronaOne(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'User 1!',
                  style: GoogleFonts.kronaOne(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 45,
            right: 120,
            child: const Icon(
              Icons.notifications,
              color: Colors.white,
              size: 25,
            ),
          ),
          Positioned(
            top: 5,
            right: 18,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(tLogo),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.home, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 400),
                            pageBuilder: (context, animation, secondaryAnimation) =>
                                UserDashboardScreen(),
                            transitionsBuilder: (
                              context,
                              animation,
                              secondaryAnimation,
                              child,
                            ) {
                              final begin = Offset(0.0, 1.0);
                              final end = Offset.zero;
                              final curve = Curves.ease;

                              final tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));

                              final offsetAnimation = animation.drive(tween);

                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.show_chart, color: Colors.white),
                      onPressed: () {},
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: tPrimaryColor,
                      child: IconButton(
                        icon: Icon(Icons.add, color: Colors.white, size: 30),
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 400),
                              pageBuilder: (context, animation, secondaryAnimation) =>
                                  AddReportScreen(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) {
                                final begin = Offset(0.0, 1.0);
                                final end = Offset.zero;
                                final curve = Curves.ease;

                                final tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));
                                final offsetAnimation = animation.drive(tween);

                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.history, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.more_horiz, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
