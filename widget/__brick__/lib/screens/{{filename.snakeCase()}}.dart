import 'package:{{appName.snakeCase()}}/app/app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class {{firstScreenClass.pascalCase()}} extends ConsumerWidget {
  const {{firstScreenClass.pascalCase()}}({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary.withAlpha(150),
        title: const Text('{{filename.titleCase()}}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              context.go(RoutesEnum.home.routePath);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
            child: Column(
              children: const [
                 Text('{{filename.titleCase()}} Screen'),
              ],
            ),
          ),
      );
       
  }
}
