import 'package:flutter/material.dart';
import 'package:eccomerce/models/payment_method.dart';

class PaymentProvider with ChangeNotifier {
  List<PaymentMethod> _methods = [
    PaymentMethod(id: '1', name: 'Bank BRI', type: 'bank'),
    PaymentMethod(id: '2', name: 'Bank BNI', type: 'bank'),
    PaymentMethod(id: '3', name: 'Bank BCA', type: 'bank'),
    PaymentMethod(id: '4', name: 'Bank Mandiri', type: 'bank'),
    PaymentMethod(id: '5', name: 'DANA', type: 'ewallet'),
    PaymentMethod(id: '6', name: 'Gopay', type: 'ewallet'),
    PaymentMethod(id: '7', name: 'OVO', type: 'ewallet'),
  ];

  List<PaymentMethod> get methods {
    return [..._methods];
  }
}
