import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.onRemove,
  }) : super(key: key);

  final Transaction transaction;
  final void Function(String p1) onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('R\$${transaction.value}'),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 480
            ? TextButton.icon(
                onPressed: () => onRemove(transaction.id),
                icon: const Icon(Icons.delete),
                label: const Text('Excluir'),
                style: TextButton.styleFrom(
                  primary: Theme.of(context).errorColor,
                ),
              )
            : IconButton(
                onPressed: () => onRemove(transaction.id),
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
