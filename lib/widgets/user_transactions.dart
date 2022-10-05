import 'package:flutter/material.dart';
import './list_transactions.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't0', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't1',
        title: 'Weekly groceries',
        amount: 11.99,
        date: DateTime.now()),
  ];

  void _addTransactions(String title, double amount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addTransactions),
        TransactionList(_userTransactions)
      ],
    );
  }
}
