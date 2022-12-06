import 'package:fake_shop/route/route_generator.dart';
import 'package:fake_shop/service/navigation_service.dart';
import 'package:fake_shop/src/features/home/controllers/product_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppRoot extends ConsumerStatefulWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AppRootState createState() => _AppRootState();
}

class _AppRootState extends ConsumerState<AppRoot> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() {
    ref.read(productProvider.notifier).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: NavigationService.navigatorKey,
    );
  }
}
