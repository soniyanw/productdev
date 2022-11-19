import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:product_dev/models/products.dart';
import 'package:product_dev/services/services.dart';

class ServiceImp implements Services {
  CollectionReference<Map<String, dynamic>> collectionProducts =
      FirebaseFirestore.instance.collection('products');
  @override
  void resetPass({String? email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email ?? '');
  }

  void signin({String? mail, String? pass}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: mail ?? '', password: pass ?? '');
  }

  @override
  void signout() async {
    //signing out
    await FirebaseAuth.instance.signOut();
  }

  @override
  void signup({String? name, String? mail, String? pass}) async {
    //signing up
    UserCredential userc;
    userc = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: mail ?? '', password: pass ?? '');
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userc.user!.uid)
        .set({"mail": mail, "name": name, "id": userc.user!.uid});
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: mail ?? '', password: pass ?? '');
  }

  Future<BuiltList<Products>> getprods() async {
    //get the products from the database
    final QuerySnapshot<Map<String, dynamic>> _collectionRef =
        await collectionProducts.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshot =
        _collectionRef.docs;
    List<Products> product_data = [];

    snapshot.forEach((element) {
      product_data.add(Products.fromJson(element.data()));
    });
    print("products");
    print(product_data);
    return product_data.toBuiltList();
  }

  Future<void> updatecart(int id) async {
    //add the product to cart
    final collection = FirebaseFirestore.instance.collection('products');
    var newDocumentBody = {"cart": true};
    DocumentReference docRef;

    var response = await collection.where('id', isEqualTo: id).get();
    var batch = FirebaseFirestore.instance.batch();
    response.docs.forEach((doc) {
      docRef = collection.doc(doc.id);
      print(doc.id);
      batch.update(docRef, newDocumentBody);
    });
    batch.commit().then((a) {
      print('updated all documents inside Collection');
    });
  }

  void addproduct(
      //adding the product
      {required String name,
      required String price,
      required int id,
      required String path,
      required String unit}) async {
    final products =
        await FirebaseFirestore.instance.collection('products').doc();
    Products newProduct = Products((b) => b
      ..name = name
      ..price = price
      ..id = id
      ..cart = false
      ..path = path
      ..unit = unit
      ..fav = false);
    products.set(newProduct.toJson());
  }

  Future<void> likeprod(int id) async {
    //liking the product
    final collection = FirebaseFirestore.instance.collection('products');
    var newDocumentBody = {"fav": true};
    DocumentReference docRef;

    var response = await collection.where('id', isEqualTo: id).get();
    var batch = FirebaseFirestore.instance.batch();
    response.docs.forEach((doc) {
      docRef = collection.doc(doc.id);
      print(doc.id);
      batch.update(docRef, newDocumentBody);
    });
    batch.commit().then((a) {
      print('updated all documents inside Collection');
    });
  }

  Future<void> unlikeprod(int id) async {
    //unlike the product
    final collection = FirebaseFirestore.instance.collection('products');
    var newDocumentBody = {"fav": false};
    DocumentReference docRef;

    var response = await collection.where('id', isEqualTo: id).get();
    var batch = FirebaseFirestore.instance.batch();
    response.docs.forEach((doc) {
      docRef = collection.doc(doc.id);
      print(doc.id);
      batch.update(docRef, newDocumentBody);
    });
    batch.commit().then((a) {
      print('updated all documents inside Collection');
    });
  }

  Future<BuiltList<Products>> getorders() async {
    final QuerySnapshot<Map<String, dynamic>> _collectionRef =
        await collectionProducts.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshot =
        _collectionRef.docs;
    List<Products> product_data = [];

    snapshot.forEach((element) {
      product_data.add(Products.fromJson(element.data()));
    });
    print("orders");
    print(product_data);
    return product_data.toBuiltList();
  }

  void addorders({
    required String geopoint,
    required String products,
    required int id,
  }) async {
    final products =
        await FirebaseFirestore.instance.collection('products').doc();
    Products newProduct = Products((b) => b..id = id);
    products.set(newProduct.toJson());
  }
}
