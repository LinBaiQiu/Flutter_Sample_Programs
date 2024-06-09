import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(CoinChangeHomePage());
}

class CoinChangeHomePage extends StatefulWidget {
  @override
  _CoinChangeHomePageState createState() => _CoinChangeHomePageState();
}

class _CoinChangeHomePageState extends State<CoinChangeHomePage> {
  final TextEditingController _denominationsController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  String _result = '';

  void _calculateMinimumCoins() {
    final List<int> coins = _denominationsController.text.split(',')
        .map((e) => int.tryParse(e.trim()) ?? 0).toList();
    final int amount = int.tryParse(_amountController.text) ?? 0;

    if (coins.isEmpty || amount <= 0) {
      setState(() {
        _result = 'Please enter valid number.';
      });
      return;
    }

    int minCoins = _coinChange(coins, amount);
    setState(() {
      if (minCoins == -1) {
        _result = 'No solution possible with given denominations.';
      } else {
        _result = 'Minimum coins needed: $minCoins';
      }
    });
  }

  int _coinChange(List<int> coins, int amount) {
    List<int> dp = List.filled(amount + 1, amount + 1);
    dp[0] = 0;

    for (int i = 1; i <= amount; i++) {
      for (int coin in coins) {
        if (coin <= i) {
          dp[i] = math.min(dp[i], dp[i - coin] + 1);
        }
      }
    }
    return dp[amount] > amount ? -1 : dp[amount];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Knapsack Problem'),
        backgroundColor: Color.fromARGB(255, 63, 134, 188), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _denominationsController,
              decoration: InputDecoration(
                labelText: 'Coin Denominations (comma separated)',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _calculateMinimumCoins,
                style: ElevatedButton.styleFrom(
               backgroundColor: Color.fromARGB(255, 119, 188, 231), // Button background color
            ),
                child: Text('Calculate'),
              ),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to the home page
                },
                 style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 119, 188, 231), // Button background color
                ),
                child: Text("Back to Home"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
