import 'package:flutter/material.dart';

class StudentProfilePage extends StatelessWidget {
  const StudentProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final navy = Theme.of(context).colorScheme.primary;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight:
            kToolbarHeight * MediaQuery.textScalerOf(context).scale(1),
        title: const Text('Student Profile', maxLines: 2, softWrap: true),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 44,
                        backgroundColor: navy,
                        foregroundColor: Colors.white,
                        child: const Text(
                          'EL',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Earth Justin Lim',
                      textAlign: TextAlign.center,
                      style: textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'BS Information Technology',
                      textAlign: TextAlign.center,
                      style: textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 28),
                    Text('Student Details', style: textTheme.titleMedium),
                    const SizedBox(height: 12),
                    const Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.badge_outlined),
                              title: Text('Student Number'),
                              subtitle: Text('553550'),
                            ),
                            ListTile(
                              leading: Icon(Icons.school_outlined),
                              title: Text('Year/Section'),
                              subtitle: Text('3rd Year - PS303'),
                            ),
                            ListTile(
                              leading: Icon(Icons.menu_book_outlined),
                              title: Text('Subject'),
                              subtitle: Text('CCE106L'),
                            ),
                            ListTile(
                              leading: Icon(Icons.mail_outline),
                              title: Text('Email'),
                              subtitle: Text('e.lim.553550@umindanao.edu.ph'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Text('About Me', style: textTheme.titleMedium),
                    const SizedBox(height: 10),
                    Text(
                      'I am a third-year Bachelor of Science in Information Technology student. '
                      'I enjoy learning about technology and improving my programming skills. '
                      'My goal is to develop useful applications that can help people solve everyday problems.',
                      style: textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 28),
                    Text('Hobbies and Interests', style: textTheme.titleMedium),
                    const SizedBox(height: 10),
                    const Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        Chip(label: Text('Watching movies')),
                        Chip(label: Text('Playing badminton')),
                        Chip(label: Text('Listening to music')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
