import 'package:flutter/material.dart';
import 'package:products/services/connection_service.dart';
import 'package:products/services/product_list_service.dart';
import 'package:products/widgets/status_message.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ConnectionService connectionService;
  // late ProductListService productListService;

  final ProductListService productListService = ProductListService();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    connectionService = ConnectionService(productListService);
    connectionService.watchConnectivity(productListService);
    //check if scroll has reached the bottom,then retrive the next 10 record/products
    scrollController.addListener(() {
      if(scrollController.offset == scrollController.position.maxScrollExtent && !productListService.isProductLoading) {
        //get the next 10 products
        // productListService.getProducts();
      }
    });
  }
  @override
  void dispose() {


    super.dispose();
  }

Future<bool> checkInternetConnection() async {
  productListService.internetConnectionAvailiabilty = await connectionService.isConnectionAvailable();
  if(!productListService.internetConnectionAvailiabilty) {
    productListService.internetConnectionAvailiabilty= false;
    productListService.isProductLoading = false;
    productListService.addProductError("No internet connection.");
  }
  return productListService.internetConnectionAvailiabilty;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: SafeArea(child: StreamBuilder(
        stream: productListService.getProductsList,
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(!productListService.internetConnectionAvailiabilty) {
            return const StatusMessage(message: "No internet connection", bannerMessage: "none", bannerColor: Colors.yellow, textColor: Colors.black);

          }
          //todo: check snapshot connection state
          return Text("No internert");
          
          
        },
      ),)
    );
  }
}