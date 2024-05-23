import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quizz_app/service/database.dart';
import 'package:random_string/random_string.dart';

class AddQuiz extends StatefulWidget {
  const AddQuiz({super.key});

  @override
  State<AddQuiz> createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);
    setState(() {});
  }

  uploadItem() async {
    if (selectedImage != null &&
        option1controller.text != "" &&
        option2controller.text != "" &&
        option3controller.text != "" &&
        option4controller.text != "") {
      String addId = randomAlphaNumeric(10);
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child("blogImage").child(addId);
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
      try {
        await task.whenComplete(() async {
          var downloadUrl = await firebaseStorageRef.getDownloadURL();
          Map<String, dynamic> addQuiz = {
            "Image": downloadUrl,
            "option1": option1controller.text,
            "option2": option2controller.text,
            "option3": option3controller.text,
            "option4": option4controller.text,
            "correct": correctAnswer.text,
          };
          await DatabaseMethods()
              .addQuizCategory(addQuiz, value!)
              .then((value) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Quiz has been added successfully!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w800),
              ),
            ));
          });
        });
      } on FirebaseException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "Failed to upload image: $e",
            style: TextStyle(
                color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w800),
          ),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          "Please fill all the fields and select an image.",
          style: TextStyle(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w800),
        ),
      ));
    }
  }
  String? value;
  final List<String> items = ['Animal', 'Place', 'Fruits', 'Objects'];

  TextEditingController option1controller = new TextEditingController();
  TextEditingController option2controller = new TextEditingController();
  TextEditingController option3controller = new TextEditingController();
  TextEditingController option4controller = new TextEditingController();
  TextEditingController correctAnswer = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Add Quiz',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: 20.0,
            left: 20.0,
            right: 20.0,
            bottom: 40.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upload the quiz picture",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 20.0),
              selectedImage == null
                  ? GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Center(
                        child: Material(
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Icon(Icons.camera_alt_outlined,
                                color: Colors.black),
                          ),
                        ),
                      ))
                  : Center(
                      child: Material(
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(selectedImage!, fit: BoxFit.cover)),
                        ),
                      ),
                    ),
              SizedBox(height: 20.0),
              Text(
                'Option 1',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: option1controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter option 1',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Option 2',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: option2controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter option 2',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Option 3',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: option3controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter option 3',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Option 4',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: option4controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter option 4',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Correct Answer',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: correctAnswer,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter correct Answer',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Category',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: value,
                    isExpanded: true,
                    hint: Text(
                      'Select category',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    items: items.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        value = newValue;
                      });
                    },
                    dropdownColor: Colors.white,
                    disabledHint: Text('Select Category'),
                    iconSize: 36,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              GestureDetector(
                onTap: () {
                  uploadItem();
                },
                child: Center(
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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
