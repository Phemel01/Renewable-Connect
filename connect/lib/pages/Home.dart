import 'package:connect/pages/Create_page.dart';
import 'package:connect/pages/Project.dart';
import 'package:connect/pages/community.dart';
import 'package:connect/pages/learning.dart';
import 'package:connect/pages/news.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Good evening",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://plus.unsplash.com/premium_photo-1678743133487-d501f3b0696b?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildMenuButton(
                    "Recent News & Trends",
                    "Stay updated with the community",
                    Colors.green,
                    Icons.article,
                    () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>NewsPage()),
                        );}, // Empty callback to avoid errors
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: _buildMenuButton(
                        "Projects",
                        "Explore opportunities",
                        Colors.green,
                        Icons.lightbulb,
                        () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Projects()),
                        );},
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildMenuButton(
                        "Learn",
                        "Expand your knowledge",
                        Colors.purple,
                        Icons.school,
                        () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LearningPage()),
                        );},
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: _buildMenuButton(
                        "Community",
                        "Join the discussion",
                        Colors.purple,
                        Icons.people,
                        () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CommunityPage()),
                        );},
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildMenuButton(
                        "Create projects",
                        "Start a new initiative",
                        Colors.green,
                        Icons.add_circle,
                        () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CreateProject()),
                        );
                      },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Recently Viewed Projects",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
               _buildProjectTile("Cape Town Solar Park", "Cape Town, Western Cape"),
_buildProjectTile("Johannesburg Renewable Hub", "Johannesburg, Gauteng"),
_buildProjectTile("Durban Solar Initiative", "Durban, KwaZulu-Natal"),
_buildProjectTile("Port Elizabeth Wind Farm", "Port Elizabeth, Eastern Cape"),


              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton(
      String title, String subtitle, Color color, IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.black, size: 30),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectTile(String title, String location) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                location,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 18),
        ],
      ),
    );
  }
}
