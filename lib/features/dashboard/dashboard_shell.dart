import 'package:butceakintisi/core/components/bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// StatefulNavigationShell, GoRouter'ın bize verdiği sihirli kutu.
// Sayfalar arası state'i (kaydırma konumu vs.) korur.
class DashboardShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const DashboardShell({super.key, required this.navigationShell});

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // Tıklandığında o dalın en başına (ilk sayfasına) dönmesini sağlar.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Arkaplanın navbar altına akması için
      extendBodyBehindAppBar: true,
      // navigationShell, o anki aktif sayfadır (Home, Settings, vs.)
      body: navigationShell,
      bottomNavigationBar: CustomBottomAppBar(
        selectedIndex: navigationShell.currentIndex,
        onItemTapped: _goBranch,
      ),
    );
  }
}
