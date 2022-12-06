import 'package:fake_shop/core/base/base_state.dart';
import 'package:fake_shop/core/network/api.dart';
import 'package:fake_shop/core/network/network_utils.dart';
import 'package:fake_shop/src/features/home/models/product_model.dart';
import 'package:fake_shop/src/features/home/state/product_category_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Providers
final productProvider = StateNotifierProvider<ProductController, BaseState>(
  (ref) => ProductController(ref: ref),
);

/// Controllers
class ProductController extends StateNotifier<BaseState> {
  final Ref? ref;

  ProductController({this.ref}) : super(const InitialState());
  Product? products;

  Future fetchProducts() async {
    state = const LoadingState();
    var responseBody;
    try {
      responseBody =
          await Network.handleResponse(await Network.getRequest(API.products));
      if (responseBody != null) {
        products = Product.fromJson(responseBody);
        state = ProductSuccessState(products);
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print("error = $error");
      print("error = $stackTrace");
      state = const ErrorState();
    }
  }
}
