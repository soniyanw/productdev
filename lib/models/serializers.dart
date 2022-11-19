import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:product_dev/models/appstate.dart';

part 'serializers.g.dart';

@SerializersFor([
  // TODO: add the built values that require serialization
  Appstate,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
