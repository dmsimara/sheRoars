import 'package:flutter/material.dart';
import 'package:to_yudi/src/constants/text_strings.dart';
import 'package:to_yudi/src/constants/image_strings.dart';
import 'package:to_yudi/src/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';  
import 'package:to_yudi/src/features/authentication/screens/login/login_screen.dart';  

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double fontSize = screenWidth * 0.08;  
    double buttonFontSize = screenWidth * 0.035; 

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(tWelcomeImage), 
                fit: BoxFit.cover, 
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent, 
                    const Color.fromARGB(255, 1, 30, 54).withOpacity(0.3),
                    const Color.fromARGB(255, 1, 30, 54).withOpacity(1.0), 
                  ],
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,  
            crossAxisAlignment: CrossAxisAlignment.start,  
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),  
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Our City, ",
                        style: GoogleFonts.kronaOne(  
                          color: Colors.white,
                          fontSize: fontSize,  
                        ),
                      ),
                      TextSpan(
                        text: "\nMade Better\nby Us.",
                        style: GoogleFonts.kronaOne( 
                          color: tPrimaryColor, 
                          fontSize: fontSize, 
                          fontWeight: FontWeight.w600, 
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.02, left: 20.0, right: 16.0), 
                child: Image.asset(
                  tSplashImage,
                  width: screenWidth * 0.15, 
                  fit: BoxFit.contain, 
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),  
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.02),  
                      child: Image.asset(
                        tLogo, 
                        height: screenHeight * 0.15, 
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.08),  
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => const LoginScreen(),
                              transitionDuration: Duration(milliseconds: 800), 
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                const begin = Offset(1.0, 0.0);
                                const end = Offset.zero; 
                                const curve = Curves.easeInOut; 

                                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                var offsetAnimation = animation.drive(tween);

                                return SlideTransition(position: offsetAnimation, child: child);
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: tTertiaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5), 
                          ),
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02), 
                        ),
                        child: Text(
                          tStarted,
                          style: GoogleFonts.kronaOne(
                            color: tWhiteColor,
                            fontWeight: FontWeight.w400,
                            fontSize: buttonFontSize,  
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
