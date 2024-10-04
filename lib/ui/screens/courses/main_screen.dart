import 'package:flutter/material.dart';
import 'package:test_application/models/course_model.dart';
import 'package:test_application/ui/screens/authentication/login_screen.dart';
import 'package:test_application/utils/app_constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppConstants.courseTypes[selectedIndex],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    icon: const Icon(
                      Icons.exit_to_app,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: selectedIndex == 0
              ? AppConstants.freeCourses.length
              : AppConstants.videoCourses.length,
          itemBuilder: (context, index) {
            final course = CourseModel.fromMap(
              selectedIndex == 0
                  ? AppConstants.freeCourses[index]
                  : AppConstants.videoCourses[index],
            );
            return Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Image.asset(
                      course.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        course.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 50,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.grey,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    if (selectedIndex != 0) {
                      setState(() {
                        selectedIndex = 0;
                      });
                    }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.book,
                        color: selectedIndex == 0 ? Colors.blue : Colors.grey,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Free Courses",
                        style: TextStyle(
                          color: selectedIndex == 0 ? Colors.blue : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (selectedIndex != 1) {
                      setState(() {
                        selectedIndex = 1;
                      });
                    }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.video_library,
                        color: selectedIndex == 1 ? Colors.blue : Colors.grey,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Video Courses",
                        style: TextStyle(
                          color: selectedIndex == 1 ? Colors.blue : Colors.grey,
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
    );
  }
}
