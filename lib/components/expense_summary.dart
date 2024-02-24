import 'package:expense_tracker/bargraph/bar_graph.dart';
import 'package:expense_tracker/data/expense_data.dart';
import 'package:expense_tracker/datetime/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class expenseSummary extends StatelessWidget {
  final DateTime startOfWeek;
  const expenseSummary({
    super.key,
    required this.startOfWeek
  });

  @override
  Widget build(BuildContext context) {
    String sunday = convertDateTimetoString(startOfWeek.add(Duration(days: 0)));
    String monday = convertDateTimetoString(startOfWeek.add(Duration(days: 0)));
    String tuesday = convertDateTimetoString(startOfWeek.add(Duration(days: 0)));
    String wednesday = convertDateTimetoString(startOfWeek.add(Duration(days: 0)));
    String thursday = convertDateTimetoString(startOfWeek.add(Duration(days: 0)));
    String friday = convertDateTimetoString(startOfWeek.add(Duration(days: 0)));
    String saturday = convertDateTimetoString(startOfWeek.add(Duration(days: 0)));
    return Consumer<ExpenseData>(
      builder: (context, value, child)=> SizedBox(
        height: 200,
        child: MyBarGraph(
            maxY: 100,
            sunAmount: value.calculateDailyExpenseSummary()[sunday] ?? 0,
            monAmount: value.calculateDailyExpenseSummary()[monday] ?? 0,
            tueAmount: value.calculateDailyExpenseSummary()[tuesday] ?? 0,
            wedAmount: value.calculateDailyExpenseSummary()[wednesday] ?? 0,
            thuAmount: value.calculateDailyExpenseSummary()[thursday] ?? 0,
            friAmount: value.calculateDailyExpenseSummary()[friday] ?? 0,
            satAmount: value.calculateDailyExpenseSummary()[saturday] ?? 0,
        )
      ),
    );
  }
}
