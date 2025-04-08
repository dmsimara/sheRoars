import 'package:flutter/material.dart';
import 'package:to_yudi/src/constants/colors.dart';
import 'package:to_yudi/src/constants/image_strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_yudi/src/features/authentication/screens/dashboards/user_screen.dart';
import 'package:to_yudi/src/features/authentication/screens/users/add_report_screen.dart';
import 'package:to_yudi/src/features/authentication/screens/users/classification_screen.dart';

class PinMapScreen extends StatelessWidget {
  const PinMapScreen({super.key});

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
            top: 100,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NEARBY',
                  style: GoogleFonts.kronaOne(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'DESTINATION',
                  style: GoogleFonts.kronaOne(
                    color: tPrimaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 170,
            left: 5,
            right: 5,
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white,
                  Colors.white,
                  Colors.transparent
                ],
                stops: [0.0, 0.2, 0.8, 1.0],
              ).createShader(bounds),
              blendMode: BlendMode.dstIn,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  tMaps,
                  height: 700,
                  fit: BoxFit.cover,
                ),
              ),
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
            bottom: 150,
            left: 30,
            right: 30,
            child: Column(
              children: [
                Container(
                  height: 75,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: tSecondaryColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PINNED LOCATION:',
                        style: GoogleFonts.kronaOne(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tPrimaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ClassificationScreen()),
                      );
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
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
