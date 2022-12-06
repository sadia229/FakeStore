import 'dart:io';

import 'package:fake_shop/app_root.dart';
import 'package:fake_shop/service/network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    const ProviderScope(
      child: AppRoot(),
    ),
  );
}
