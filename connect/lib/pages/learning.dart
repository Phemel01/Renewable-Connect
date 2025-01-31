import 'package:flutter/material.dart';

// Mock data classes
class Course {
  final int id;
  final String title;
  final String? instructor;
  final String? duration;
  final String? level;
  final int? progress;
  final bool? completed;

  Course({
    required this.id,
    required this.title,
    this.instructor,
    this.duration,
    this.level,
    this.progress,
    this.completed,
  });
}

class Connection {
  final int id;
  final String name;
  final String role;
  final int mutualCourses;
  final int mutualProjects;

  Connection({
    required this.id,
    required this.name,
    required this.role,
    required this.mutualCourses,
    required this.mutualProjects,
  });
}

class LearningPage extends StatelessWidget {
  LearningPage({Key? key}) : super(key: key);

  // Mock data
  final List<Course> inDemandCourses = [
    Course(id: 1, title: "Solar Panel Installation Basics", instructor: "Jane Doe", duration: "4 hours", level: "Beginner"),
    Course(id: 2, title: "Wind Turbine Maintenance", instructor: "John Smith", duration: "6 hours", level: "Intermediate"),
    Course(id: 3, title: "Renewable Energy Project Management", instructor: "Alice Johnson", duration: "8 hours", level: "Advanced"),
    Course(id: 4, title: "Energy Storage Systems", instructor: "Bob Williams", duration: "5 hours", level: "Intermediate"),
    Course(id: 5, title: "Green Building Design", instructor: "Carol Brown", duration: "7 hours", level: "Beginner"),
  ];

  final List<Course> userCourses = [
    Course(id: 1, title: "Introduction to Renewable Energy", progress: 100, completed: true),
    Course(id: 2, title: "Solar Energy Fundamentals", progress: 60, completed: false),
    Course(id: 3, title: "Wind Power Technologies", progress: 30, completed: false),
  ];

  final List<Connection> recommendedConnections = [
    Connection(id: 1, name: "Emily Chen", role: "Solar Engineer", mutualCourses: 2, mutualProjects: 1),
    Connection(id: 2, name: "Michael Johnson", role: "Project Manager", mutualCourses: 1, mutualProjects: 0),
    Connection(id: 3, name: "Sarah Davis", role: "Environmental Scientist", mutualCourses: 3, mutualProjects: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 164, 187, 231), // bg-gray-900
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Learning Center',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),

                // In-demand Courses
                const Text(
                  'In-demand Skills',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: inDemandCourses.length,
                    itemBuilder: (context, index) => _buildCourseCard(inDemandCourses[index]),
                  ),
                ),
                const SizedBox(height: 32),

                // User's Courses
                const Text(
                  'My Courses',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                ...userCourses.map((course) => _buildUserCourseCard(course)),
                const SizedBox(height: 32),

                // Recommended Connections
                const Text(
                  'Recommended Connections',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                ...recommendedConnections.map((connection) => _buildConnectionCard(connection)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCourseCard(Course course) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        color: const Color(0xFF1F2937), // bg-gray-800
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                course.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Instructor: ${course.instructor}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF9CA3AF), // text-gray-400
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    course.duration!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF374151),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      course.level!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserCourseCard(Course course) {
    return Card(
      color: const Color(0xFF1F2937), // bg-gray-800
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  course.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: course.completed! ? Colors.green : Colors.blue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        course.completed! ? Icons.star : Icons.access_time,
                        size: 14,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        course.completed! ? 'Completed' : 'In Progress',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: course.progress! / 100,
              backgroundColor: Colors.grey[700],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${course.progress}% complete',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF9CA3AF), // text-gray-400
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to course
                  },
                  child: const Text(
                    'Continue Learning',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConnectionCard(Connection connection) {
    return Card(
      color: const Color(0xFF1F2937), // bg-gray-800
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey[600],
              child: Text(
                connection.name.split(' ').map((n) => n[0]).join(''),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    connection.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    connection.role,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF9CA3AF), // text-gray-400
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${connection.mutualCourses} mutual courses • ${connection.mutualProjects} mutual projects',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6B7280), // text-gray-500
                    ),
                  ),
                ],
              ),
            ),
            TextButton.icon(
              onPressed: () {
                // Handle connect action
              },
              icon: const Text(
                'Connect',
                style: TextStyle(color: Colors.white),
              ),
              label: const Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}