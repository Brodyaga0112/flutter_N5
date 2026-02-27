import 'package:flutter/material.dart';

class TasksDashboardPage extends StatelessWidget {
  const TasksDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Good Evening!',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const Text(
                            'Dan Smith',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.search, color: Colors.black),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.notifications_none, color: Colors.black),
                    ),
                  ],
                ),
              ),
              // My Weekly Tasks
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'My Weekly Tasks',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '18 Tasks Pending',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.filter_list, color: Colors.grey.shade600),
                            const SizedBox(width: 12),
                            Icon(Icons.add_circle_outline, color: Colors.grey.shade600),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _TaskCard(
                            title: 'Create a Landing Page',
                            tags: [
                              _Tag('UI/UX Design', Colors.purple.shade100, Colors.purple),
                              _Tag('High', Colors.pink.shade100, Colors.red),
                            ],
                            dueDate: 'Mon, 12 July 2022',
                            participants: 3,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _TaskCard(
                            title: 'Develop a Website',
                            tags: [
                              _Tag('Development', Colors.orange.shade100, Colors.orange),
                              _Tag('Low', Colors.green.shade100, Colors.green),
                            ],
                            dueDate: 'Mon, 30 July 2022',
                            participants: 2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Today\'s Tasks',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '18 Tasks Pending',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.filter_list, color: Colors.grey.shade600),
                            const SizedBox(width: 12),
                            Icon(Icons.add_circle_outline, color: Colors.grey.shade600),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Today's task cards
                    _TodayTaskCard(
                      title: 'Design 2 App Screens',
                      subtitle: 'Crypto Wallet App',
                      dueDate: 'Mon, 10 July 2022',
                      isCompleted: true,
                      participants: 3,
                    ),
                    const SizedBox(height: 12),
                    _TodayTaskCard(
                      title: 'Design Homepage',
                      subtitle: 'Water Company Website',
                      dueDate: 'Mon, 10 July 2022',
                      isCompleted: false,
                      participants: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _BottomNavItem(Icons.home, 'Home', isSelected: true),
                _BottomNavItem(Icons.folder, 'Projects', isSelected: false),
                _BottomNavItem(Icons.calendar_today, 'Calendar', isSelected: false),
                _BottomNavItem(Icons.message, 'Messages', isSelected: false),
                _BottomNavItem(Icons.people, 'Members', isSelected: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Tag {
  final String label;
  final Color backgroundColor;
  final Color textColor;

  _Tag(this.label, this.backgroundColor, this.textColor);
}

class _TaskCard extends StatelessWidget {
  final String title;
  final List<_Tag> tags;
  final String dueDate;
  final int participants;

  const _TaskCard({
    required this.title,
    required this.tags,
    required this.dueDate,
    required this.participants,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tags
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tags.map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: tag.backgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  tag.label,
                  style: TextStyle(
                    fontSize: 12,
                    color: tag.textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          // Bottom row
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Avatars
              SizedBox(
                width: participants > 3 ? 88.0 : (participants.clamp(0, 3) * 28.0 - (participants.clamp(0, 3) - 1) * 12.0),
                height: 28,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ...List.generate(
                      participants.clamp(0, 3),
                      (index) => Positioned(
                        left: index * 16.0,
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade200,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(Icons.person, size: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    if (participants > 3)
                      Positioned(
                        left: 48.0,
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: Colors.orange.shade200,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Center(
                            child: Text(
                              '${participants - 3}+',
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Date
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.calendar_today, size: 14, color: Colors.grey.shade600),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        dueDate,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TodayTaskCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String dueDate;
  final bool isCompleted;
  final int participants;

  const _TodayTaskCard({
    required this.title,
    required this.subtitle,
    required this.dueDate,
    required this.isCompleted,
    required this.participants,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 14, color: Colors.grey.shade600),
                    const SizedBox(width: 4),
                    Text(
                      dueDate,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Checkbox
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isCompleted ? Colors.blue : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: isCompleted ? Colors.blue : Colors.grey.shade300,
                width: 2,
              ),
            ),
            child: isCompleted
                ? const Icon(Icons.check, color: Colors.white, size: 24)
                : null,
          ),
          const SizedBox(width: 12),
          // Avatars
          SizedBox(
            width: participants > 2 ? 60.0 : (participants.clamp(0, 2) * 28.0 - (participants.clamp(0, 2) - 1) * 12.0),
            height: 28,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ...List.generate(
                  participants.clamp(0, 2),
                  (index) => Positioned(
                    left: index * 16.0,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(Icons.person, size: 16, color: Colors.white),
                    ),
                  ),
                ),
                if (participants > 2)
                  Positioned(
                    left: 32.0,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade200,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          '${participants - 2}+',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const _BottomNavItem(this.icon, this.label, {this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isSelected ? Colors.blue : Colors.grey,
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isSelected ? Colors.blue : Colors.grey,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

