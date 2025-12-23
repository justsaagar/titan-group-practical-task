import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/api_constants.dart';
import '../models/item_model.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  Future<List<ItemModel>> fetchItems() async {
    try {
      final response = await http.get(
        Uri.parse(ApiConstants.getItemsUrl()),
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        
        if (jsonData['success'] == true && jsonData['data'] != null) {
          final List<dynamic> itemsJson = jsonData['data'] as List<dynamic>;
          return itemsJson.map((json) => ItemModel.fromJson(json)).toList();
        } else {
          throw Exception('Failed to parse items data');
        }
      } else {
        throw Exception('Failed to load items: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching items: $e');
    }
  }

  Future<ItemModel> fetchItemById(int id) async {
    try {
      final response = await http.get(
        Uri.parse(ApiConstants.getItemUrl(id)),
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        
        if (jsonData['success'] == true && jsonData['data'] != null) {
          return ItemModel.fromJson(jsonData['data']);
        } else {
          throw Exception('Failed to parse item data');
        }
      } else {
        throw Exception('Failed to load item: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching item: $e');
    }
  }
}

