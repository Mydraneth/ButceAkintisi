import 'package:butceakintisi/core/router.dart'; // Router dosyan
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // ProviderScope tüm Riverpod sistemi için şarttır
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Manuel tanımladığımız provider'ı izliyoruz
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: 'Bütçe Akıntısı',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE3B53C)),
        useMaterial3: true,
        // Scaffold arka planını koyu yapalım ki Dashboard ile uyumlu olsun (opsiyonel)
        scaffoldBackgroundColor: Colors.grey[900],
      ),
    );
  }
}
