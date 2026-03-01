import 'package:flutter/material.dart';

import '../core/ui/app_theme.dart';
import '../core/utils/internal_notification/internal_notification_listener.dart';
import '../core/utils/l10n/app_localizations.dart';
import '../core/utils/l10n/translate.dart';
import '../core/utils/l10n/translate_extension.dart';
import '../core/utils/locator.dart';
import '../core/utils/navigation/router_service.dart';
import 'startup_view_model.dart';

class StartupView extends StatefulWidget {
  const StartupView({super.key});

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  late final StartupViewModel _viewModel = StartupViewModel();
  late final RouterService _routerService;

  @override
  void initState() {
    super.initState();
    _viewModel.initializeApp();
    _routerService = locator<RouterService>();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppState>(
      valueListenable: _viewModel.appStateNotifier,
      builder: (context, state, _) {
        return MaterialApp.router(
          title: 'Due',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.buildTheme(Brightness.light),
          darkTheme: AppTheme.buildTheme(Brightness.dark),
          themeMode: ThemeMode.system,
          routerConfig: _routerService.goRouter,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          builder: (context, child) {
            Translate.init(context);
            return switch (state) {
              InitializingApp() => _SplashView(),
              AppInitialized() => InternalNotificationListener(child: child!),
              AppInitializationError() => _StartupErrorView(
                onRetry: _viewModel.retryInitialization,
              ),
            };
          },
        );
      },
    );
  }
}

class _StartupErrorView extends StatelessWidget {
  const _StartupErrorView({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(context.spacing.s4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                color: context.theme.colorScheme.error,
                size: 48,
              ),
              SizedBox(height: context.spacing.s4),
              Text(
                context.translate.errorGeneric,
                style: context.textStyles.displayMD,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.spacing.s2),
              Text(
                context.translate.errorStartingApp,
                style: context.textStyles.displayMD,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.spacing.cardPaddingLG),
              FilledButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: Text(context.translate.retry),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
