import 'package:flutter/material.dart';
import '../../routes.dart';
import 'package:lenguaje/widgets/profile_drawer.dart'; // Asegúrate de importar tu drawer

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = -1;

  final List<Map<String, dynamic>> sections = [
    {
      'title': 'Señas a Texto',
      'icon': Icons.pan_tool,
      'route': AppRoutes.signToText
    },
    {
      'title': 'Texto a Señas',
      'icon': Icons.text_fields,
      'route': AppRoutes.textToSign
    },
    {
      'title': 'Educación',
      'icon': Icons.school,
      'route': AppRoutes.levels
    },
    {
      'title': 'Práctica',
      'icon': Icons.videocam,
      'route': AppRoutes.practice
    },
    {
      'title': 'Estadísticas',
      'icon': Icons.bar_chart,
      'route': AppRoutes.stats
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F0FF),
      drawer: const ProfileDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu, color: Color(0xFF6C63FF)),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Hola 👋',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6C63FF),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Selecciona una opción',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: GridView.builder(
                  itemCount: sections.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    final section = sections[index];
                    final bool isSelected = selectedIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        Navigator.pushNamed(context, section['route']);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFF6C63FF) : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              section['icon'],
                              size: 50,
                              color: isSelected ? Colors.white : const Color(0xFF6C63FF),
                            ),
                            const SizedBox(height: 10),
                            AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 300),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: isSelected ? Colors.white : Colors.black87,
                              ),
                              child: Text(section['title'], textAlign: TextAlign.center),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
