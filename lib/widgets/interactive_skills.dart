import 'package:flutter/material.dart';

class InteractiveSkills extends StatefulWidget {
  final bool isDarkMode;

  const InteractiveSkills({
    Key? key,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  State<InteractiveSkills> createState() => _InteractiveSkillsState();
}

class _InteractiveSkillsState extends State<InteractiveSkills> {
  String selectedSkill = '';

  final List<Map<String, dynamic>> skills = [
    {'name': 'Flutter', 'level': 0.9},
    {'name': 'Dart', 'level': 0.85},
    {'name': 'Firebase', 'level': 0.8},
    {'name': 'UI Design', 'level': 0.75},
    {'name': 'Git', 'level': 0.7},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: widget.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.map((skill) {
              bool isSelected = selectedSkill == skill['name'];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSkill = isSelected ? '' : skill['name'];
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.blue
                        : (widget.isDarkMode ? Colors.grey[800] : Colors.blue[50]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    skill['name'],
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : (widget.isDarkMode ? Colors.white : Colors.blue),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          if (selectedSkill.isNotEmpty) ...[
            const SizedBox(height: 16),
            _buildSkillDetails(),
          ],
        ],
      ),
    );
  }

  Widget _buildSkillDetails() {
    final skill = skills.firstWhere((s) => s['name'] == selectedSkill);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          selectedSkill,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: widget.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: skill['level'],
          backgroundColor: widget.isDarkMode ? Colors.grey[700] : Colors.grey[300],
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      ],
    );
  }
}