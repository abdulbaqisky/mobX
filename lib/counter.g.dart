// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Counter on _Counter, Store {
  Computed<String>? _$fullNamComputed;

  @override
  String get fullNam => (_$fullNamComputed ??=
          Computed<String>(() => super.fullNam, name: '_Counter.fullNam'))
      .value;

  final _$indexAtom = Atom(name: '_Counter.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$locateUserAsyncAction = AsyncAction('_Counter.locateUser');

  @override
  Future<Position> locateUser() {
    return _$locateUserAsyncAction.run(() => super.locateUser());
  }

  final _$_CounterActionController = ActionController(name: '_Counter');

  @override
  String fullName() {
    final _$actionInfo =
        _$_CounterActionController.startAction(name: '_Counter.fullName');
    try {
      return super.fullName();
    } finally {
      _$_CounterActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getUserLocation() {
    final _$actionInfo = _$_CounterActionController.startAction(
        name: '_Counter.getUserLocation');
    try {
      return super.getUserLocation();
    } finally {
      _$_CounterActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index},
fullNam: ${fullNam}
    ''';
  }
}
