import 'package:flutter/material.dart';
import 'package:{{appName.snakeCase()}}/app/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));
}
