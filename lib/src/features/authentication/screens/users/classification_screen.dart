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
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [tTertiaryColor, tSecondaryColor],
              ),
            ),
          ),

          // Overlay image
          Positioned.fill(
            child: Image.asset(
              tOverlay,
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.2),
              colorBlendMode: BlendMode.darken,
            ),
          ),

          // Grey square (avatar placeholder)
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

          // Hello User Text
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

          // Notification icon
          Positioned(
            top: 45,
            right: 120,
            child: const Icon(
              Icons.notifications,
              color: Colors.white,
              size: 25,
            ),
          ),

          // Logo
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

          // Welcome progress text
          Positioned(
            top: 120,
            left: 30,
            right: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PROGRESS',
                  style: GoogleFonts.kronaOne(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'STARTED!',
                  style: GoogleFonts.kronaOne(
                    color: tPrimaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "You're on the map. Report confirmed!",
                  style: GoogleFonts.kronaOne(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),

          // Gradient Box with rounded corners + top curve + bottom fade
          Positioned(
            top: 230,
            left: 20,
            right: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  // Main box with top curve using CustomPaint
                  ClipPath(
                    clipper: TopCurveClipper(),
                    child: Container(
                      height: 590,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            tSecondaryColor,
                            tTertiaryColor,
                          ],
                        ),
                      ),
                    ),
                  ),

                  // tMaps image inside the box
                  Positioned(
                    top: 70,
                    left: 20,
                    right: 20,
                    child: Image.asset(
                      tMaps,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Fade effect at the bottom
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.3),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom navigation
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
                    icon: const Icon(Icons.home, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 400),
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              const UserDashboardScreen(),
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) {
                            final begin = const Offset(0.0, 1.0);
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
                    icon: const Icon(Icons.show_chart, color: Colors.white),
                    onPressed: () {},
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: tPrimaryColor,
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Colors.white, size: 30),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(milliseconds: 400),
                            pageBuilder: (context, animation, secondaryAnimation) =>
                                const AddReportScreen(),
                            transitionsBuilder: (
                              context,
                              animation,
                              secondaryAnimation,
                              child,
                            ) {
                              final begin = const Offset(0.0, 1.0);
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
                    icon: const Icon(Icons.history, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_horiz, color: Colors.white),
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

// Custom clipper for top center semi-circle cutout
class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double curveRadius = 50;
    final double curveWidth = 100;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo((size.width - curveWidth) / 2, 0);
    path.quadraticBezierTo(
      size.width / 2,
      curveRadius * 2,
      (size.width + curveWidth) / 2,
      0,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
