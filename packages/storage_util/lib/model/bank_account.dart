import 'package:hive/hive.dart';

part 'bank_account.g.dart';

@HiveType(typeId: 39)
class BankAccount {
  @HiveField(0)
  final String currency;

  @HiveField(1)
  final int myMoney;

  @HiveField(2)
  final int mob;

  BankAccount(this.currency, this.myMoney, this.mob);
}
