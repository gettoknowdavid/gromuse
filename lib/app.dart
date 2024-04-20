import 'package:flutter/material.dart';

import 'config/config.dart';

class GromuseApp extends StatelessWidget {
  const GromuseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GromuseRouter.router,
      debugShowCheckedModeBanner: false,
      theme: GTheme.light,
      darkTheme: GTheme.dark,
    );
  }
}
