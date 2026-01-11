import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalyan Cherukupally - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        fontFamily: 'Inter',
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({Key? key}) : super(key: key);

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _launchUrl(String url) async {

    html.window.open(url, '_blank');
    final Uri uri = Uri.parse(url);
    // if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    //   debugPrint('Could not launch $url');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0F172A),
                  Color(0xFF1E3A8A),
                  Color(0xFF0F172A),
                ],
              ),
            ),
          ),
          // Main content
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              _buildAppBar(),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    _buildHeroSection(),
                    _buildAboutSection(),
                    _buildSkillsSection(),
                    _buildExperienceSection(),
                    _buildProjectsSection(),
                    _buildEducationSection(),
                    _buildContactSection(),
                    _buildFooter(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    
    return SliverAppBar(
      stretch: true,
      pinned: true,
      backgroundColor: const Color(0xFF0F172A).withOpacity(0.8),
      elevation: 0,
      title: const Text(
        'KC',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      actions: [
        _buildNavButton('About', _aboutKey),
        _buildNavButton('Skills', _skillsKey),
        _buildNavButton('Experience', _experienceKey),
        _buildNavButton('Projects', _projectsKey),
        _buildNavButton('Education', _educationKey),
        _buildNavButton('Contact', _contactKey),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildNavButton(String title, GlobalKey key) {
    return TextButton(
      onPressed: () => _scrollToSection(key),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 120,
             height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)],
                ),
              ),
              child:  Center(
                child: Image(
                  image: AssetImage('images/profile.jpeg'),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Kalyan Cherukupally',
              style: TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'Flutter Full Stack Developer',
              style: TextStyle(
                fontSize: 28,
                color: Color(0xFF60A5FA),
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(
              width: 600,
              child: Text(
                '3+ years of experience crafting scalable cross-platform mobile applications with Flutter, Dart, and Node.js',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFD1D5DB),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                _buildActionButton(
                  'Email Me',
                  Icons.email,
                  () => _launchUrl('mailto:kalyancheru@gmail.com'),
                  isPrimary: true,
                ),
                _buildActionButton(
                  'GitHub',
                  Icons.code,
                  () => _launchUrl('https://github.com/kalyan-81'),
                ),
                _buildActionButton(
                  'LinkedIn',
                  Icons.business,
                  () => _launchUrl('https://in.linkedin.com/in/kalyan-cherukupally-b36ab4289'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, IconData icon, VoidCallback onPressed,
      {bool isPrimary = false}) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? const Color(0xFF3B82F6) : const Color(0xFF334155),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    return _buildSection(
      key: _aboutKey,
      title: 'About Me',
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B).withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFF3B82F6).withOpacity(0.2),
          ),
        ),
        child: Column(
          children: [
            const Text(
              'Results-driven Flutter Full Stack Developer with 3+ years of experience in designing, developing, and deploying scalable cross-platform mobile applications for Android and iOS.',
              style: TextStyle(fontSize: 18, color: Color(0xFFD1D5DB), height: 1.6),
            ),
            const SizedBox(height: 16),
            const Text(
              'I specialize in Flutter, Dart, state management (GetX, Bloc, Provider), and backend integrations using Node.js, REST APIs, and Firebase. I have proven ability to deliver business-critical applications with features like OTP authentication, geofencing, payments, real-time notifications, Bluetooth printing, and secure file handling.',
              style: TextStyle(fontSize: 18, color: Color(0xFFD1D5DB), height: 1.6),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 24,
              runSpacing: 16,
              children: [
                _buildInfoChip(Icons.location_on, 'Hyderabad, India'),
                _buildInfoChip(Icons.phone, '8125364509'),
                _buildInfoChip(Icons.email, 'kalyancheru@gmail.com'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: const Color(0xFF60A5FA), size: 20),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildSkillsSection() {
    final skills = [
      {'category': 'Languages & Frameworks', 'items': ['Dart', 'Flutter','Android Studio','Postman', 'Node.js', 'MySQL','Basic Python', 'Java Script']},
      {'category': 'Architecture', 'items': ['MVC', 'Clean Architecture', 'Modular Components']},
      {'category': 'State Management', 'items': ['GetX', 'BLoC', 'Provider']},
      {'category': 'Backend & APIs', 'items': ['Node.js', 'RESTful APIs', 'JWT Authentication']},
      {'category': 'Firebase', 'items': ['Authentication', 'Firestore', 'Cloud Messaging', 'Notifications']},
      {'category': 'Integrations', 'items': ['Google Maps', 'Payments (UPI/QR)', 'Bluetooth Printer', 'Digilocker']},
    ];

    return _buildSection(
      key: _skillsKey,
      title: 'Technical Skills',
      backgroundColor: const Color(0xFF0F172A).withOpacity(0.5),
      child: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = constraints.maxWidth > 900 ? 3 : (constraints.maxWidth > 600 ? 2 : 1);
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.5,
            ),
            itemCount: skills.length,
            itemBuilder: (context, index) {
              return _buildSkillCard(
                skills[index]['category'] as String,
                skills[index]['items'] as List<String>,
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildSkillCard(String category, List<String> items) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF3B82F6).withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF60A5FA),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: items.map((item) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B82F6).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    item,
                    style: const TextStyle(
                      color: Color(0xFF93C5FD),
                      fontSize: 13,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceSection() {
    return _buildSection(
      key: _experienceKey,
      title: 'Professional Experience',
      child: Column(
        children: [
          _buildExperienceCard(
            'Flutter Developer',
            'Finvesco Capital India Pvt. Ltd',
            'Apr 2025 – Present',
            [
              {
                'project': 'Business Loan Application',
                'points': [
                  'Designed scalable MVC architecture with reusable components',
                  'Integrated REST APIs and improved performance using GetX',
                  'Implemented Geo-fencing and secure file upload/viewing',
                  'Integrated Digilocker Aadhaar verification and Firebase push notifications'
                ]
              },
              {
                'project': 'Finvesco – Customers NCDs App',
                'points': [
                  'Developed complete UI architecture and API integrations',
                  'Implemented local notifications and PDF view/download',
                  'Added force update mechanism with Play Store redirect'
                ]
              },
              {
                'project': 'Backend (Node.js)',
                'points': [
                  'Built OTP-based login APIs',
                  'Implemented MPIN authentication and JWT-based auth'
                ]
              },
            ],
          ),
          const SizedBox(height: 24),
          _buildExperienceCard(
            'Software Engineer – Flutter',
            'Anvation Labs, Hyderabad',
            'Aug 2024 – Apr 2025',
            [
              {
                'project': 'Ridot-Connect',
                'points': [
                  'Developed Android application for Automotive Cluster (HMI)',
                  'Built custom Flutter–Android method channels for Bluetooth',
                  'Delivered scalable and production-ready features'
                ]
              },
            ],
          ),
          const SizedBox(height: 24),
          _buildExperienceCard(
            'Software Trainee',
            'Codetru, Hyderabad',
            'Mar 2023 – Jul 2024',
            [
              {
                'project': 'Cross-platform Development',
                'points': [
                  'Developed Flutter applications for Android and iOS',
                  'Integrated REST APIs for real-time data updates',
                  'Implemented secure payment gateways and Firebase services',
                  'Added voice and video calling features'
                ]
              },
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(String title, String company, String period, List<Map<String, dynamic>> projects) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF3B82F6).withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF60A5FA),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      company,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xFFD1D5DB),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                period,
                style: const TextStyle(
                  color: Color(0xFF9CA3AF),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...projects.map((project) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project['project'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF22D3EE),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...(project['points'] as List<String>).map((point) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4, left: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '▹ ',
                            style: TextStyle(color: Color(0xFF60A5FA)),
                          ),
                          Expanded(
                            child: Text(
                              point,
                              style: const TextStyle(
                                color: Color(0xFFD1D5DB),
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildProjectsSection() {
    final projects = [
      {'name': 'Loan-Lens App', 'tech': 'Flutter, Dart, REST APIs', 'company': 'Finvesco Capital India'},
      {'name': 'SG Gold', 'tech': 'Flutter, Dart, REST APIs', 'company': 'Finvesco Capital India'},
      {'name': 'SRMACS', 'tech': 'Flutter, Dart, REST APIs', 'company': 'Finvesco Capital India'},
      {'name': 'Ridot-Connect', 'tech': 'Flutter, Dart', 'company': 'Anvation Labs'},
      {'name': 'Japfu.ai', 'tech': 'Flutter, Firebase, REST APIs', 'company': 'CodeTru'},
      {'name': 'Suraksha', 'tech': 'Flutter, Firebase, REST APIs', 'company': 'Client Project'},
    ];

    return _buildSection(
      key: _projectsKey,
      title: 'Projects',
      backgroundColor: const Color(0xFF0F172A).withOpacity(0.5),
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 900 ? 3 : (constraints.maxWidth > 600 ? 2 : 1);
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 3.2,
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return _buildProjectCard(
                    projects[index]['name']!,
                    projects[index]['tech']!,
                    projects[index]['company']!,
                  );
                },
              );
            },
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              // if (constraints.maxWidth > 800) {
              //   return Row(
              //     children: [
              //       Expanded(child: _buildPublicationCard()),
              //       const SizedBox(width: 16),
              //       Expanded(child: _buildResearchCard()),
              //     ],
              //   );
              // } else {
                return Column(
                  children: [
                    _buildPublicationCard(),
                    const SizedBox(height: 16),
                    _buildResearchCard(),
                  ],
                );
              }
            // },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(String name, String tech, String company) {
    return Container(
    
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 4, 70, 64).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF3B82F6).withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF60A5FA),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                company,
                style: const TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Text(
            tech,
            style: const TextStyle(
              color: Color(0xFFD1D5DB),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPublicationCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E3A8A), Color(0xFF0E7490)],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF3B82F6).withOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.military_tech, color: Color(0xFF60A5FA), size: 32),
              const SizedBox(height: 16),
              const Text(
                'Published App - SRMACS',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                """SRMACS is an acronym for SriKara Mutually Aided Multipurpose Co-operative Society Ltd., and the purpose of its app is to provide members with convenient online access to financial services and account management. 
The developers of the SRMACS app created it to enable society members, who may face difficulty accessing traditional banking, to manage their finances effectively. 
Specific features and purposes of the app include:
Access to credit: Enabling members to obtain credit from the cooperative society.
Financial Management: Assisting users in managing their accounts and understanding the complexities of the current economic climate.
Accessibility: Providing a convenient and efficient way for members to access services and information via their smartphones.""",
                style: TextStyle(
                  color: Color(0xFFD1D5DB),
                ),
              ),
              const SizedBox(height: 16),
              TextButton.icon(
                onPressed: () => _launchUrl('https://play.google.com/store/apps/details?id=com.srikara.memberportal.srikaramemberportal'),
                icon: const Icon(Icons.open_in_new, size: 16),
                label: const Text('View on Play Store'),
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF60A5FA),
                ),
              ),
            ],
          ),

           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.military_tech, color: Color(0xFF60A5FA), size: 32),
              const SizedBox(height: 16),
              const Text(
                "Published App - Srinu's Pharmacology",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'A mobile app designed for students to learn and memorize pharmacology topics and drug classifications, helping with recall of essential drug information, particularly for medical or pharmacy students in India. The app aims to simplify learning complex drug details through its features, making it a useful study aid. ',
                style: TextStyle(
                  color: Color(0xFFD1D5DB),
                ),
              ),
              const SizedBox(height: 16),
              TextButton.icon(
                onPressed: () => _launchUrl('https://play.google.com/store/apps/details?id=com.dvs.srini_pharma_v1'),
                icon: const Icon(Icons.open_in_new, size: 16),
                label: const Text('View on Play Store'),
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF60A5FA),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildResearchCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF7C3AED), Color(0xFFDB2777)],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF9333EA).withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.article, color: Color(0xFFC084FC), size: 32),
          const SizedBox(height: 16),
          const Text(
            'Research Publication',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Development and performance evaluation of a coronary artery disease prediction system with transfer learned model based on single lead and multi-lead ECG & TMT-ECG signals',
            style: TextStyle(
              color: Color(0xFFD1D5DB),
            ),
          ),
          const SizedBox(height: 16),
          TextButton.icon(
            onPressed: () => _launchUrl('https://sciencescholar.us/journal/index.php/ijhs/article/view/10681'),
            icon: const Icon(Icons.open_in_new, size: 16),
            label: const Text('View Publication'),
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFFC084FC),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationSection() {
    final education = [
      {
        'degree': 'M.Tech – Mechatronics Engineering',
        'institution': 'National Institute of Technology Karnataka',
        'score': 'CGPA: 8.04'
      },
      {
        'degree': 'B.Tech – Electronics & Communication Engineering',
        'institution': 'VNR VJIET, Hyderabad',
        'score': 'CGPA: 8.21'
      },
      {
        'degree': 'Diploma – Electronics & Communication Engineering',
        'institution': 'J.N. Government Polytechnic',
        'score': '87.21%'
      },
    ];

    return _buildSection(
      key: _educationKey,
      title: 'Education',
      child: Column(
        children: education.map((edu) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B).withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF3B82F6).withOpacity(0.2),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.school,
                    color: Color(0xFF60A5FA),
                    size: 24,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          edu['degree']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF60A5FA),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          edu['institution']!,
                          style: const TextStyle(
                            color: Color(0xFFD1D5DB),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          edu['score']!,
                          style: const TextStyle(
                            color: Color(0xFF9CA3AF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildContactSection() {
    return _buildSection(
      key: _contactKey,
      title: 'Get In Touch',
      backgroundColor: const Color(0xFF0F172A).withOpacity(0.5),
      child: Center(
        child: Column(
          children: [
            const Text(
              'I\'m always open to discussing new projects, creative ideas, or opportunities to be part of your vision.',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFFD1D5DB),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _launchUrl('mailto:kalyancheru@gmail.com'),
                  icon: const Icon(Icons.email),
                  label: const Text('kalyancheru@gmail.com'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B82F6),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => _launchUrl('tel:8125364509'),
                  icon: const Icon(Icons.phone),
                  label: const Text('8125364509'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF334155),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => _launchUrl('https://github.com/kalyan-81'),
                  icon: const Icon(Icons.code, size: 32),
                  color: const Color(0xFF9CA3AF),
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () => _launchUrl('https://linkedin.com/in/kalyan-cherukupallyb36ab4289'),
                  icon: const Icon(Icons.business, size: 32),
                  color: const Color(0xFF9CA3AF),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: const Color(0xFF3B82F6).withOpacity(0.2),
          ),
        ),
      ),
      child: const Center(
        child: Text(
          '© 2026 Kalyan Cherukupally. Built with Flutter.',
          style: TextStyle(
            color: Color(0xFF9CA3AF),
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required GlobalKey key,
    required String title,
    required Widget child,
    Color? backgroundColor,
  }) {
    return Container(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      color: backgroundColor,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 48),
            child,
          ],
        ),
      ),
    );
  }
}