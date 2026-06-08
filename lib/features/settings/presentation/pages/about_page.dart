import 'package:flutter/material.dart';
import 'package:rakaa_ai/core/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  final String facebookUrl = "https://www.facebook.com/share/1FxaKwuDF5/";
  final String developerName = "Mohamed Ashraf";

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حول التطبيق'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 60,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.person, size: 80, color: Colors.white),
            ),
            const SizedBox(height: 24),
            Text(
              developerName,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Text(
              'مطور تطبيقات فلاتر',
              style: TextStyle(fontSize: 18, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 32),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'تطبيق ركعة AI هو مساعد صلاة متطور يستخدم تقنيات الذكاء الاصطناعي والحساسات لمساعدة المصلين في تتبع عدد الركعات والحركات أثناء الصلاة بشكل دقيق وبدون الحاجة للاتصال بالإنترنت.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, height: 1.6),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'تواصل معي',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SocialButton(
                  icon: FontAwesomeIcons.facebook,
                  color: const Color(0xFF1877F2),
                  onPressed: () => _launchUrl(facebookUrl),
                ),
                const SizedBox(width: 20),
                _SocialButton(
                  icon: FontAwesomeIcons.envelope,
                  color: AppColors.primary,
                  onPressed: () => _launchUrl('mailto:contact@mohamed_ashraf.com'),
                ),
              ],
            ),
            const SizedBox(height: 60),
            const Text(
              'الإصدار 1.0.0',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _SocialButton({required this.icon, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(icon, color: color, size: 32),
      onPressed: onPressed,
    );
  }
}
