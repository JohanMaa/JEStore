import 'package:eccomerce/models/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:eccomerce/widgets/CartAppBar.dart';
import 'package:provider/provider.dart';
import 'package:eccomerce/providers/cart_provider.dart';
import 'package:eccomerce/providers/payment_provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final paymentProvider = Provider.of<PaymentProvider>(context);
    PaymentMethod? _selectedMethod;

    return Scaffold(
      body: ListView(
        children: [
          CartAppBar(),
          Container(
            height: 700,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
                color: Color(0xFFEDECF2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                )),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (ctx, i) => ListTile(
                      leading: Image.asset(cart.items.values.toList()[i].imageUrl),
                      title: Text(cart.items.values.toList()[i].name),
                      subtitle: Text('\$${cart.items.values.toList()[i].price}'),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_shopping_cart),
                        onPressed: () {
                          cart.removeItem(cart.items.keys.toList()[i]);
                        },
                      ),
                    ),
                  ),
                ),
                Text(
                  'Total: \$${cart.totalAmount}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                DropdownButton<PaymentMethod>(
                  hint: Text("Pilih Metode Pembayaran"),
                  value: _selectedMethod,
                  items: paymentProvider.methods.map((method) {
                    return DropdownMenuItem<PaymentMethod>(
                      value: method,
                      child: Text(method.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    _selectedMethod = value;
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_selectedMethod != null) {
                      // Proses checkout dengan metode pembayaran yang dipilih
                    } else {
                      // Tampilkan pesan bahwa metode pembayaran belum dipilih
                    }
                  },
                  child: Text('Checkout'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
