import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'product_list_service.dart';

class ConnectionService {
  late StreamSubscription<ConnectivityResult> connectivity;
  // late StreamSubscription<List<ConnectivityResult>> connectivity;
  late ProductListService productListService;

  ConnectionService(ProductListService service){
    productListService = service;
  }

  Future<bool> isConnectionAvailable() async {
    bool isConnectionAvailable = true;
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      isConnectionAvailable = false;
      productListService.internetConnectionAvailiabilty=false;
      productListService.isProductLoading = false;
      productListService.addProductError("No internet connection");

    }
    return isConnectionAvailable;
  }

  watchConnectivity( ProductListService productListService) {
    connectivity = Connectivity().onConnectivityChanged.listen((ConnectivityResult status) {
      switch(status){
        case ConnectivityResult.none:
          productListService.internetConnectionAvailiabilty=false;
          productListService.isProductLoading = false;
          productListService.addProductError("No internet connection");
          break;
        default:
          productListService.internetConnectionAvailiabilty=true;
          productListService.refreshCurrentListProducts();
      }
    }) ;
  }
  void cancel(){
    //todo:
    connectivity.cancel();
  }
}
