import 'package:flutter/material.dart';

void main() {
  runApp(const UnitConverterApp());
}

class UnitConverterApp extends StatefulWidget {
  const UnitConverterApp({super.key});

  @override
  _UnitConverterAppState createState() => _UnitConverterAppState();
}

class _UnitConverterAppState extends State<UnitConverterApp> {
  String? fromUnit = 'Meters';
  String? toUnit = 'Feet';
  double? result;
  final List<String> MF = ['Meters', 'Feet'];

  String? fromUnit1 = 'Kilograms';
  String? toUnit1 = 'Pounds';
  double? result1;
  final List<String> KP = ['Kilograms', 'Pounds'];

  final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Unit Converter',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enter Value:',
                  style: TextStyle(fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: inputController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a value to convert',
                  ),
                ),
                const SizedBox(height: 50),

                const Text(
                  'Length Conversion:',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'From Unit:',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          DropdownButton<String>(
                            isExpanded: true,
                            value: fromUnit,
                            items: MF.map((unit) => DropdownMenuItem(
                              value: unit,
                              child: Text(unit),
                            )).toList(),
                            onChanged: (value) {
                              setState(() {
                                fromUnit = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'To Unit:',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          DropdownButton<String>(
                            isExpanded: true,
                            value: toUnit,
                            items: MF.map((unit) => DropdownMenuItem(
                              value: unit,
                              child: Text(unit),
                            )).toList(),
                            onChanged: (value) {
                              setState(() {
                                toUnit = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          inputController.clear();
                          fromUnit = 'Meters';
                          toUnit = 'Feet';
                          result = null;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: const Text('Reset'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          final temp = fromUnit;
                          fromUnit = toUnit;
                          toUnit = temp;
                        });
                      },
                      child: const Text('Swap Units'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          final inputValue =
                              double.tryParse(inputController.text) ?? 0.0;
                          if (fromUnit == 'Meters' && toUnit == 'Feet') {
                            result = inputValue * 3.281;
                          } else if (fromUnit == 'Feet' && toUnit == 'Meters') {
                            result = inputValue / 3.281;
                          } else {
                            result = inputValue;
                          }
                        });
                      },
                      child: const Text('Convert'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Converted Value: ${result == null ? 'No conversion yet' : result!.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                const SizedBox(height: 50),

                const Text(
                  'Weight Conversion:',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'From Unit:',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          DropdownButton<String>(
                            isExpanded: true,
                            value: fromUnit1,
                            items: KP.map((unit) => DropdownMenuItem(
                              value: unit,
                              child: Text(unit),
                            )).toList(),
                            onChanged: (value) {
                              setState(() {
                                fromUnit1 = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'To Unit:',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          DropdownButton<String>(
                            isExpanded: true,
                            value: toUnit1,
                            items: KP.map((unit) => DropdownMenuItem(
                              value: unit,
                              child: Text(unit),
                            )).toList(),
                            onChanged: (value) {
                              setState(() {
                                toUnit1 = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          inputController.clear();
                          fromUnit1 = 'Kilograms';
                          toUnit1 = 'Pounds';
                          result1 = null;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: const Text('Reset'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          final temp = fromUnit1;
                          fromUnit1 = toUnit1;
                          toUnit1 = temp;
                        });
                      },
                      child: const Text('Swap Units'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          final inputValue =
                              double.tryParse(inputController.text) ?? 0.0;
                          if (fromUnit1 == 'Kilograms' && toUnit1 == 'Pounds') {
                            result1 = inputValue * 2.205;
                          } else if (fromUnit1 == 'Pounds' &&
                              toUnit1 == 'Kilograms') {
                            result1 = inputValue / 2.205;
                          } else {
                            result1 = inputValue;
                          }
                        });
                      },
                      child: const Text('Convert'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Converted Value: ${result1 == null ? 'No conversion yet' : result1!.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
