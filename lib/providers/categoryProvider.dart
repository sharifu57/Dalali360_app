// import 'package:dalali360_app/library/api_request.dart';
// import 'package:dalali360_app/models/categoryModel.dart';

// class CategoriesProvider {
//   void getCategories({
//     required Function beforeSend,
//     required Function(List<Category> categories) onSuccess,
//     required Function(dynamic error) onError,
//   }) {
//     ApiRequest(
//             url: 'http://192.168.1.189:8001/api/v1/app/property-categories', data: {})
//         .get(
//             beforeSend: () => {if (beforeSend != null) beforeSend()},
//             onSuccess: (data) {
//               onSuccess((data as List)
//                   .map((categoryJson) => Category.fromJson(categoryJson))
//                   .toList());
//             }, onError: ((error) => {if(onError != null ) onError(error)})
//   }
// }
