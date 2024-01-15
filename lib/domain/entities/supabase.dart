import 'package:supabase/supabase.dart';

class Supabase {
  static final Supabase _instance = Supabase._internal();

  Supabase._internal();

  factory Supabase() {
    return _instance;
  }

  SupabaseClient getSupabase() {
    return SupabaseClient(
      'https://sxmjkgztaxwjayznvmol.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN4bWprZ3p0YXh3amF5em52bW9sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA1MzUwODMsImV4cCI6MjAxNjExMTA4M30.30SOljq8yS2dWZEp4yBJe6tRFwsFFYFd-QMJZgi00BM');
  }
}
