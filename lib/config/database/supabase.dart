import 'package:gromuse/core/env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> configureSupabase() async {
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseAnonKey,
  );
}
