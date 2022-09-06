// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

class SelectStream {
  SelectStream._() {
    _controller = StreamController<UserValue>.broadcast(
      onListen: () {
        _controller.sink.add(_userValue);
      },
    );
  }

  static final SelectStream instance = SelectStream._();

  factory SelectStream() => instance;

  late StreamController<UserValue> _controller;

  Stream<UserValue> get valueStream => _controller.stream;

  late final UserValue _userValue = UserValue(amount: 00, address: '');

  set setUserAmount(int amount) {
    _userValue.copyWith(amount: amount);

    _controller.sink.add(_userValue);
  }
}

class UserValue {
  final int amount;
  final String address;
  UserValue({
    required this.amount,
    required this.address,
  });

  copyWith({
    int? amount,
    String? address,
  }) {
    print('copyWith');
    return UserValue(
      amount: amount ?? this.amount,
      address: address ?? this.address,
    );
  }
}
