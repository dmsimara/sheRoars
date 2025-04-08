import 'package:flutter/material.dart';
import 'package:to_yudi/src/constants/colors.dart';
import 'package:to_yudi/src/constants/image_strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart'; 
import 'package:to_yudi/src/features/authentication/screens/dashboards/user_screen.dart';
import 'package:to_yudi/src/features/authentication/screens/users/pin_map_screen.dart';

class AddReportScreen extends StatefulWidget {
  const AddReportScreen({super.key});

  @override
  State<AddReportScreen> createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  List<Map<String, dynamic>> reports = [];
  DateTime? selectedDate;
  String selectedIssueType = '';

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg', 'mp4'],
    );

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;
      setState(() {
        reports.add({
          'name': file.name,
          'path': file.path,
          'extension': file.extension,
        });
      });
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void selectIssue(String issue) {
    setState(() {
      selectedIssueType = issue;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [tSecondaryColor, tSecondaryColor, tTertiaryColor],
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
              top: 100,
              left: 20,
              right: 20,
              child: Container(
                height: 720,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [tSecondaryColor, tSecondaryColor, tTertiaryColor],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Show Us",
                        style: GoogleFonts.kronaOne(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        "What You See!",
                        style: GoogleFonts.kronaOne(
                          color: tPrimaryColor,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 20),

                      Center(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: tWhiteColor,
                          ),
                          onPressed: pickFile,
                          icon: const Icon(Icons.upload_file),
                          label: const Text("Upload File"),
                        ),
                      ),
                      const SizedBox(height: 10),

                      Center(
                        child: Text(
                          "Supported files: PNG, JPG, JPEG, MP4",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Center(
                        child: ElevatedButton(
                          onPressed: () => selectDate(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: tWhiteColor,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                selectedDate == null
                                    ? 'Select Date'
                                    : '${DateFormat('yyyy-MM-dd').format(selectedDate!)}',
                              ),
                              const SizedBox(width: 8),
                              Icon(Icons.calendar_today, color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Container(
                        width: screenWidth - 40,
                        height: 280, 
                        decoration: BoxDecoration(
                          color: tSecondaryColor,
                          borderRadius: BorderRadius.circular(15), 
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ISSUE TYPE:',
                                style: GoogleFonts.kronaOne(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10),

Expanded(
  child: SingleChildScrollView(
    child: Center(
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          _buildIssueButton("Road Issues", screenWidth),
          _buildIssueButton("Drainage Problem", screenWidth),
          _buildIssueButton("Street Lighting Outages", screenWidth),
          _buildIssueButton("Water Supply Issues", screenWidth),
          _buildIssueButton("Public Market Issues", screenWidth),
          _buildIssueButton("Garbage Collection Problems", screenWidth),
          _buildIssueButton("Stray Animals", screenWidth),
          _buildIssueButton("Blocked PWD Ramps", screenWidth),
          _buildIssueButton("Uneven or Broken Sidewalks", screenWidth),
          _buildIssueButton("Others", screenWidth),
        ],
      ),
    ),
  ),
),

                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 10), 

SizedBox(
  height: 92, 
  child: Container(
    width: screenWidth - 40,
    decoration: BoxDecoration(
      color: tSecondaryColor,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'DESCRIPTION:',
            style: GoogleFonts.kronaOne(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    ),
  ),
),

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
  child: Center(
    child: ElevatedButton(
      onPressed: () {
        // Navigate to PinMapScreen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PinMapScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: tPrimaryColor, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), 
        ),
      ),
      child: Text(
        'Report Now',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ), 
      ),
    ),
  ),
),



                      ListView.builder(
                        shrinkWrap: true,  
                        itemCount: reports.length,
                        itemBuilder: (context, index) {
                          final report = reports[index];
                          return ListTile(
                            leading: Icon(
                              report['extension'] == 'mp4'
                                  ? Icons.videocam
                                  : Icons.image,
                              color: Colors.white,
                            ),
                            title: Text(
                              report['name'],
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              'Date: ${report['date']}, Issue: ${report['issue']}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        },
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
      ),
    );
  }

  Widget _buildIssueButton(String issue, double screenWidth) {
  final double buttonWidth = (screenWidth - 36) / 3;

  return SizedBox(
    width: buttonWidth,
    child: GestureDetector(
      onTap: () => selectIssue(issue),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: selectedIssueType == issue ? tSecondaryColor : tTertiaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            issue,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10.5,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ),
    ),
  );
}

}
