import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flousak/data/money.dart';

class stats extends StatelessWidget {
  const stats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 2, 4, 48), // Make scaffold's background transparent
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Monthly Stats',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff910A67),
        elevation: 10,
        shadowColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            child: SizedBox(
              child: _head(),
            ),
            width: double.infinity,
            height: 220, // Set the height to 340
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff910A67), Color.fromARGB(255, 2, 4, 48)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                _content(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _head() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Stack(
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  'Total Balance',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '\$ $totalMoney',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 60,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _content() {
    return Stack(
      children: [
        Container(
          height: 450,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: const Color(0xff3C0753)),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 0, left: 30, right: 30, bottom: 80),
            child: PieChart(
              swapAnimationDuration: const Duration(milliseconds: 750),
              swapAnimationCurve: Curves.easeInOutQuint,
              PieChartData(
                sections: [
                  PieChartSectionData(
                    value: spentMoney.toDouble(),
                    color: Color.fromARGB(255, 7, 20, 120),
                    radius: 150,
                    title: '\$ $spentMoney',
                    titleStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                  PieChartSectionData(
                    value: income.toDouble(),
                    color: Color.fromARGB(255, 241, 149, 37),
                    radius: 150,
                    title: '\$ $income',
                    titleStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 370, left: 40, right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    color: Color.fromARGB(255, 7, 20, 120),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  const Text(
                    'Expense',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    color: Color.fromARGB(255, 241, 149, 37),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  const Text(
                    'Income',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
