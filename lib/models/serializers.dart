import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:product_dev/models/appstate.dart';
import 'package:product_dev/models/products.dart';

part 'serializers.g.dart';

@SerializersFor([
  // TODO: add the built values that require serialization
  Appstate, Products
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
