import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DatePickerFormScreen(),
    );
  }
}

class DatePickerFormScreen extends StatefulWidget {
  const DatePickerFormScreen({super.key});

  @override
  State<DatePickerFormScreen> createState() => _DatePickerFormScreenState();
}

class _DatePickerFormScreenState extends State<DatePickerFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  DateTime? selectedDate; // store selected date
  String formattedDate = "Select Date of Birth"; // display hint text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form with Date Picker"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Name Input
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a name";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Date of Birth (Using GestureDetector + Text)
              const Text(
                "Date of Birth",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 8),

              GestureDetector(
                onTap: () async {
                  // Open date picker
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );

                  // Update state
                  if (pickedDate != null) {
                    setState(() {
                      selectedDate = pickedDate;
                      formattedDate =
                          DateFormat('dd MMM yyyy').format(pickedDate);
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 14, horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    formattedDate,
                    style: TextStyle(
                      fontSize: 16,
                      color: selectedDate == null
                          ? Colors.grey[600]
                          : Colors.black,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedDate == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please select a date of birth"),
                        ),
                      );
                      return;
                    }

                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Saved! Name: ${nameController.text}, DOB: $formattedDate",
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text("Submit"),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
