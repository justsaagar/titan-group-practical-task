import 'package:get/get.dart';
import '../models/item_model.dart';
import '../services/api_service.dart';

class ItemsController extends GetxController {
  final ApiService _apiService = ApiService();
  
  final RxList<ItemModel> items = <ItemModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxBool hasError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  Future<void> fetchItems() async {
    try {
      isLoading.value = true;
      hasError.value = false;
      errorMessage.value = '';
      
      final fetchedItems = await _apiService.fetchItems();
      items.value = fetchedItems;
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString().replaceAll('Exception: ', '');
      items.clear();
    } finally {
      isLoading.value = false;
    }
  }

  void retry() {
    fetchItems();
  }
}

