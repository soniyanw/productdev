import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:product_dev/models/appstate.dart';
import 'package:product_dev/models/products.dart';
import 'package:product_dev/services/service_imp.dart';
import 'package:product_dev/services/services.dart';
import 'package:state_notifier/state_notifier.dart';

class Changes extends StatelessWidget {
  const Changes({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<MyModel, Appstate>(
      create: (c) => MyModel(),
      child: child,
    );
  }
}

class MyModel extends StateNotifier<Appstate> with LocatorMixin {
  MyModel() : super(Appstate());
  Services imp = new ServiceImp();
  Future<void> getproducts() async {
    Services imp = new ServiceImp();
    BuiltList<Products> a = await imp.getprods();
    state = state.rebuild((p0) {
      p0.products = a.toBuilder();
    });
  }
  /* void assignDescrip(String val) {
    state = state.rebuild((p0) => p0.descrip = val);
  }

  Future<void> getdetails() async {
    String name = await imp.getcurrentuser_name();
    String id = await imp.getcurrentuser_id();
    String mail = await imp.getcurrentuser_mail();
    state = state.rebuild((p0) => p0.name = name);
    state = state.rebuild((p0) => p0.mail = mail);
    state = state.rebuild((p0) => p0.id = id);
  }

  Future<void> get_collab_list() async {
    final BuiltList<Collaborations> a = await imp.getcollaborations();
    state = state.rebuild((p0) {
      p0.collaborations = a.toBuilder();
    });
  }

  Future<void> get_query_list() async {
    final BuiltList<Queries> a = await imp.getqueries();
    state = state.rebuild((p0) {
      p0.queries = a.toBuilder();
    });
  }

  Future<void> get_ans_list(String queryid) async {
    final BuiltList<Answer> a = await imp.getanswers(queryid);
    state = state.rebuild((p0) {
      p0.answers = a.toBuilder();
    });
  }*/
}
