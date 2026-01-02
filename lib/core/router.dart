import 'package:butceakintisi/features/dashboard/dashboard_shell.dart';
import 'package:butceakintisi/features/pages/accounts_page.dart';
import 'package:butceakintisi/features/pages/home_page.dart';
import 'package:butceakintisi/features/pages/settings_page.dart';
import 'package:butceakintisi/features/pages/transactions_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

// Router'ı bir Provider olarak tanımlıyoruz ki ref'e erişebilelim
@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/home',
    debugLogDiagnostics: true,
    routes: [
      // STATEFUL SHELL ROUTE (Bottom Navigation İçin Standart)
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return DashboardShell(navigationShell: navigationShell);
        },
        branches: [
          // 1. Dal: Home
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                pageBuilder: (context, state) => _defaultTransitionPage(
                  state.pageKey,
                  const HomePage(),
                ),
              ),
            ],
          ),
          // 2. Dal: Transactions
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/transactions',
                pageBuilder: (context, state) => _defaultTransitionPage(
                  state.pageKey,
                  const TransactionsPage(),
                ),
              ),
            ],
          ),
          // 3. Dal: Accounts
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/accounts',
                pageBuilder: (context, state) => _defaultTransitionPage(
                  state.pageKey,
                  const AccountsPage(),
                ), // Placeholder
              ),
            ],
          ),
          // 4. Dal: Settings
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                pageBuilder: (context, state) => _defaultTransitionPage(
                  state.pageKey,
                  const SettingsPage(),
                ), // Placeholder
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

CustomTransitionPage<void> _defaultTransitionPage(
  LocalKey pageKey,
  Widget child,
) {
  return CustomTransitionPage<void>(
    key: pageKey,
    transitionDuration: const Duration(milliseconds: 250),
    reverseTransitionDuration: const Duration(milliseconds: 250),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curve = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
      return FadeTransition(
        opacity: curve,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.04),
            end: Offset.zero,
          ).animate(curve),
          child: child,
        ),
      );
    },
  );
}
