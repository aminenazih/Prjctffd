import 'package:flutter/material.dart';

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'dishes 1',
      description: 'A delecious dishes',
      price: 29.99,
      imageUrl:
      'https://cdn.imgbin.com/23/14/4/imgbin-pasta-macaroni-and-cheese-bolognese-sauce-emoji-food-spaghetti-Cbz0XKf30YmbuRd5kftM2irea.jpg',
    ),
    Product(
      id: 'p2',
      title: 'dishes 2',
      description: 'A nice dishes.',
      price: 59.99,
      imageUrl:
      'https://cdn.imgbin.com/20/8/24/imgbin-bagel-bacon-fast-food-pasta-macaroni-and-cheese-bagel-uhTWdhpaA2pR7MFnAFgVNWGWe.jpg',
    ),
    Product(
      id: 'p3',
      title: 'dishes 3',
      description: 'this is another delecious dishes.',
      price: 19.99,
      imageUrl:
      'https://cdn.imgbin.com/18/24/1/imgbin-macaroni-and-cheese-pasta-salad-tex-mex-tex-mex-DDAW5k0GASKX6E9XfGWg2MkKj.jpg',
    ),
    Product(
      id: 'p4',
      title: 'dishes 4',
      description: 'Prepared by Mr.At.',
      price: 49.99,
      imageUrl:
      'https://cdn.imgbin.com/14/16/5/imgbin-vegetarian-cuisine-macaroni-and-cheese-submarine-sandwich-caesar-salad-lobster-roll-cheese-L9222ANF3cg7dTpZLAuAfmQVE.jpg',
    ),
  ];
  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct(Product product) {
    final newProduct = Product(
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
      id: DateTime.now().toString(),
    );
    _items.add(newProduct);
    // _items.insert(0, newProduct); // at the start of the list
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
