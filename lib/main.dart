import 'package:fake_shop/src/features/home/controllers/product_category_controller.dart';
import 'package:fake_shop/src/features/home/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends ConsumerState<MyApp> {
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
    return const MaterialApp(
      title: 'FakeStore',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
