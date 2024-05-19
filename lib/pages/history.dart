import 'package:flousak/data/expense_model.dart';
import 'package:flousak/data/fund_condition.dart';
import 'package:flousak/data/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flousak/data/money.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

// List items = [
//   ExpenseModel(
//       item: 'computer', amount: 1000, date: DateTime.now(), isIncome: true),
// ];
List<String> options = ["expense", "income"];
List<ExpenseModel> expenses = [];

class _HistoryState extends State<History> {
  final itemController = TextEditingController();
  final amountController = TextEditingController();
  final dateController = TextEditingController();
  // int deposit = 0;
  // int spentMoney = 0;
  // int income = 0;
  // int totalMoney = 0;
  String currentOption = options[0];
  DateTime? pickedDate;

  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addTransactions,
        child: const Icon(Icons.add),
        shape: const CircleBorder(
          side: BorderSide(),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 2, 4, 48),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Transactions history',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(143, 10, 100, 1),
        elevation: 10,
        shadowColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 250,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff910A67), Color.fromARGB(255, 2, 4, 48)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: FundCondition(
                      type: "INCOME",
                      amount: "$income",
                      icon: "blue",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: FundCondition(
                      type: "EXPENSE",
                      amount: "$spentMoney",
                      icon: "orange",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 10),
                    child: FundCondition(
                      type: "TOTAL",
                      amount: "$totalMoney",
                      icon: "grey",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 110, right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transactions',
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
          Padding(
            padding: const EdgeInsets.only(top: 150, right: 5, left: 10),
            child: ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                              'Are you sure you want to delete this item ?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                final myExpense = expenses[index];
                                if (myExpense.isIncome) {
                                  income -= myExpense.amount;
                                  totalMoney -= myExpense.amount;
                                } else {
                                  spentMoney -= myExpense.amount;
                                  totalMoney += myExpense.amount;
                                }
                                expenses.remove(myExpense);
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: Text('Yes'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('NO'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Item(
                        expenseModel: ExpenseModel(
                          item: expenses[index].item,
                          amount: expenses[index].amount,
                          isIncome: expenses[index].isIncome,
                          date: expenses[index].date,
                        ),
                        onDelete: () {}),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void addTransactions() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 2, 4, 48),
        title: const Text(
          'Add new Transation',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
                width: 500,
              ),
              TextField(
                controller: itemController,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
                decoration: const InputDecoration(
                  hintText: 'The item name', // Placeholder for larger TextField
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 22,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
                decoration: const InputDecoration(
                  hintText: 'Enter amount',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 23,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                onTap: () async {
                  pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2025),
                  );
                  String convertedDate =
                      DateFormat.yMMMMd().format(pickedDate!);
                  dateController.text = convertedDate;
                  setState(() {});
                },
                controller: dateController,
                style: TextStyle(color: Colors.white),
                readOnly: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today),
                  prefixIconColor: Colors.blue,
                  hintText:
                      'Enter the date', // Placeholder for larger TextField
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 22,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return Row(
                        children: [
                          RadioMenuButton(
                            value: options[0],
                            groupValue: currentOption,
                            onChanged: (value) {
                              setState(() {
                                currentOption = value.toString();
                              });
                            },
                            child: const Text(
                              'Expense',
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                          ),
                          RadioMenuButton(
                            value: options[1],
                            groupValue: currentOption,
                            onChanged: (value) {
                              setState(() {
                                currentOption = value.toString();
                              });
                            },
                            child: const Text('Deposit',
                                style: TextStyle(color: Colors.blueGrey)),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {
                  int convertedAmount = int.parse(amountController.text);
                  if (pickedDate != null) {
                    final expenseModel = ExpenseModel(
                      item: itemController.text,
                      amount: convertedAmount,
                      date: pickedDate!,
                      isIncome: currentOption == 'income' ? true : false,
                    );
                    expenses.add(expenseModel);
                    if (expenseModel.isIncome) {
                      income += expenseModel.amount;
                      totalMoney += expenseModel.amount;
                    } else {
                      spentMoney += expenseModel.amount;
                      totalMoney -= expenseModel.amount;
                    }
                    setState(() {});
                  }

                  Navigator.pop(context);
                  itemController.clear();
                  amountController.clear();
                  dateController.clear();
                  setState(() {});
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
                label: const Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff720455),
                  alignment: Alignment.center,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
