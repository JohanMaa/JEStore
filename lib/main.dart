import 'package:flutter/material.dart';
import 'package:eccomerce/pages/Homepage.dart';
import 'package:eccomerce/pages/CartPage.dart';
import 'package:provider/provider.dart';
import 'package:eccomerce/providers/cart_provider.dart';
import 'package:eccomerce/providers/payment_provider.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => PaymentProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
        ),
        routes: {
          "/": (context) => HomePage(),
          "cartPage": (context) => CartPage(),
        },
      ),
    );
  }
}
