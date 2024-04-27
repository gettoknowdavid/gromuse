import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gromuse/responsive_widgets.su.dart';

import 'config/config.dart';

class GromuseApp extends StatelessWidget {
  const GromuseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      responsiveWidgets: responsiveWidgets,
      ensureScreenSize: true,
      builder: (_, child) => MaterialApp.router(
        routerConfig: GromuseRouter.router,
        debugShowCheckedModeBanner: false,
        theme: GTheme.light,
        darkTheme: GTheme.dark,
        themeMode: ThemeMode.light,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(1.sp),
          ),
          child: child!,
        ),
      ),
    );
  }
}
