import 'package:flutter_riverpod/flutter_riverpod.dart';

class Wallet {
  int balance = 0;
  int deposited = 0;

  Wallet({
    required this.balance,
    required this.deposited,
  });

  @override
  String toString() {
    return "Total interest: $balance, deposits: $deposited";
  }
}
