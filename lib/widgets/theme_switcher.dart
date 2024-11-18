import 'package:flutter/material.dart';

class ThemeSwitcher extends StatelessWidget {
  final bool isDarkMode;
  final Function onToggle;

  ThemeSwitcher({
    required this.isDarkMode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isDarkMode ? Icons.light_mode : Icons.dark_mode,
        color: isDarkMode ? Colors.yellow : Colors.grey[300],
      ),
      onPressed: () => onToggle(),
    );
  }
}