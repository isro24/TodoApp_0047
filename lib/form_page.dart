import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController taskController = TextEditingController();
  final List<Map<String, dynamic>> tasks = [];

  void addTask(){
    if (formKey.currentState!.validate()){
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
                        
                      ],
                    ),
                    IconButton(
                      onPressed: (){},
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
                      ),
                    ),
                    const SizedBox(width:10),
                    FilledButton(
                      onPressed: (){},
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