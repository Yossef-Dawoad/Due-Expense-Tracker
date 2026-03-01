import '../../core/utils/navigation/router_service.dart';
import '../../core/utils/navigation/routes.dart';

class NotFoundViewModel {
  final RouterService _routerService;

  NotFoundViewModel({required RouterService routerService})
    : _routerService = routerService;

  void navigateToHome() {
    _routerService.go(Routes.home);
  }
}
