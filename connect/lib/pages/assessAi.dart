import 'package:flutter/material.dart';

class AssessProjectScreen extends StatefulWidget {
  final Map<String, String> projectData;

  AssessProjectScreen({required this.projectData});

  @override
  _AssessProjectScreenState createState() => _AssessProjectScreenState();
}

class _AssessProjectScreenState extends State<AssessProjectScreen> {
  List<Map<String, String>> messages = [];
  bool loading = false;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    generateInsights();
  }

  void generateInsights() async {
    setState(() {
      loading = true;
    });
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      messages.add({
        "role": "bot",
        "text": "Based on the provided information for ${widget.projectData["name"]}...\n\n"
            "1. Market Potential: High. The ${widget.projectData["type"]} energy market is expanding.\n"
            "2. Resource Gap: Moderate. Available: ${widget.projectData["availableResources"]}. Needed: ${widget.projectData["neededResources"]}.\n"
            "3. Location Advantage: Assessing ${widget.projectData["location"]}.\n"
            "4. Project Scale: Analysis of ${widget.projectData["description"]} indicates a medium to large-scale project.\n"
            "5. Investment Needed: Substantial. Proper funding is essential.\n"
            "6. Potential ROI: Promising but long-term.\n"
            "7. Community Impact: Positive, supporting local energy demands.\n"
            "8. Risks: Regulatory challenges and supply chain concerns.\n\n"
            "Next Steps:\n"
            "1. Conduct a feasibility study.\n"
            "2. Secure necessary permits.\n"
            "3. Engage suppliers for quotes.\n"
            "4. Build an investment strategy.\n"
            "5. Enhance community engagement."
      });
      loading = false;
    });
  }

  void addMessage(String text) {
    if (text.trim().isEmpty) return;
    setState(() {
      messages.add({"role": "user", "text": text});
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text("Project Assessment"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: [ 
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                bool isUser = message["role"] == "user";
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue : Colors.grey[800],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      message["text"]!,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          if (loading)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    ),
                    onSubmitted: addMessage,
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: () => addMessage(_controller.text),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => addMessage("Generate Business Plan"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text("Business Plan"),
                ),
                ElevatedButton(
                  onPressed: () => addMessage("Generate Potential Sponsors List"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text("Sponsors/Collaborators"),
                ),
                ElevatedButton(
                  onPressed: () => addMessage("Register Business Plan"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: Text("Register Plan"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
