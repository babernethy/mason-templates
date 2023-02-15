import 'package:{{appName.snakeCase()}}/app/flex_color_helpers.dart';
import 'package:{{appName.snakeCase()}}/screens/screens.dart';
import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));
}

// Define your seed colors.
const Color primarySeedColor = Color(0xFF6750A4);
const Color secondarySeedColor = Color(0xFF3871BB);
const Color tertiarySeedColor = Color(0xFF6CA450);

enum RoutesEnum {
  home('home', '/'),
  {{firstScreen.camelCase()}}('{{firstScreen.camelCase()}}', '{{{firstPath}}}');

  final String routeName;
  final String routePath;
  const RoutesEnum(this.routeName, this.routePath);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const usedTone = FlexTonesEnum.custom;
    const bool useSecondaryKey = true;
    const bool useTertiaryKey = true;
    const bool keepAllOnColorsBW = false;
    const bool useMaterial3 = true;
    final textTheme =
        GoogleFonts.balsamiqSansTextTheme(Theme.of(context).textTheme);
    return MaterialApp.router(
      title: '{{appTitle}}',
      themeMode: ThemeMode.light,
      routerConfig: getGoRouterConfig(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: selectedSeedScheme(
          brightness: Brightness.light,
          tones: usedTone
              .tones(Brightness.light)
              .onMainsUseBW(keepAllOnColorsBW)
              .onSurfacesUseBW(keepAllOnColorsBW),
          useSecondaryKey: useSecondaryKey,
          useTertiaryKey: useTertiaryKey,
        ),
        useMaterial3: useMaterial3,
        textTheme: textTheme,
      ),
      darkTheme: ThemeData.from(
        colorScheme: selectedSeedScheme(
          brightness: Brightness.dark,
          tones: usedTone
              .tones(Brightness.dark)
              .onMainsUseBW(keepAllOnColorsBW)
              .onSurfacesUseBW(keepAllOnColorsBW),
          useSecondaryKey: useSecondaryKey,
          useTertiaryKey: useTertiaryKey,
        ),
        useMaterial3: useMaterial3,
        textTheme: textTheme,
      ),
    );
  }
}

GoRouter getGoRouterConfig() {
  return GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: RoutesEnum.home.routeName,
        path: RoutesEnum.home.routePath,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        name: RoutesEnum.{{firstScreen.camelCase()}}.routeName,
        path: RoutesEnum.{{firstScreen.camelCase()}}.routePath,
        builder: (context, state) {
          return const {{firstScreenClass.pascalCase()}}();
        },
      ),


    ],
  );
}

ColorScheme selectedSeedScheme({
  required Brightness brightness,
  required FlexTones tones,
  required bool useSecondaryKey,
  required bool useTertiaryKey,
}) =>
    SeedColorScheme.fromSeeds(
      brightness: brightness,
      primaryKey: primarySeedColor,
      secondaryKey: useSecondaryKey ? secondarySeedColor : null,
      tertiaryKey: useTertiaryKey ? tertiarySeedColor : null,
      tones: tones,
    );

final ColorScheme schemeLightHc = SeedColorScheme.fromSeeds(
  primaryKey: primarySeedColor,
  secondaryKey: secondarySeedColor,
  tertiaryKey: tertiarySeedColor,
  tones: FlexTones.ultraContrast(Brightness.light),
);

final ColorScheme schemeDarkHc = SeedColorScheme.fromSeeds(
  brightness: Brightness.dark,
  primaryKey: primarySeedColor,
  secondaryKey: secondarySeedColor,
  tertiaryKey: tertiarySeedColor,
  tones: FlexTones.ultraContrast(Brightness.dark),
);
