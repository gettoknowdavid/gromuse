import 'package:flutter/material.dart';

import 'config/route/router.dart';

class GromuseApp extends StatelessWidget {
  const GromuseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GromuseRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.light,
        ),
      ),
    );
  }
}
