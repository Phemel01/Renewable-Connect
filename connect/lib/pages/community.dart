import 'package:flutter/material.dart';

// Mock data for bulletin board items
class BulletinItem {
  final String type;
  final String title;
  final String description;

  BulletinItem({
    required this.type,
    required this.title,
    required this.description,
  });
}

// Mock data for discussions
class Discussion {
  final int id;
  final String title;
  final int participants;
  final int messages;

  Discussion({
    required this.id,
    required this.title,
    required this.participants,
    required this.messages,
  });
}

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  String activeTab = 'all';

  final List<BulletinItem> bulletinItems = [
    BulletinItem(
      type: 'job',
      title: 'Solar Panel Installer Needed',
      description: 'Experienced installer required for a new project in Greenville.',
    ),
    BulletinItem(
      type: 'news',
      title: 'New Wind Farm Approved',
      description: 'Local council approves plans for offshore wind farm.',
    ),
    BulletinItem(
      type: 'notice',
      title: 'Community Meeting',
      description: 'Join us this Saturday for our monthly renewable energy meetup.',
    ),
  ];

  final List<Discussion> discussions = [
    Discussion(id: 1, title: 'Best practices for home solar installation', participants: 15, messages: 42),
    Discussion(id: 2, title: 'Funding options for community wind projects', participants: 8, messages: 23),
    Discussion(id: 3, title: 'The future of geothermal energy', participants: 12, messages: 37),
    Discussion(id: 4, title: 'Overcoming NIMBY attitudes in renewable projects', participants: 20, messages: 56),
    Discussion(id: 5, title: 'Innovations in energy storage technology', participants: 18, messages: 49),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 164, 187, 231), // bg-gray-900
      body: SafeArea(
        child: SingleChildScrollView(  // Added to handle potential overflow
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,  // Makes children stretch full width
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Community Collaboration',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Bulletin Board - Now full width
              Container(
                width: double.infinity,
                color: const Color(0xFF1F2937), // bg-gray-800
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Bulletin Board',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Tab buttons
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildTabButton('all', 'All'),
                            const SizedBox(width: 8),
                            _buildTabButton('jobs', 'Jobs'),
                            const SizedBox(width: 8),
                            _buildTabButton('news', 'News'),
                            const SizedBox(width: 8),
                            _buildTabButton('notices', 'Notices'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Bulletin items - Full width
                      ...bulletinItems
                          .where((item) =>
                              activeTab == 'all' ||
                              item.type == activeTab.substring(0, activeTab.length - 1))
                          .map((item) => _buildBulletinItem(item)),
                    ],
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Current Discussions
                    Card(
                      color: const Color(0xFF1F2937), // bg-gray-800
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Current Discussions',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: discussions.length,
                                itemBuilder: (context, index) =>
                                    _buildDiscussionCard(discussions[index]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.add_circle_outline),
                            label: const Text('New Discussion'),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(16),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: OutlinedButton.icon(
                            icon: const Icon(Icons.message_outlined),
                            label: const Text('Telegram Chatbot'),
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(16),
                              side: const BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabButton(String tab, String label) {
    final isActive = activeTab == tab;
    return ElevatedButton(
      onPressed: () => setState(() => activeTab = tab),
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive ? Theme.of(context).primaryColor : Colors.transparent,
        foregroundColor: Colors.white,
        side: BorderSide(color: isActive ? Colors.transparent : Colors.white),
      ),
      child: Text(label),
    );
  }

  Widget _buildBulletinItem(BulletinItem item) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      child: Card(
        color: const Color(0xFF374151), // bg-gray-700
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item.description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFFD1D5DB), // text-gray-300
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDiscussionCard(Discussion discussion) {
    return SizedBox(
      width: 300,
      child: Card(
        color: const Color(0xFF374151), // bg-gray-700
        margin: const EdgeInsets.only(right: 16),
        child: InkWell(
          onTap: () {
            // Navigate to discussion
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  discussion.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${discussion.participants} participants',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF9CA3AF), // text-gray-400
                      ),
                    ),
                    Text(
                      '${discussion.messages} messages',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF9CA3AF), // text-gray-400
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}