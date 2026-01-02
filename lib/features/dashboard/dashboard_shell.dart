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
      // AnimatedSwitcher with a layoutBuilder that *drops* the previous child,
      // so we avoid duplicate navigator GlobalKeys while still animating in.
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        layoutBuilder: (currentChild, previousChildren) {
          // Only keep the incoming child to prevent duplicate navigator keys.
          return currentChild ?? const SizedBox.shrink();
        },
        transitionBuilder: (child, animation) {
          final curved =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);
          return FadeTransition(
            opacity: curved,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.04),
                end: Offset.zero,
              ).animate(curved),
              child: child,
            ),
          );
        },
        child: KeyedSubtree(
          key: ValueKey(navigationShell.currentIndex),
          child: navigationShell,
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        selectedIndex: navigationShell.currentIndex,
        onItemTapped: _goBranch,
      ),
    );
  }
}
