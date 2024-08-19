import 'dart:async';
import 'dart:js_interop';

import 'package:products/models/product/product_model.dart';

class ProductListService {
  bool internetConnectionAvailiabilty = true;
  bool isProductLoading = false;
  int skip = 0;
  List<ProductModel> productList = <ProductModel>[];

  final StreamController<List<ProductModel>> _productListController =
      StreamController<List<ProductModel>>.broadcast();
      Sink<List<ProductModel>> get _addProductList => _productListController.sink;
  Stream<List<ProductModel>> get getProductsList => _productListController.stream;

  ProductListService() {
    //todo: Check if internet connection is available
    //todo: If not available, Alert the Products list services that no internet connection is available 
      startListeners();
    }
  
  void dispose() {
    _productListController.close();
  }
  void startListeners() {
    _productListController.stream.listen((product){
      isProductLoading = false;
    });
  } 

   void addProducts(List<ProductModel> addToProductList) {
    //  add a new poduct to a exiting list
    if(addToProductList.isNotEmpty) {
      isProductLoading = true;
      productList.addAll(addToProductList);
    }
  _addProductList.add(productList);
  
   }

   addProductError( String error) {
    isProductLoading = false;
    _productListController.addError(error);
   }

   void refreshCurrentListProducts(){
    _addProductList.add(productList);
   }

   void  clearProducts(){
    skip = 0;
    productList.clear();
    _addProductList.add([]);
   }
}


// 1.11.11