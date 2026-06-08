import 'package:flutter/material.dart';
import 'package:rakaa_ai/core/theme/app_theme.dart';
import 'package:rakaa_ai/features/prayer_tracking/presentation/pages/prayer_session_page.dart';
import 'package:rakaa_ai/features/settings/presentation/pages/about_page.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('ركعة AI', style: TextStyle(fontWeight: FontWeight.bold)),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Center(
                  child: Icon(Icons.mosque, size: 80, color: Colors.white24),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage())),
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildPrayerTimeCard(),
                const SizedBox(height: 24),
                const Text('المميزات الأساسية', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    _FeatureCard(
                      title: 'بدء الصلاة',
                      icon: Icons.play_circle_fill,
                      color: AppColors.primary,
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PrayerSessionPage())),
                    ),
                    _FeatureCard(
                      title: 'القبلة',
                      icon: Icons.explore,
                      color: Colors.brown,
                      onTap: () {},
                    ),
                    _FeatureCard(
                      title: 'الأذكار',
                      icon: Icons.menu_book,
                      color: Colors.teal,
                      onTap: () {},
                    ),
                    _FeatureCard(
                      title: 'الإحصائيات',
                      icon: Icons.bar_chart,
                      color: Colors.blueGrey,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _buildDeveloperCard(context),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerTimeCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('الصلاة القادمة', style: TextStyle(color: AppColors.textSecondary)),
                Text('العصر', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
            const SizedBox(height: 12),
            const Text('03:45 PM', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: AppColors.primary)),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _timeMini('الفجر', '04:12'),
                _timeMini('الظهر', '12:05'),
                _timeMini('العصر', '03:45'),
                _timeMini('المغرب', '06:50'),
                _timeMini('العشاء', '08:20'),
              ],
            ),
          ],
        ),
      ),
    ).animate().fadeIn().slideY(begin: 0.2);
  }

  Widget _timeMini(String name, String time) {
    return Column(
      children: [
        Text(name, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
        Text(time, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildDeveloperCard(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage())),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primary.withOpacity(0.2)),
        ),
        child: const Row(
          children: [
            CircleAvatar(backgroundColor: AppColors.primary, child: Icon(Icons.person, color: Colors.white)),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('المطور: Mohamed Ashraf', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('اضغط للمزيد من المعلومات', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _FeatureCard({required this.title, required this.icon, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: color.withOpacity(0.05),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: color.withOpacity(0.2)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 12),
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }
}
