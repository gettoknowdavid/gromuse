import 'package:flutter/material.dart';

import 'app.dart';
import 'config/injector/injector.dart';

void main() {
  configureDependencies();
  runApp(const GromuseApp());
}
