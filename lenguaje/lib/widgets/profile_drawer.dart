import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../routes.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Drawer(
      backgroundColor: const Color(0xFFF3F0FF),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          if (user != null)
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF6C63FF)),
              accountName: Text(user.displayName ?? 'Usuario'),
              accountEmail: Text(user.email ?? ''),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: user.photoURL != null
                    ? NetworkImage(user.photoURL!)
                    : null,
                child: user.photoURL == null
                    ? const Icon(Icons.person, size: 40, color: Color(0xFF6C63FF))
                    : null,
              ),
            )
          else
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF6C63FF)),
              child: Center(
                child: Text(
                  'Modo invitado',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Editar perfil'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.profile);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            },
          ),
        ],
      ),
    );
  }
}
