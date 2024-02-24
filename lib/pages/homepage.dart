
import 'dart:core';
import 'package:expense_tracker/components/expense_tile.dart';
import 'package:expense_tracker/data/expense_data.dart';
import 'package:expense_tracker/models/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/expense_summary.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // for controlling user input for expense name and amount
  final newExpenseNameControl = TextEditingController();
  final newExpenseAmountControl = TextEditingController();
 // add new expense
  void addNewExpense(){
    showDialog(context: context, builder: (context)=> AlertDialog(
      title: Text(" Add New Expense",
      style : TextStyle(
        fontWeight: FontWeight.bold,
          color: Colors.blueAccent
      )),

      content: Column(
         mainAxisSize: MainAxisSize.min,
        children: [

          //add name
          TextField(
            controller:newExpenseNameControl,
          ),

          // add amount
          TextField(
            controller:newExpenseAmountControl,
          ),
        ],),
        // action buttons
        actions: [
          // for save the expenses
          MaterialButton(onPressed: add,
          child: Text('Add',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent
          ),),
          ),
          // for cancel the expenses
          MaterialButton(onPressed: cancel,
            child: const Text('Cancel',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.amberAccent
              ),
            ),
          )
        ],
      ),
    );
  }
  void add(){// create expense item
    ExpenseItem newExpense = ExpenseItem(
      name: newExpenseNameControl.text,
      amount: newExpenseAmountControl.text,
      datetime: DateTime.now()
    );
    // add new expense item
    Provider.of<ExpenseData>(context, listen: false).addNewExpenseItems(newExpense);

    Navigator.pop(context);
    clear();
  }
  // to cancel expense
  void cancel(){
    Navigator.pop(context);
    clear();
  }
// to clear text after adding new expense
  void clear(){
    newExpenseNameControl.clear();
    newExpenseAmountControl.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
        builder: (context, value, child)=> Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: addNewExpense,
        child: const Icon(Icons.add),
        backgroundColor: Colors.black,
      ),
      body: ListView(children: [
        //weekly summary of expenses
        expenseSummary(startOfWeek: value.startOfWeekDate()),

        const SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: (value).getAllExpenseList().length,
            itemBuilder: (context, index)=> ExpenseTile(
              name: value.getAllExpenseList()[index].name,
              amount: value.getAllExpenseList()[index].amount,
              datetime: value.getAllExpenseList()[index].datetime,
              // title: Text(value.getAllExpenseList()[index].name),
              //   subtitle: Text(value.getAllExpenseList()[index].datetime.toString()),
              //   trailing: Text('Rs'+ value.getAllExpenseList()[index].amount),
            )
        ),
      ],)
        ),

    );
  }
}
