import 'package:dalali360_app/config.dart';
import 'package:dalali360_app/models/categoryModel.dart';
import 'package:dalali360_app/models/propertyModel.dart';
import 'package:dalali360_app/views/pagination_filter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

class CategoryController extends GetxController
    with SingleGetTickerProviderMixin {
  var categories = <CategoryModel>[].obs;
  var properties = <Property>[].obs;
  var isLoading = false.obs;
  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;

  int get limit => _paginationFilter.value.limit;
  int get _page => _paginationFilter.value.page;
  bool get lastPage => _lastPage.value;

  late AnimationController animationController;

  @override
  void onInit() {
    // TODO: implement onInit
    getCategories();
    // ever(_paginationFilter, (_) => getCategories());
    _changePaginationFilter(1, 15);
    // callMe();
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    animationController.dispose();
  }

  final currencyFormatter = NumberFormat('#,##0.00', 'ID');

  void changeTotalPerPage(int limitValue) {
    properties.clear();
    _lastPage.value = false;
    _changePaginationFilter(1, limitValue);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val?.page = page;
      val?.limit = limit;
    });
  }

  // void loadNextPage() => _changePaginationFilter(_page + 1, limit);
  Future getCategories() async {
    categories.clear();
    var dio = Dio();
    Response response;
    try {
      isLoading.value = true;
      Response response = await dio.get("${config['apiBaseUrl']!}/categories",
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
      if (response.statusCode == 200) {
        isLoading.value = false;
        for (var category in response.data['data']) {
          categories.add(CategoryModel.fromJson(category));
        }
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  Future getCategoryProperties(int categoryId) async {
    properties.clear();
    var dio = Dio();
    try {
      isLoading.value = true;
      Response response =
          await dio.get("${config['apiBaseUrl']!}/categories/" "$categoryId");
      if (response.statusCode == 200) {
        for (var property in response.data['data']) {
          properties.add(Property.fromJson(property));
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future _loadMoreHorizontal() async {
    // Add in an artificial delay
    await new Future.delayed(const Duration(seconds: 2));
  }
}
