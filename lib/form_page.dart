import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController taskController = TextEditingController();
  final List<Map<String, dynamic>> tasks = [];
  DateTime? selectedDate;
  bool isDateValid = true;

  void showDateTimePicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Set Task Date & Time",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.none
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.close, size: 25,)
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void addTask(){
    setState(() {
      isDateValid = selectedDate != null;
    });
    if (formKey.currentState!.validate() && isDateValid){
      setState(() {
        tasks.add({
          "title": taskController.text,
          "deadline"
          "done": false
        });
        taskController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Page'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Task Date:"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Text(selectedDate != null
                            ? "${selectedDate!}"
                            : "Select a date"
                            ),
                            if (!isDateValid)
                            const Text(
                              "Please select a date",
                              style: TextStyle(color: Colors.red),
                            )
                      ],
                    ),
                    IconButton(
                      onPressed: showDateTimePicker,
                      icon: const Icon(Icons.calendar_today, color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Enter your Task",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(color: Colors.deepPurple)
                          )
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty){
                            return "Please enter some text";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width:10),
                    FilledButton(
                      onPressed: addTask,
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.deepPurple[500]
                      ),
                      child: const Text("Submit"),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                const Text(
                  "List Tasks",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}