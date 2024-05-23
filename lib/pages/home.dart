// main.dart

import 'package:flutter/material.dart';
import 'question_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf4f4f4),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 30.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 220,
                      padding: EdgeInsets.only(left: 20.0, top: 50),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF4b6cb7),
                            Color(0xFF182848),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/boy.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 30.0),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              "John Doe",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black.withOpacity(0.10),
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 230,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 130.0, left: 20.0, right: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                'assets/images/quizz.png',
                                height: 210,
                                width: 170,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 15.0),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Play &\nWin",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  "Play Quiz by\n guessing the Image",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Top Quiz Categories',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      _buildCategoryRow(context, 'assets/images/dsa.jpg', 'DSA', 'assets/images/Cplusplus.png', 'C++'),
                      SizedBox(height: 20.0),
                      _buildCategoryRow(context, 'assets/images/CN.png', 'Computer Networks', 'assets/images/os.jpg', 'Operating System'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryRow(BuildContext context, String imagePath1, String title1, String imagePath2, String title2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildCategoryCard(context, imagePath1, title1),
        _buildCategoryCard(context, imagePath2, title2),
      ],
    );
  }

  Widget _buildCategoryCard(BuildContext context, String imagePath, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionScreen(category: title),
          ),
        );
      },
      child: Material(
        borderRadius: BorderRadius.circular(30),
        elevation: 6.0,
        child: Container(
          width: 150,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imagePath,
                  height: 120,
                  width: 130,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
