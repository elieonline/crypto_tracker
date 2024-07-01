import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/navigations/router.dart';
import 'core/utils/theme.dart';
import 'features/auth/data/user_repository_impl.dart';
import 'widgets/app_overlay.dart';

final appRouter = AppRouter();

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final _controller = OverLayLoaderController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Color(0xFF101010),
      ),
    );
    final themeMode = ref.watch(themeModeProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: AppOverlay(
        controller: _controller,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Crypto Tracker',
          themeMode: themeMode,
          darkTheme: AppTheme.darkTheme(),
          theme: AppTheme.lightTheme(),
          routerConfig: appRouter.config(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
