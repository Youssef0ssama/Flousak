import 'package:flousak/data/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Item extends StatelessWidget {
  final ExpenseModel expenseModel;
  final VoidCallback onDelete;
  const Item({
    Key? key,
    required this.expenseModel,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 52, 2, 73),
        boxShadow: [
          BoxShadow(blurRadius: 4.0),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(11.5),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 35,
            width: 35,
            child: expenseModel.isIncome
                ? Image.asset(
                    "images/income.png",
                    height: 40,
                    width: 40,
                  )
                : Image.asset(
                    "images/expense.png",
                    height: 40,
                    width: 40,
                  ),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expenseModel.item,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                DateFormat.yMMMd().format(expenseModel.date),
                style: TextStyle(color: Colors.blueGrey),
              )
            ],
          ),
          const Spacer(),
          Text(
            '\$${expenseModel.amount}',
            style: TextStyle(
                fontSize: 22,
                color: expenseModel.isIncome ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
