import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function txAdd;

  NewTransaction(this.txAdd);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.txAdd(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        TextField(
          controller: titleController,
          decoration: InputDecoration(labelText: 'Title'),
        ),
        TextField(
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          controller: amountController,
          decoration: InputDecoration(labelText: 'Amount'),
          onSubmitted: (_) => submitData(),
        ),
        TextButton(onPressed: submitData, child: Text('Add transactions!'))
      ]),
    );
  }
}
