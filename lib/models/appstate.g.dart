// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appstate.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Appstate> _$appstateSerializer = new _$AppstateSerializer();

class _$AppstateSerializer implements StructuredSerializer<Appstate> {
  @override
  final Iterable<Type> types = const [Appstate, _$Appstate];
  @override
  final String wireName = 'Appstate';

  @override
  Iterable<Object?> serialize(Serializers serializers, Appstate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'products',
      serializers.serialize(object.products,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Products)])),
    ];

    return result;
  }

  @override
  Appstate deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppstateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'products':
          result.products.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Products)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$Appstate extends Appstate {
  @override
  final BuiltList<Products> products;

  factory _$Appstate([void Function(AppstateBuilder)? updates]) =>
      (new AppstateBuilder()..update(updates))._build();

  _$Appstate._({required this.products}) : super._() {
    BuiltValueNullFieldError.checkNotNull(products, r'Appstate', 'products');
  }

  @override
  Appstate rebuild(void Function(AppstateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppstateBuilder toBuilder() => new AppstateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Appstate && products == other.products;
  }

  @override
  int get hashCode {
    return $jf($jc(0, products.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Appstate')..add('products', products))
        .toString();
  }
}

class AppstateBuilder implements Builder<Appstate, AppstateBuilder> {
  _$Appstate? _$v;

  ListBuilder<Products>? _products;
  ListBuilder<Products> get products =>
      _$this._products ??= new ListBuilder<Products>();
  set products(ListBuilder<Products>? products) => _$this._products = products;

  AppstateBuilder();

  AppstateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _products = $v.products.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Appstate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Appstate;
  }

  @override
  void update(void Function(AppstateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Appstate build() => _build();

  _$Appstate _build() {
    _$Appstate _$result;
    try {
      _$result = _$v ?? new _$Appstate._(products: products.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'products';
        products.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Appstate', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
