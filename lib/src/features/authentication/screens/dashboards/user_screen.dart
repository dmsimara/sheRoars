import 'package:flutter/material.dart';
import 'package:to_yudi/src/constants/colors.dart';
import 'package:to_yudi/src/constants/image_strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_yudi/src/features/authentication/screens/users/recognition_screen.dart';
import 'package:to_yudi/src/features/authentication/screens/users/add_report_screen.dart';

class UserDashboardScreen extends StatelessWidget {
  const UserDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double boxWidth = screenWidth / 2 - 30;

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
            top: 110,
            left: 30,
            right: 30,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [tTertiaryColor, tSecondaryColor],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 150,
                child: Stack(
                  children: [
                    Positioned(
                      top: -20,
                      left: 0,
                      child: Image.asset(tSplashImage, width: 50, height: 50),
                    ),
                    Positioned(
                      top: 40,
                      left: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'One',
                            style: GoogleFonts.kronaOne(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            'Tap Closer to',
                            style: GoogleFonts.kronaOne(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'a Solution!',
                            style: GoogleFonts.kronaOne(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 110,
            right: 40,
            child: Container(
              width: 180,
              height: 180,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [tTertiaryColor, tSecondaryColor],
                ),
              ),
              child: Center(
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [tTertiaryColor, tSecondaryColor],
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [tTertiaryColor, tSecondaryColor],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 65,
            right: -20,
            child: Image.asset(tStopLight, width: 300, height: 300),
          ),
          Positioned(
            top: 320,
            left: 50,
            child: Text(
              'OVERVIEW',
              style: GoogleFonts.kronaOne(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          Positioned(
            top: 360,
            left: 30,
            child: Container(
              width: boxWidth,
              height: 180,
              decoration: BoxDecoration(
                color: tTertiaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [tTertiaryColor, tSecondaryColor],
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: tTertiaryColor,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -5,
                    left: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You're a",
                          style: GoogleFonts.kronaOne(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "COMMUNITY HERO",
                          style: GoogleFonts.kronaOne(
                            color: tPrimaryColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "60%",
                        style: GoogleFonts.kronaOne(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "You donated 60% of your",
                            style: GoogleFonts.kronaOne(
                              color: Colors.white,
                              fontSize: 7,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            "points towards reforestation",
                            style: GoogleFonts.kronaOne(
                              color: Colors.white,
                              fontSize: 7,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 360,
            left: 30 + boxWidth + 10,
            child: Container(
              width: boxWidth,
              height: 240,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [tTertiaryColor, tSecondaryColor],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 3,
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [tSecondaryColor, tTertiaryColor],
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [tTertiaryColor, tSecondaryColor],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Image.asset(tReviews, width: 100, height: 100),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Past Reviews',
                            style: GoogleFonts.kronaOne(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            '& Feedback',
                            style: GoogleFonts.kronaOne(
                              color: tPrimaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 555,
            left: 30,
            right: 30 + boxWidth + 2,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [tSecondaryColor, tTertiaryColor],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(20),
              height: 250,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Image.asset(tReport, width: 80, height: 80),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Report',
                        style: GoogleFonts.kronaOne(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Tracking',
                        style: GoogleFonts.kronaOne(
                          color: tPrimaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  Positioned(
                    bottom: 35,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: tPrimaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Pending',
                          style: GoogleFonts.kronaOne(
                            color: tWhiteColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 8,
                          ),
                        ),
                        SizedBox(width: 30),
                        Text(
                          '60%',
                          style: GoogleFonts.kronaOne(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 12,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'Review',
                            style: GoogleFonts.kronaOne(
                              color: tWhiteColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        SizedBox(width: 40),
                        Expanded(
                          child: Text(
                            '20%',
                            style: GoogleFonts.kronaOne(
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -5,
                    left: 12,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: tTertiaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'Resolved',
                            style: GoogleFonts.kronaOne(
                              color: tWhiteColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        SizedBox(width: 40),
                        Expanded(
                          child: Text(
                            '20%',
                            style: GoogleFonts.kronaOne(
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 612,
            left: 30 + boxWidth + 10,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecognitionScreen()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: tTertiaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(20),
                height: 190,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        tRecognition,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 45,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          '75%',
                          style: GoogleFonts.kronaOne(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          'Recognition\nTracker',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.kronaOne(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
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
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
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

                              final tween = Tween(
                                begin: begin,
                                end: end,
                              ).chain(CurveTween(curve: curve));
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
