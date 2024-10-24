import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    // Register the event handler for LoadProducts
    on<LoadProducts>((event, emit) async {
      emit(ProductLoading());

      try {
        // Load the product data from a JSON file in assets
        final String response = await rootBundle.loadString('json/products.json');
        final List<dynamic> data = json.decode(response);
        // Parse the JSON data into a list of maps
        final List<Map<String, dynamic>> products = data.map((item) => item as Map<String, dynamic>).toList();

        emit(ProductLoaded(products));
      } catch (error) {
        emit(ProductError('Failed to load products'));
      }
    });
  }
}
