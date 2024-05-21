import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 128, 145, 160),
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
                            Color.fromARGB(255, 9, 8, 83),
                            Color.fromARGB(255, 7, 45, 181)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
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
                        color: Color.fromARGB(255, 231, 237, 240),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30), // Making the border circular
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
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                                Text(
                                  "Play Quiz by\n guessing the Image",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Top Quiz Categories',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
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
                                  'assets/images/place.jpg',
                                  height: 120,
                                  width: 130,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                'Place',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                      Material(
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
                                  'assets/images/animal.png',
                                  height: 120,
                                  width: 130,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                'Animals',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
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
                                  'assets/images/fruit.jpg',
                                  height: 120,
                                  width: 130,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                'Fruits',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                      Material(
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
                                  'assets/images/objects.jpg',
                                  height: 120,
                                  width: 130,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                'Objects',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
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
}
