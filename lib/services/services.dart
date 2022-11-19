import 'package:built_collection/built_collection.dart';

import '../models/products.dart';

abstract class Services {
  void resetPass({String? email});
  void signin({String? mail, String? pass});
  void signout();
  void signup({String? name, String? mail, String? pass});
  void addproduct(
      {required String name,
      required String price,
      required int id,
      required String path,
      required String unit});
  Future<BuiltList<Products>> getprods();
  Future<void> updatecart(int id);
  Future<void> unlikeprod(int id);
  Future<void> likeprod(int id);
}
