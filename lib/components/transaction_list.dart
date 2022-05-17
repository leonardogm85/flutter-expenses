import 'package:expenses/components/transaction_item.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    Key? key,
    required this.transactions,
    required this.onRemove,
  }) : super(key: key);

  final List<Transaction> transactions;
  final void Function(String) onRemove;

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.1,
                  child: Text(
                    'Nenhuma Transação Cadastrada',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final transaction = transactions[index];
              return TransactionItem(
                transaction: transaction,
                onRemove: onRemove,
              );
            },
          );
  }
}
