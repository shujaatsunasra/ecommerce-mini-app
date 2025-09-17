// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCart,
    required TResult Function(Product product, int quantity) addToCart,
    required TResult Function(Product product) removeFromCart,
    required TResult Function(Product product, int quantity) updateQuantity,
    required TResult Function() clearCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCart,
    TResult? Function(Product product, int quantity)? addToCart,
    TResult? Function(Product product)? removeFromCart,
    TResult? Function(Product product, int quantity)? updateQuantity,
    TResult? Function()? clearCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCart,
    TResult Function(Product product, int quantity)? addToCart,
    TResult Function(Product product)? removeFromCart,
    TResult Function(Product product, int quantity)? updateQuantity,
    TResult Function()? clearCart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCart value) loadCart,
    required TResult Function(AddToCart value) addToCart,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(ClearCart value) clearCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCart value)? loadCart,
    TResult? Function(AddToCart value)? addToCart,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(ClearCart value)? clearCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCart value)? loadCart,
    TResult Function(AddToCart value)? addToCart,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(ClearCart value)? clearCart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEventCopyWith<$Res> {
  factory $CartEventCopyWith(CartEvent value, $Res Function(CartEvent) then) =
      _$CartEventCopyWithImpl<$Res, CartEvent>;
}

/// @nodoc
class _$CartEventCopyWithImpl<$Res, $Val extends CartEvent>
    implements $CartEventCopyWith<$Res> {
  _$CartEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadCartImplCopyWith<$Res> {
  factory _$$LoadCartImplCopyWith(
          _$LoadCartImpl value, $Res Function(_$LoadCartImpl) then) =
      __$$LoadCartImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$LoadCartImpl>
    implements _$$LoadCartImplCopyWith<$Res> {
  __$$LoadCartImplCopyWithImpl(
      _$LoadCartImpl _value, $Res Function(_$LoadCartImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadCartImpl implements LoadCart {
  const _$LoadCartImpl();

  @override
  String toString() {
    return 'CartEvent.loadCart()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadCartImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCart,
    required TResult Function(Product product, int quantity) addToCart,
    required TResult Function(Product product) removeFromCart,
    required TResult Function(Product product, int quantity) updateQuantity,
    required TResult Function() clearCart,
  }) {
    return loadCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCart,
    TResult? Function(Product product, int quantity)? addToCart,
    TResult? Function(Product product)? removeFromCart,
    TResult? Function(Product product, int quantity)? updateQuantity,
    TResult? Function()? clearCart,
  }) {
    return loadCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCart,
    TResult Function(Product product, int quantity)? addToCart,
    TResult Function(Product product)? removeFromCart,
    TResult Function(Product product, int quantity)? updateQuantity,
    TResult Function()? clearCart,
    required TResult orElse(),
  }) {
    if (loadCart != null) {
      return loadCart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCart value) loadCart,
    required TResult Function(AddToCart value) addToCart,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(ClearCart value) clearCart,
  }) {
    return loadCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCart value)? loadCart,
    TResult? Function(AddToCart value)? addToCart,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(ClearCart value)? clearCart,
  }) {
    return loadCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCart value)? loadCart,
    TResult Function(AddToCart value)? addToCart,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(ClearCart value)? clearCart,
    required TResult orElse(),
  }) {
    if (loadCart != null) {
      return loadCart(this);
    }
    return orElse();
  }
}

abstract class LoadCart implements CartEvent {
  const factory LoadCart() = _$LoadCartImpl;
}

