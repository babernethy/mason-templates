import 'package:{{appName.snakeCase()}}/app/app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              context.go(RoutesEnum.home.routePath);
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              context.push(RoutesEnum.{{firstScreen.camelCase()}}.routePath);
            },
            child: const Text('{{firstScreen.titleCase()}}'),
          ),
        ],
      ),
    );
  }
}
