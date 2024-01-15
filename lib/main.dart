import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_redpoint/presentation/pages/change_password.dart';
import 'package:project_redpoint/presentation/pages/chat_page.dart';
import 'package:project_redpoint/presentation/pages/chat_start_page.dart';
import 'package:project_redpoint/presentation/pages/edit_profile.dart';
import 'package:project_redpoint/presentation/pages/login_page.dart';
import 'package:project_redpoint/presentation/pages/main_page.dart';
import 'package:project_redpoint/presentation/pages/merch_buy_page.dart';
import 'package:project_redpoint/presentation/pages/merch_done_page.dart';
import 'package:project_redpoint/presentation/pages/merch_page.dart';
import 'package:project_redpoint/presentation/pages/profile_page.dart';
import 'package:project_redpoint/presentation/pages/signup_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  Supabase.initialize(
      url: 'https://sxmjkgztaxwjayznvmol.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN4bWprZ3p0YXh3amF5em52bW9sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA1MzUwODMsImV4cCI6MjAxNjExMTA4M30.30SOljq8yS2dWZEp4yBJe6tRFwsFFYFd-QMJZgi00BM');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/': (context) => const MainPage(),
        '/signup': (context) => SignUpPage(),
        '/profile': (context) => ProfilePage(),
        '/merch': (context) => const MerchPage(),
        '/chat': (context) => const ChatStartPage(),
        '/admin_chat': (context) => ChatPage(),
        '/change_password': (context) => ChangePasswordPage(),
        '/edit_profile': (context) => const EditProfile(),
        '/merch_buy':(context) => MerchBuyPage(),
        '/merch_done':(context) => MerchDonePage()
      },
      // home: MerchDonePage(),
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}
