import 'package:butceakintisi/features/dashboard/dashboard_shell.dart';
import 'package:butceakintisi/features/pages/accounts_page.dart';
import 'package:butceakintisi/features/pages/home_page.dart';
import 'package:butceakintisi/features/pages/settings_page.dart';
import 'package:butceakintisi/features/pages/transactions_page.dart';
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
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          // 2. Dal: Transactions
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/transactions',
                builder: (context, state) => const TransactionsPage(),
              ),
            ],
          ),
          // 3. Dal: Accounts
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/accounts',
                builder: (context, state) =>
                    const AccountsPage(), // Placeholder
              ),
            ],
          ),
          // 4. Dal: Settings
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: '/settings',
                  builder: (context, state) =>
                      const SettingsPage() // Placeholder
                  ),
            ],
          ),
        ],
      ),
    ],
  );
}