/// @nodoc
abstract class _$$AddToCartImplCopyWith<$Res> {
  factory _$$AddToCartImplCopyWith(
          _$AddToCartImpl value, $Res Function(_$AddToCartImpl) then) =
      __$$AddToCartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product, int quantity});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$AddToCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$AddToCartImpl>
    implements _$$AddToCartImplCopyWith<$Res> {
  __$$AddToCartImplCopyWithImpl(
      _$AddToCartImpl _value, $Res Function(_$AddToCartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
  }) {
    return _then(_$AddToCartImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc

class _$AddToCartImpl implements AddToCart {
  const _$AddToCartImpl(this.product, {this.quantity = 1});

  @override
  final Product product;
  @override
  @JsonKey()
  final int quantity;

  @override
  String toString() {
    return 'CartEvent.addToCart(product: $product, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToCartImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToCartImplCopyWith<_$AddToCartImpl> get copyWith =>
      __$$AddToCartImplCopyWithImpl<_$AddToCartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCart,
    required TResult Function(Product product, int quantity) addToCart,
    required TResult Function(Product product) removeFromCart,
    required TResult Function(Product product, int quantity) updateQuantity,
    required TResult Function() clearCart,
  }) {
    return addToCart(product, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCart,
    TResult? Function(Product product, int quantity)? addToCart,
    TResult? Function(Product product)? removeFromCart,
    TResult? Function(Product product, int quantity)? updateQuantity,
    TResult? Function()? clearCart,
  }) {
    return addToCart?.call(product, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCart,
    TResult Function(Product product, int quantity)? addToCart,
    TResult Function(Product product)? removeFromCart,
    TResult Function(Product product, int quantity)? updateQuantity,
    TResult Function()? clearCart,
    required TResult orElse(),
  }) {
    if (addToCart != null) {
      return addToCart(product, quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCart value) loadCart,
    required TResult Function(AddToCart value) addToCart,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(ClearCart value) clearCart,
  }) {
    return addToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCart value)? loadCart,
    TResult? Function(AddToCart value)? addToCart,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(ClearCart value)? clearCart,
  }) {
    return addToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCart value)? loadCart,
    TResult Function(AddToCart value)? addToCart,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(ClearCart value)? clearCart,
    required TResult orElse(),
  }) {
    if (addToCart != null) {
      return addToCart(this);
    }
    return orElse();
  }
}

abstract class AddToCart implements CartEvent {
  const factory AddToCart(final Product product, {final int quantity}) =
      _$AddToCartImpl;

  Product get product;
  int get quantity;
  @JsonKey(ignore: true)
  _$$AddToCartImplCopyWith<_$AddToCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveFromCartImplCopyWith<$Res> {
  factory _$$RemoveFromCartImplCopyWith(_$RemoveFromCartImpl value,
          $Res Function(_$RemoveFromCartImpl) then) =
      __$$RemoveFromCartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$RemoveFromCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$RemoveFromCartImpl>
    implements _$$RemoveFromCartImplCopyWith<$Res> {
  __$$RemoveFromCartImplCopyWithImpl(
      _$RemoveFromCartImpl _value, $Res Function(_$RemoveFromCartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$RemoveFromCartImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc

class _$RemoveFromCartImpl implements RemoveFromCart {
  const _$RemoveFromCartImpl(this.product);

  @override
  final Product product;

  @override
  String toString() {
    return 'CartEvent.removeFromCart(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFromCartImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveFromCartImplCopyWith<_$RemoveFromCartImpl> get copyWith =>
      __$$RemoveFromCartImplCopyWithImpl<_$RemoveFromCartImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCart,
    required TResult Function(Product product, int quantity) addToCart,
    required TResult Function(Product product) removeFromCart,
    required TResult Function(Product product, int quantity) updateQuantity,
    required TResult Function() clearCart,
  }) {
    return removeFromCart(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCart,
    TResult? Function(Product product, int quantity)? addToCart,
    TResult? Function(Product product)? removeFromCart,
    TResult? Function(Product product, int quantity)? updateQuantity,
    TResult? Function()? clearCart,
  }) {
    return removeFromCart?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCart,
    TResult Function(Product product, int quantity)? addToCart,
    TResult Function(Product product)? removeFromCart,
    TResult Function(Product product, int quantity)? updateQuantity,
    TResult Function()? clearCart,
    required TResult orElse(),
  }) {
    if (removeFromCart != null) {
      return removeFromCart(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCart value) loadCart,
    required TResult Function(AddToCart value) addToCart,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(ClearCart value) clearCart,
  }) {
    return removeFromCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCart value)? loadCart,
    TResult? Function(AddToCart value)? addToCart,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(ClearCart value)? clearCart,
  }) {
    return removeFromCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCart value)? loadCart,
    TResult Function(AddToCart value)? addToCart,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(ClearCart value)? clearCart,
    required TResult orElse(),
  }) {
    if (removeFromCart != null) {
      return removeFromCart(this);
    }
    return orElse();
  }
}

abstract class RemoveFromCart implements CartEvent {
  const factory RemoveFromCart(final Product product) = _$RemoveFromCartImpl;

