class PaymentMethod {
  final String id;
  final String name;
  final String type; // e.g., 'bank' or 'ewallet'
  
  PaymentMethod({
    required this.id,
    required this.name,
    required this.type,
  });
}
