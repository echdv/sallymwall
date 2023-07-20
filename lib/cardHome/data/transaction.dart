import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Transaction {
  final String title;
  final String recipient;
  final double amount;
  final IconData iconData;
  final Color iconBackgroundColor;
  final TransactionType transactionType;

  Transaction({
    required this.title,
    required this.recipient,
    required this.amount,
    required this.iconData,
    required this.iconBackgroundColor,
    this.transactionType = TransactionType.credit,
  });
}

extension TransactionExt on Transaction {
  bool get isDebit => transactionType == TransactionType.debit;

  bool get isCredit => transactionType == TransactionType.credit;

  String get formattedAmount => isDebit ? "-" : "+" "$amount";
}



enum TransactionType { debit, credit }
