import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.network(
                  'https://picsum.photos/800/300',

                  height: 220,

                  width: double.infinity,

                  fit: BoxFit.cover,
                ),

                Positioned(
                  bottom: -50,
                  left: 24,

                  child: CircleAvatar(
                    radius: 50,

                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/300',
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            const Text(
              'Tri Lestari',

              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              '@trilestari',

              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),

              child: Text(
                'Flutter Developer • UI Designer • Open Source Contributor',

                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,

              children: const [
                ProfileStat(
                  value: '142',
                  label: 'Posts',
                ),

                ProfileStat(
                  value: '8.2K',
                  label: 'Followers',
                ),

                ProfileStat(
                  value: '312',
                  label: 'Following',
                ),
              ],
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),

              child: Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: () {},

                      child: const Text('Follow'),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},

                      child: const Text('Message'),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            GridView.builder(
              shrinkWrap: true,

              physics:
                  const NeverScrollableScrollPhysics(),

              padding: const EdgeInsets.all(12),

              itemCount: 12,

              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,

                crossAxisSpacing: 4,

                mainAxisSpacing: 4,
              ),

              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius:
                      BorderRadius.circular(8),

                  child: Image.network(
                    'https://picsum.photos/200?random=$index',

                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileStat extends StatelessWidget {
  const ProfileStat({
    super.key,
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,

          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(label),
      ],
    );
  }
}