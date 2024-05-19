import 'package:flousak/data/expense_model.dart';
import 'package:flousak/data/item.dart';
import 'package:flousak/pages/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flousak/data/money.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homePage();
}

class _homePage extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 4, 48),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 400,
            child: _head(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Last Transaction',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Amount',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Item(
                                expenseModel: expenses.isNotEmpty
                                    ? ExpenseModel(
                                        item: expenses.last.item,
                                        amount: expenses.last.amount,
                                        isIncome: expenses.last.isIncome,
                                        date: expenses.last.date,
                                      )
                                    : ExpenseModel(
                                        item: 'Item 1',
                                        amount: 0,
                                        date: DateTime.now(),
                                        isIncome: false),
                                onDelete: () {}),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _head() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 340,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff910A67), Color.fromARGB(255, 2, 4, 48)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  radius: 22,
                  backgroundColor: Color.fromARGB(137, 99, 99, 99),
                  child: Text(
                    'T',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  alignment: Alignment.center,
                  width: 160,
                  height: 35,
                  color: const Color.fromARGB(137, 99, 99, 99),
                  child: Text(
                    'Balance \$ $totalMoney',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 160,
          left: 105,
          child: Container(
            height: 130,
            width: 210,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\$ $spentMoney',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 60,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Total Spent',
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