  Product get product;
  @JsonKey(ignore: true)
  _$$RemoveFromCartImplCopyWith<_$RemoveFromCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateQuantityImplCopyWith<$Res> {
  factory _$$UpdateQuantityImplCopyWith(_$UpdateQuantityImpl value,
          $Res Function(_$UpdateQuantityImpl) then) =
      __$$UpdateQuantityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product, int quantity});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$UpdateQuantityImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$UpdateQuantityImpl>
    implements _$$UpdateQuantityImplCopyWith<$Res> {
  __$$UpdateQuantityImplCopyWithImpl(
      _$UpdateQuantityImpl _value, $Res Function(_$UpdateQuantityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
  }) {
    return _then(_$UpdateQuantityImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc

class _$UpdateQuantityImpl implements UpdateQuantity {
  const _$UpdateQuantityImpl(this.product, this.quantity);

  @override
  final Product product;
  @override
  final int quantity;

  @override
  String toString() {
    return 'CartEvent.updateQuantity(product: $product, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateQuantityImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateQuantityImplCopyWith<_$UpdateQuantityImpl> get copyWith =>
      __$$UpdateQuantityImplCopyWithImpl<_$UpdateQuantityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCart,
    required TResult Function(Product product, int quantity) addToCart,
    required TResult Function(Product product) removeFromCart,
    required TResult Function(Product product, int quantity) updateQuantity,
    required TResult Function() clearCart,
  }) {
    return updateQuantity(product, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCart,
    TResult? Function(Product product, int quantity)? addToCart,
    TResult? Function(Product product)? removeFromCart,
    TResult? Function(Product product, int quantity)? updateQuantity,
    TResult? Function()? clearCart,
  }) {
    return updateQuantity?.call(product, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCart,
    TResult Function(Product product, int quantity)? addToCart,
    TResult Function(Product product)? removeFromCart,
    TResult Function(Product product, int quantity)? updateQuantity,
    TResult Function()? clearCart,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(product, quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCart value) loadCart,
    required TResult Function(AddToCart value) addToCart,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(ClearCart value) clearCart,
  }) {
    return updateQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCart value)? loadCart,
    TResult? Function(AddToCart value)? addToCart,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(ClearCart value)? clearCart,
  }) {
    return updateQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCart value)? loadCart,
    TResult Function(AddToCart value)? addToCart,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(ClearCart value)? clearCart,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(this);
    }
    return orElse();
  }
}

abstract class UpdateQuantity implements CartEvent {
  const factory UpdateQuantity(final Product product, final int quantity) =
      _$UpdateQuantityImpl;

  Product get product;
  int get quantity;
  @JsonKey(ignore: true)
  _$$UpdateQuantityImplCopyWith<_$UpdateQuantityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearCartImplCopyWith<$Res> {
  factory _$$ClearCartImplCopyWith(
          _$ClearCartImpl value, $Res Function(_$ClearCartImpl) then) =
      __$$ClearCartImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$ClearCartImpl>
    implements _$$ClearCartImplCopyWith<$Res> {
  __$$ClearCartImplCopyWithImpl(
      _$ClearCartImpl _value, $Res Function(_$ClearCartImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearCartImpl implements ClearCart {
  const _$ClearCartImpl();

  @override
  String toString() {
    return 'CartEvent.clearCart()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearCartImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCart,
    required TResult Function(Product product, int quantity) addToCart,
    required TResult Function(Product product) removeFromCart,
    required TResult Function(Product product, int quantity) updateQuantity,
    required TResult Function() clearCart,
  }) {
    return clearCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCart,
    TResult? Function(Product product, int quantity)? addToCart,
    TResult? Function(Product product)? removeFromCart,
    TResult? Function(Product product, int quantity)? updateQuantity,
    TResult? Function()? clearCart,
  }) {
    return clearCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCart,
    TResult Function(Product product, int quantity)? addToCart,
    TResult Function(Product product)? removeFromCart,
    TResult Function(Product product, int quantity)? updateQuantity,
    TResult Function()? clearCart,
    required TResult orElse(),
  }) {
    if (clearCart != null) {
      return clearCart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCart value) loadCart,
    required TResult Function(AddToCart value) addToCart,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(ClearCart value) clearCart,
  }) {
    return clearCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCart value)? loadCart,
    TResult? Function(AddToCart value)? addToCart,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(ClearCart value)? clearCart,
  }) {
    return clearCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCart value)? loadCart,
    TResult Function(AddToCart value)? addToCart,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(ClearCart value)? clearCart,
    required TResult orElse(),
  }) {
    if (clearCart != null) {
      return clearCart(this);
    }
    return orElse();
  }
}

abstract class ClearCart implements CartEvent {
  const factory ClearCart() = _$ClearCartImpl;
}
