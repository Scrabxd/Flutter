import 'package:flutter/material.dart';
import 'package:fluttertest/screens/product_screen.dart';
import 'package:fluttertest/screens/screens.dart';
import 'package:fluttertest/services/products_service.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(AppState());
}


class AppState extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [ 
        ChangeNotifierProvider(create: (_) => ProductsService())
        ],
        child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Routing system app",
      initialRoute: "products",
      routes: {
        "login": (_) => const LoginScreen(),
        "home": (_) => const HomeScreen(),
        "products":(_) => const ProductScreen(),
      },
    );
  }
}