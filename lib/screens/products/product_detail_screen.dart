// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
//
// import '../../models/product/products.dart';
// import '../../models/add_product_variant.dart';
//
// class ProductDetailsScreen extends StatefulWidget {
//   final Products product;
//
//   const ProductDetailsScreen({super.key, required this.product});
//
//   @override
//   State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
// }
//
// class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
//   final TextEditingController _sizeController = TextEditingController();
//   final TextEditingController _costController = TextEditingController();
//   late List<ProductVariant> _variants;
//
//   @override
//   void initState() {
//     super.initState();
//     _variants = List<ProductVariant>.from(widget.product.variants);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.product.name),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const Text(
//               'Product Details:',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             Text('Category: ${widget.product.category}'),
//             const SizedBox(height: 16),
//             const Text(
//               'Variants:',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: _variants.length,
//               itemBuilder: (context, index) {
//                 final variant = _variants[index];
//                 return ListTile(
//                   title: Text('${variant.size} - \$${variant.cost.toString()}'),
//                 );
//               },
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _sizeController,
//               decoration: const InputDecoration(
//                 labelText: 'Variant Size',
//               ),
//             ),
//             const SizedBox(height: 8),
//             TextField(
//               controller: _costController,
//               decoration: const InputDecoration(
//                 labelText: 'Variant Cost',
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 final variant = ProductVariant(
//                   size: _sizeController.text,
//                   cost: double.parse(_costController.text),
//                 );
//                 setState(() {
//                   _variants.add(variant);
//                   final updatedProduct = Products(
//                       name: widget.product.name,
//                       category: widget.product.category,
//                       variants: _variants);
//                   // Update the product in the box by searching with its name
//                   final productsBox = Hive.box<Products>('products');
//                   final existingProductIndex = productsBox.values
//                       .toList()
//                       .indexWhere((p) => p.name == updatedProduct.name);
//                   if (existingProductIndex != -1) {
//                     productsBox.putAt(existingProductIndex, updatedProduct);
//                   }
//                 });
//                 _sizeController.clear();
//                 _costController.clear();
//               },
//               child: const Text('Add Variant'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
