import 'package:flutter/material.dart';
import '../widgets/interactive_profile.dart';
import '../widgets/interactive_skills.dart';
import '../widgets/interactive_project.dart';
import '../widgets/theme_switcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        actions: [
          ThemeSwitcher(
            isDarkMode: isDarkMode,
            onToggle: toggleTheme,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InteractiveProfile(isDarkMode: isDarkMode),
            const Divider(),
            InteractiveSkills(isDarkMode: isDarkMode),
            const Divider(),
            InteractiveProject(isDarkMode: isDarkMode),
          ],
        ),
      ),
    );
  }
}