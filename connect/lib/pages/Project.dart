import 'package:flutter/material.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  final List<Map<String, dynamic>> projects = [
    {
      "title": "Solar Farm in Greenville",
      "successRate": 85,
      "raised": 650000,
      "goal": 1000000,
      "impact": "High",
      "image": "https://plus.unsplash.com/premium_photo-1678743133488-3e3400aafee2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjF8fHNvbGFyJTIwZmFybXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "title": "Wind Turbine Project",
      "successRate": 75,
      "raised": 500000,
      "goal": 750000,
      "impact": "Medium",
      "image": "https://images.unsplash.com/photo-1508791290064-c27cc1ef7a9a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjJ8fFdpbmQlMjBUdXJiaW5lfGVufDB8fDB8fHww"
    },
    {
      "title": "Eastern cape Garden",
      "successRate": 90,
      "raised": 900000,
      "goal": 1000000,
      "impact": "High",
      "image": "https://www.lightfromafrica.com/wp-content/uploads/2021/09/6-3-scaled.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text(
          "CleanSwift",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: ClipOval(
              child: Image.network(
                'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 164, 187, 231) ,
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return ProjectCard(project: project);
        },
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    double progress = project["raised"] / project["goal"];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project["title"],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(project["image"]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text("Success Rate: ${project["successRate"]}%"),
            LinearProgressIndicator(
  value: progress,
  backgroundColor: Colors.grey[300],
  color: project["successRate"] > 70
      ? Colors.green
      : project["successRate"] <= 30
          ? Colors.red
          : Colors.black,
  minHeight: 5,
),
            Text("\$${project["raised"].toStringAsFixed(0)} raised of \$${project["goal"].toStringAsFixed(0)} goal"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Impact: ${project["impact"]}", style: const TextStyle(color: Colors.blue)),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text("Learn More"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: const Text("Invest Now",style: TextStyle(
                        color: Colors.white,
                      ),),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
