import 'package:flutter/material.dart';
import 'package:jawi_app/page/MainPage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  //supabase setup
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://scuqpigqniqtiitpvktm.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNjdXFwaWdxbmlxdGlpdHB2a3RtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzIwMDI5NjYsImV4cCI6MjA0NzU3ODk2Nn0.9lJNbfTQmC0HsfvQ4ciACkkUQXur4WX1ps2eje-dMa4",
  );

  //run app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

