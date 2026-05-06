import 'package:crate/core/isar/isar.dart';
import 'package:crate/features/inventory/providers/inventory_provider.dart';
import 'package:crate/features/inventory/screens/inventory_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isar = await openDatabase();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InventoryProvider(isar)),
      ],
      child: const CrateApp(),
    ),
  );
}

class CrateApp extends StatelessWidget {
  const CrateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const InventoryScreen(),
    );
  }
}
