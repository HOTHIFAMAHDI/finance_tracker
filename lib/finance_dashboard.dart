import 'package:finance_tracker/widgets/balance_overview_card.dart';
import 'package:finance_tracker/models/transaction.dart';
import 'package:finance_tracker/widgets/summary_card.dart';
import 'package:finance_tracker/widgets/grouped_transaction_list.dart';
import 'package:flutter/material.dart';

class FinanceDashboard extends StatefulWidget {
  const FinanceDashboard({super.key});
  @override
  State<FinanceDashboard> createState() => _FinanceDashboardState();
}

class _FinanceDashboardState extends State<FinanceDashboard> {
  // Sample transaction data

  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'Grocery Shopping',
      amount: 45.99,
      date: DateTime.now().subtract(const Duration(days: 1)),
      category: 'Food',
      isExpense: true,
    ),
    Transaction(
      id: 't2',
      title: 'Monthly Salary',
      amount: 1500.00,
      date: DateTime.now().subtract(const Duration(days: 3)),
      category: 'Salary',
      isExpense: false,
    ),
    Transaction(
      id: 't3',
      title: 'New Headphones',
      amount: 99.99,
      date: DateTime.now().subtract(const Duration(days: 5)),
      category: 'Shopping',
      isExpense: true,
    ),
    Transaction(
      id: 't4',
      title: 'Restaurant Dinner',
      amount: 35.50,
      date: DateTime.now().subtract(const Duration(days: 7)),
      category: 'Food',
      isExpense: true,
    ),
  ];
  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddTransaction(context),
        tooltip: 'Add Transaction',
        child: const Icon(Icons.add),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section
            const Text(
              'My Balance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Balance Card
            const BalanceOverviewCard(),
            const SizedBox(height: 24),
            // Income & Expenses Row
            const Text(
              'Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Income and Expense cards
            const Row(
              children: [
                Expanded(
                  child: SummaryCard(
                    title: 'Income',
                    amount: 1250.00,
                    icon: Icons.arrow_upward,
                    color: Colors.green,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: SummaryCard(
                    title: 'Expenses',
                    amount: 850.00,
                    icon: Icons.arrow_downward,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Recent Transactions Header
            const Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Transaction List
            SizedBox(
              height: 400, // Fixed height for the list
              child: GroupedTransactionList(
                transactions: _transactions,
                onDeleteTransaction: _deleteTransaction,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startAddTransaction(BuildContext context) {
    String title = '';
    String category = '';
    String amountStr = '';
    bool isExpense = true;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (value) => title = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                onChanged: (value) => amountStr = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Category'),
                onChanged: (value) => category = value,
              ),
              SwitchListTile(
                title: const Text('Is Expense?'),
                value: isExpense,
                onChanged: (value) {
                  setState(() {
                    isExpense = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (title.isEmpty || amountStr.isEmpty || category.isEmpty) {
                    return;
                  }
                  _addTransaction(
                    title,
                    double.parse(amountStr),
                    category,
                    isExpense,
                  );
                  Navigator.of(context).pop();
                },
                child: const Text('Add Transaction'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _addTransaction(
    String title,
    double amount,
    String category,
    bool isExpense,
  ) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
      category: category,
      isExpense: isExpense,
    );
    setState(() {
      _transactions.add(newTx);
    });
  }
}
