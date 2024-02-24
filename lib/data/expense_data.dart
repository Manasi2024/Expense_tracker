
import 'package:flutter/cupertino.dart';
import 'dart:core';
import '../datetime/date_time_helper.dart';
import '../models/expense_item.dart';
import 'package:provider/provider.dart';

class ExpenseData extends ChangeNotifier {

  //list of all expenses
  List<ExpenseItem> overallExpenseList = [];

  // get the list of expenses
  List<ExpenseItem>  getAllExpenseList() {
    return overallExpenseList;
  }

  // add new expenses

  void addNewExpenseItems(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);
    notifyListeners();
  }

  // delete expenses

  void deleteExpenseItems(ExpenseItem Expense) {
    overallExpenseList.remove(Expense);
    notifyListeners();
  }
  // weekly expenses from datetime objects(
// mon , tue , wed,...)

  String getDayName(DateTime dt) {
    switch (dt.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }
  // get the date for  start  of week

  DateTime startOfWeekDate() {
    DateTime? starOfWeek;

    // getting todays date
    DateTime today = DateTime.now();

    //go back from today to find sunday
    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sun') {
        starOfWeek = today.subtract(Duration(days: i));
      }
    }
    return starOfWeek!;
  }
  /*  convert overall list of expenses into daily expense summary:
  example-
  overall exp_list =
  [
  [food, 2023/02/23, Rs.200],
  [cloth, 2023/02/23, Rs.100],
  [material, 2023/01/03, Rs.300],
  [fee, 2023/01/03, Rs.200],
  [travel, 2023/04/09, Rs.200],
  [food, 2023/04/09, Rs.40],]
  daily exp_list =
  [
  [ 2023/02/23, Rs.300],
  [ 2023/01/03, Rs.500],
  [ 2023/04/09, Rs.240],
  ]
   */

  Map<String, double> calculateDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {
      // date(year month day) : totalamountforday;
    };


    for (var Expense in overallExpenseList) {
      String date = convertDateTimetoString(Expense.datetime);

      double amount = double.parse(Expense.amount);

      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount = currentAmount + amount;
        dailyExpenseSummary[date] = currentAmount;
      } else {
        dailyExpenseSummary.addAll({date: amount});
      }
    }
    return dailyExpenseSummary;

  }
}

