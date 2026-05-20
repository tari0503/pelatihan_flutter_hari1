import 'package:flutter/material.dart';
import 'profil_page.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 700;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FlutterKit',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        actions: isMobile
            ? [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                )
              ]
            : [
                TextButton(
                  onPressed: () {},
                  child: const Text('Features'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Pricing'),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text('Get Started'),
                  ),
                ),
              ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeroSection(),
            FeaturesSection(),
            TestimonialsSection(),
            CTASection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width > 800;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 80,
      ),

      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepPurple.shade100,
            Colors.blue.shade100,
          ],
        ),
      ),

      child: isWide
          ? Row(
              children: const [
                Expanded(
                  child: HeroText(),
                ),
                SizedBox(width: 40),
                Expanded(
                  child: HeroImage(),
                ),
              ],
            )
          : const Column(
              children: [
                HeroText(),
                SizedBox(height: 32),
                HeroImage(),
              ],
            ),
    );
  }
}

class HeroText extends StatelessWidget {
  const HeroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 6,
          ),

          decoration: BoxDecoration(
            color: Colors.deepPurple.shade100,
            borderRadius: BorderRadius.circular(30),
          ),

          child: const Text('Flutter 3 Ready'),
        ),

        const SizedBox(height: 20),

        Text(
          'Build Beautiful\nFlutter Apps Faster',
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),

        const SizedBox(height: 20),

        Text(
          'Modern UI kit untuk mempercepat development Flutter kamu.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),

        const SizedBox(height: 30),

        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton.icon(
              onPressed: () {},

              icon: const Icon(Icons.rocket_launch),

              label: const Text('Mulai'),
            ),

            OutlinedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProfilePage(),
                  ),
                );
              },

              icon: const Icon(Icons.person),

              label: const Text('Profile Demo'),
            ),
          ],
        ),
      ],
    );
  }
}

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),

      child: Image.network(
        'https://picsum.photos/600/500',

        height: 400,

        fit: BoxFit.cover,

        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;

          return const SizedBox(
            height: 400,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  static const features = [
    (
      Icons.layers,
      'Reusable Components',
      'Komponen siap pakai.'
    ),

    (
      Icons.phone_android,
      'Responsive',
      'Mobile & tablet friendly.'
    ),

    (
      Icons.dark_mode,
      'Dark Mode',
      'Support dark theme.'
    ),

    (
      Icons.speed,
      'Fast',
      'Performa optimal.'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),

      child: Column(
        children: [
          Text(
            'Features',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),

          const SizedBox(height: 40),

          LayoutBuilder(
            builder: (context, constraints) {
              final count =
                  constraints.maxWidth > 900 ? 4 : 2;

              return GridView.count(
                crossAxisCount: count,

                shrinkWrap: true,

                physics:
                    const NeverScrollableScrollPhysics(),

                crossAxisSpacing: 16,
                mainAxisSpacing: 16,

                childAspectRatio: 1.2,

                children: features.map((feature) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [
                          Icon(
                            feature.$1,
                            size: 40,
                          ),

                          const SizedBox(height: 16),

                          Text(
                            feature.$2,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                          ),

                          const SizedBox(height: 8),

                          Text(feature.$3),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  static const testimonials = [
    (
      'UI sangat membantu workflow developer.',
      'Andi'
    ),

    (
      'Responsive dan clean.',
      'Budi'
    ),

    (
      'Modern design dan mudah digunakan.',
      'Salsa'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),

      child: Column(
        children: [
          Text(
            'Testimonials',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),

          const SizedBox(height: 30),

          ListView.separated(
            shrinkWrap: true,

            physics:
                const NeverScrollableScrollPhysics(),

            itemCount: testimonials.length,

            separatorBuilder: (_, __) =>
                const SizedBox(height: 16),

            itemBuilder: (context, index) {
              final item = testimonials[index];

              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [
                      Text(
                        '"${item.$1}"',
                      ),

                      const SizedBox(height: 12),

                      Text(
                        '- ${item.$2}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CTASection extends StatelessWidget {
  const CTASection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),

      padding: const EdgeInsets.all(40),

      decoration: BoxDecoration(
        color: Colors.deepPurple.shade100,

        borderRadius: BorderRadius.circular(24),
      ),

      child: Column(
        children: [
          Text(
            'Mulai Sekarang',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),

          const SizedBox(height: 16),

          const Text(
            'Bangun aplikasi modern menggunakan Flutter.',
          ),

          const SizedBox(height: 24),

          FilledButton(
            onPressed: () {},

            child: const Text('Get Started'),
          ),
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),

      child: const Text(
        'FlutterKit © 2026',
      ),
    );
  }
}