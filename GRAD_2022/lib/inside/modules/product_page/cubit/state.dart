abstract class ProductsSates {}

class ProductsIntialStates extends ProductsSates {}

class ProductsGetProductLoadingStates extends ProductsSates {}

class ProductsGetProductSuccesssStates extends ProductsSates {}

class ProductsGetProductErorrStates extends ProductsSates {
  final String error;
  ProductsGetProductErorrStates(this.error);
}
