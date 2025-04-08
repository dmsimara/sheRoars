import 'package:flutter/material.dart';
import 'package:to_yudi/src/constants/image_strings.dart';
import 'package:to_yudi/src/constants/sizes.dart';
import 'package:to_yudi/src/constants/text_strings.dart';
import 'package:to_yudi/src/constants/colors.dart';
import 'package:to_yudi/src/features/authentication/screens/login/login_screen.dart';
import 'package:to_yudi/src/features/authentication/controllers/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final RegisterController _registerController = RegisterController();

  void _handleSignUp() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        await _registerController.registerUser(
          name: _name,
          email: _email,
          password: _password,
          confirmPassword: _confirmPassword,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } else {
      print("Form is not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final topImageHeight = screenHeight * 0.3;
    double fontSize = screenWidth * 0.08;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: topImageHeight,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      tRegisterImage,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF000000),
                            Color(0xB3000000),
                            Color.fromRGBO(0, 0, 0, 0.1),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 70,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, tTertiaryColor],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [tTertiaryColor, tSecondaryColor],
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(tDefaultSize),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tRegister,
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              color: Colors.white,
                              fontSize: fontSize,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: tFormHeight - 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person_outline_outlined, color: tWhiteColor),
                                      labelText: tName,
                                      hintText: tName,
                                      labelStyle: TextStyle(color: Colors.grey[300]),
                                      hintStyle: TextStyle(color: Colors.grey[300]),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey[300]!)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey[300]!)),
                                    ),
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (value) => _name = value,
                                    validator: (value) =>
                                        value == null || value.isEmpty ? 'Please enter your name' : null,
                                  ),
                                  SizedBox(height: 12),

                                  TextFormField(
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.email_outlined, color: tWhiteColor),
                                      labelText: tEmail,
                                      hintText: tEmail,
                                      labelStyle: TextStyle(color: Colors.grey[300]),
                                      hintStyle: TextStyle(color: Colors.grey[300]),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey[300]!)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey[300]!)),
                                    ),
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (value) => _email = value,
                                    validator: (value) =>
                                        value == null || value.isEmpty ? 'Please enter your email' : null,
                                  ),
                                  SizedBox(height: 12),

                                  TextFormField(
                                    obscureText: _obscurePassword,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.fingerprint, color: tWhiteColor),
                                      labelText: tPassword,
                                      hintText: tPassword,
                                      labelStyle: TextStyle(color: Colors.grey[300]),
                                      hintStyle: TextStyle(color: Colors.grey[300]),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey[300]!)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey[300]!)),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                          color: tWhiteColor,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscurePassword = !_obscurePassword;
                                          });
                                        },
                                      ),
                                    ),
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (value) => _password = value,
                                    validator: (value) =>
                                        value == null || value.isEmpty ? 'Please enter your password' : null,
                                  ),
                                  SizedBox(height: 12),

                                  TextFormField(
                                    obscureText: _obscureConfirmPassword,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.fingerprint, color: tWhiteColor),
                                      labelText: tConfirmPass,
                                      hintText: tConfirmPass,
                                      labelStyle: TextStyle(color: Colors.grey[300]),
                                      hintStyle: TextStyle(color: Colors.grey[300]),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey[300]!)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey[300]!)),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureConfirmPassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: tWhiteColor,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscureConfirmPassword = !_obscureConfirmPassword;
                                          });
                                        },
                                      ),
                                    ),
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (value) => _confirmPassword = value,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please confirm your password';
                                      }
                                      if (_password != value) {
                                        return 'Passwords do not match';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 30),

                                  Center(
                                    child: SizedBox(
                                      width: 150,
                                      child: ElevatedButton(
                                        onPressed: _handleSignUp,
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(100, 50),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          backgroundColor: tPrimaryColor,
                                        ),
                                        child: Text(
                                          tReg,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: tBlackColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Expanded(
                                    child: Divider(
                                      color: Colors.white,
                                      thickness: 1,
                                      indent: 20,
                                      endIndent: 20,
                                    ),
                                  ),
                                  Text(
                                    "Or Register With",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const Expanded(
                                    child: Divider(
                                      color: Colors.white,
                                      thickness: 1,
                                      indent: 20,
                                      endIndent: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Center(
                                child: Image.asset(
                                  "assets/images/google-icon.png",
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              SizedBox(height: 20),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) =>
                                          LoginScreen(),
                                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        final Tween<double> opacityTween = Tween(begin: 0.0, end: 1.0);
                                        final CurvedAnimation curvedAnimation = CurvedAnimation(
                                          parent: animation,
                                          curve: Curves.easeInOut,
                                        );
                                        return FadeTransition(
                                          opacity: opacityTween.animate(curvedAnimation),
                                          child: child,
                                        );
                                      },
                                      transitionDuration: Duration(milliseconds: 800),
                                    ),
                                  );
                                },
                                child: Text.rich(
                                  TextSpan(
                                    text: tHaveAccount,
                                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                    children: const [
                                      TextSpan(text: ' '),
                                      TextSpan(
                                        text: tLog,
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Image.asset(
              "assets/images/yudi-logo.png",
              width: screenWidth * 0.2,
              height: screenWidth * 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
