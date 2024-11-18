import 'package:flutter/material.dart';

class InteractiveProfile extends StatefulWidget {
  final bool isDarkMode;

  const InteractiveProfile({
    Key? key,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  State<InteractiveProfile> createState() => _InteractiveProfileState();
}

class _InteractiveProfileState extends State<InteractiveProfile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'HazimDev',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: widget.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Flutter Developer',
                  style: TextStyle(
                    fontSize: 18,
                    color: widget.isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          if (isExpanded) ...[
            const SizedBox(height: 16),
            Text(
              'I create beautiful mobile applications using Flutter',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: widget.isDarkMode ? Colors.white70 : Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton(Icons.tiktok, '@hazimdev'),
                const SizedBox(width: 16),
                _buildSocialButton(Icons.camera_alt, '@hazimkhai__'),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String label) {
    return MaterialButton(
      onPressed: () {
        print('Opening $label');
      },
      color: widget.isDarkMode ? Colors.grey[800] : Colors.blue[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}