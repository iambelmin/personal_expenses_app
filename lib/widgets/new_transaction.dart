import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function txAdd;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.txAdd);

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
          controller: amountController,
          decoration: InputDecoration(labelText: 'Amount'),
        ),
        TextButton(
            onPressed: () => txAdd(
                titleController.text, double.parse(amountController.text)),
            child: Text('Add transactions!'))
      ]),
    );
  }
}
