import 'package:supabase_flutter/supabase_flutter.dart';

import '../config/env.dart';

class SupabaseService {
  late final SupabaseClient client;

  SupabaseService._initialize(this.client);

  static Future<SupabaseService> initialize() async {
    final supabase = await Supabase.initialize(
      url: Env.supabaseUrl,
      anonKey: Env.supabaseAnonKey,
    );
    return SupabaseService._initialize(supabase.client);
  }
}
