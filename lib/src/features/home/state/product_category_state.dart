import 'package:fake_shop/core/base/base_state.dart';
import 'package:fake_shop/src/features/home/models/product_model.dart';

class ProductSuccessState extends SuccessState {
  final Product? product;

  const ProductSuccessState(this.product);
}
