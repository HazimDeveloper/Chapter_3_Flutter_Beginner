import 'package:flutter/material.dart';
import '../models/project_models.dart';

class InteractiveProject extends StatefulWidget {
  final bool isDarkMode;

  const InteractiveProject({
    Key? key,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  State<InteractiveProject> createState() => _InteractiveProjectState();
}

class _InteractiveProjectState extends State<InteractiveProject> {
  int expandedIndex = -1;

  final List<Project> projects = [
    Project(
      title: 'Flutter Chat App',
      description: 'A real-time messaging application built with Flutter and Firebase',
      imageUrl: 'assets/images/project1.png',
      technologies: ['Flutter', 'Firebase', 'Provider'],
    ),
    Project(
      title: 'E-commerce App',
      description: 'Online shopping platform with payment integration',
      imageUrl: 'assets/images/project2.png',
      technologies: ['Flutter', 'Stripe', 'REST API'],
    ),
    Project(
      title: 'Weather App',
      description: 'Real-time weather updates with beautiful UI',
      imageUrl: 'assets/images/project3.png',
      technologies: ['Flutter', 'Weather API', 'Bloc'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: widget.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            itemBuilder: (context, index) => _buildProjectCard(index),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(int index) {
    final project = projects[index];
    final isExpanded = expandedIndex == index;

    return Card(
      color: widget.isDarkMode ? Colors.grey[800] : Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          setState(() {
            expandedIndex = isExpanded ? -1 : index;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
              child: Image.asset(
                project.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, size: 50),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Expand Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        project.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: widget.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      Icon(
                        isExpanded ? Icons.expand_less : Icons.expand_more,
                        color: widget.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Description
                  Text(
                    project.description,
                    style: TextStyle(
                      color: widget.isDarkMode ? Colors.white70 : Colors.black54,
                    ),
                  ),
                  if (isExpanded) ...[
                    const SizedBox(height: 16),
                    // Technologies
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: project.technologies.map((tech) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: widget.isDarkMode 
                                ? Colors.blue.withOpacity(0.2) 
                                : Colors.blue[50],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            tech,
                            style: TextStyle(
                              color: widget.isDarkMode 
                                  ? Colors.white 
                                  : Colors.blue[700],
                              fontSize: 12,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    // Action Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildActionButton(
                          icon: Icons.visibility,
                          label: 'Live Demo',
                          onPressed: () {
                            print('Opening demo for ${project.title}');
                          },
                        ),
                        _buildActionButton(
                          icon: Icons.code,
                          label: 'View Code',
                          onPressed: () {
                            print('Opening code for ${project.title}');
                          },
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.isDarkMode ? Colors.blue[700] : Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}