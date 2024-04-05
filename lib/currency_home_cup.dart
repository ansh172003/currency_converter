import 'package:flutter/cupertino.dart';

class CurrencyHomeCup extends StatefulWidget {
  const CurrencyHomeCup({super.key});

  @override
  State<CurrencyHomeCup> createState() => _CurrencyHomeCupState();
}

class _CurrencyHomeCupState extends State<CurrencyHomeCup> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
  void convert() {
    result = (double.parse(textEditingController.text) * 81);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final border = OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(10),
    //   borderSide: const BorderSide(
    //     width: 2.0,
    //     style: BorderStyle.solid,
    //   ),
    // );
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey5,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey5,
        middle: Text(
          "Currency Converter",
          style: TextStyle(color: CupertinoColors.white),
        ),
        automaticallyImplyMiddle: true,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "INR ${result != result.round() ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}",
                style: const TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: CupertinoTextField(
                  placeholder: "Enter the amount USD",
                  placeholderStyle:
                      const TextStyle(color: CupertinoColors.black),
                  prefix: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(CupertinoIcons.money_dollar_circle),
                  ),
                  controller: textEditingController,
                  style: const TextStyle(color: CupertinoColors.black),
                  decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: false, decimal: true),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CupertinoButton(
                onPressed: convert,
                padding: const EdgeInsets.only(left: 100, right: 100),
                color: CupertinoColors.black,
                child: const Text(
                  "Convert",
                  style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
