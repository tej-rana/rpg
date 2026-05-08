import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg/screens/home/home.dart';
import 'package:rpg/services/character_store.dart';
import 'package:rpg/theme.dart';

//firebase stuff
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // firebase
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (_) => CharacterStore(),
      child: MaterialApp(
        theme: primaryTheme,
        home: const Home(),
      ),
    ),
  );
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandbox'),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Text('Sandbox'),
      ),
    );
  }
}
