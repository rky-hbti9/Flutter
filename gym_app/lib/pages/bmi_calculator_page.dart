import 'package:flutter/material.dart';

enum Gender { male, female }

class BMICalculatorPage extends StatefulWidget {
  static String routeName = "/bmiCalculatorPage";
  const BMICalculatorPage({super.key});

  @override
  State<BMICalculatorPage> createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  double _weight = 50;

  String message = "";
  double bmiValue = 0;
  Gender gender = Gender.male;
  TextEditingController heightController = TextEditingController();
  calculateBMI() {
    double height = double.parse(heightController.text);
    if (gender == Gender.male) {
      bmiValue = _weight / (height * height) * 10000;
    } else {
      bmiValue = _weight / (height * height) * 10000 * 0.9;
    }
    if (bmiValue < 18.5) {
      message = 'You are underweight';
    } else if (bmiValue >= 18.5 && bmiValue < 25) {
      message = 'You have a normal weight';
    } else if (bmiValue >= 25 && bmiValue < 30) {
      message = 'You are overweight';
    } else {
      message = 'You are obese';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculate your BMI")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 130,
                color: Colors.grey[100],
                child: Column(
                  children: [
                    const Text("Weight(Kg)"),
                    Text(
                      "${_weight.toStringAsFixed(2)} kg",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    ),
                    Slider(
                      onChanged: (value) {
                        _weight = value;
                        setState(() {});
                      },
                      value: _weight,
                      max: 150,
                      min: 1,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: heightController,
                decoration: const InputDecoration(labelText: "Height (cm)"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      gender = Gender.male;
                      setState(() {});
                    },
                    child: Card(
                      color:
                          gender == Gender.male
                              ? Colors.blue[100]
                              : Colors.grey.shade50,
                      child: SizedBox(
                        height: 150,
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Male",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.check_circle,
                              size: 30,
                              color:
                                  gender == Gender.male
                                      ? Colors.green
                                      : Colors.grey.shade300,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      gender = Gender.female;
                      setState(() {});
                    },
                    child: Card(
                      color:
                          gender == Gender.female
                              ? Colors.pink[100]
                              : Colors.grey.shade50,
                      child: SizedBox(
                        height: 150,
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Female",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.check_circle,
                              size: 30,
                              color:
                                  gender == Gender.female
                                      ? Colors.green
                                      : Colors.grey.shade300,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  calculateBMI();
                },
                height: 60,
                minWidth: double.infinity,
                color: const Color(0xFF322751),
                child: const Text(
                  "Calculate BMI",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Your BMI IS: ${bmiValue.toStringAsFixed(2)}\n$message",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF322751),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
