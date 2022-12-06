import 'package:fake_shop/src/features/home/components/product_list.dart';
import 'package:fake_shop/src/features/home/controllers/product_category_controller.dart';
import 'package:fake_shop/src/features/home/state/product_category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final productState = ref.watch(productProvider);
        final products = ref.read(productProvider.notifier).products;
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    itemBuilder: (ctx, index) {
                      return ProductList(
                        productImage: products[index].image,
                        productName: products[index].title,
                        productPrice: products[index].price.toString(),
                      );
                    },
                  ),
                const SizedBox(height: 18),
              ],
            ),
          ),
        );
      },
    );
  }
}
