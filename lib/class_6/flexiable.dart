import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/class_5/list.dart';
import 'package:untitled/providers/student_prodvider.dart';

class FlexiableView extends StatefulWidget {
  const FlexiableView({Key? key}) : super(key: key);

  @override
  State<FlexiableView> createState() => _FlexiableViewState();
}

class _FlexiableViewState extends State<FlexiableView> {
  TextEditingController studentId = TextEditingController();
  TextEditingController studentName = TextEditingController();
  TextEditingController studentType = TextEditingController();
  TextEditingController studentAddress = TextEditingController();
  TextEditingController studentFatherName = TextEditingController();
  TextEditingController studentMotherName = TextEditingController();
  bool? isChecked;

  @override
  Widget build(BuildContext context) {
    final studentData = Provider.of<StudentProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Flexiable View"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Flexible(
                        flex: 1,
                        child: TextFormField(
                          controller: studentId,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Student Id",
                              label: Text("Student Id")),
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                        flex: 1,
                        child: TextFormField(
                          controller: studentName,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Student Name",
                              label: Text("Student Name")),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Flexible(
                        child: TextFormField(
                      controller: studentType,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Student Type",
                          label: Text("Student Type")),
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                        child: TextFormField(
                      controller: studentAddress,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Student Address",
                          label: Text("Student Address")),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Flexible(
                        child: TextFormField(
                      controller: studentFatherName,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Student Father Name",
                          label: Text("Student Father Name")),
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                        child: TextFormField(
                      controller: studentMotherName,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Student Mother Name",
                          label: Text("Student Mother Name")),
                    )),
                  ],
                ),
              ),
              // Container(
              //   color: Colors.grey.shade300,
              //   child: Column(
              //     children: [
              //       Text("Student Id:${studentId.text}"),
              //       Text("Student Name: ${studentName.text}"),
              //       Text("Student Type : ${studentType.text}"),
              //       Text("Student Father Name:  ${studentAddress.text}"),
              //       Text("Student Mother Name: ${studentFatherName.text}"),
              //       Text("Student Address : ${studentMotherName.text}"),
              //     ],
              //   ),
              // ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      studentData
                          .addStudentInfo(
                              studentName: studentName.text,
                              studentId: int.parse(studentId.text),
                              studentType: studentType.text,
                              studentFatherName: studentFatherName.text,
                              studentMotherName: studentMotherName.text,
                              active: true,
                              address: studentAddress.text)
                          .then(
                        (value) {
                          final snackBar = const SnackBar(
                            content: Text('Yay! A Data Added!'),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListViewAndGridView()));
                        },
                      );
                    });
                  },
                  child: const Text("Add Info")),
              // Checkbox(
              //     value: isChecked,
              //     onChanged: (value) {
              //       setState(() {
              //         isChecked = value;
              //       });
              //     }),
            ],
          ),
        ));
  }
}
