import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiConstants {
  static String baseUrl =
      'https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/currencies/usd.json';
}

class ApiService {
  Future<double?> getCurrentRate() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        double val = jsonDecode(response.body)['usd']['inr'];
        return val;
      }
    } catch (e) {
      log(e.toString());
    }
    return 81;
  }
}

class MaterialHome extends StatefulWidget {
  const MaterialHome({super.key});

  @override
  State<MaterialHome> createState() => _MaterialHome();
}

class _MaterialHome extends State<MaterialHome> {
  late double _val = 0;

  void _getData() async {
    _val = (await ApiService().getCurrentRate())!;
  }

  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
  void convert() {
    result = (double.parse(textEditingController.text) * _val);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        elevation: 0,
        title: const Text(
          "Currency Converter",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "INR ${result != result.round() ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}",
                style: const TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextField(
                controller: textEditingController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Enter the amount USD",
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                    signed: false, decimal: true),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: convert,
                style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    minimumSize: const Size(double.infinity, 50)),
                child: const Text(
                  "Convert",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
