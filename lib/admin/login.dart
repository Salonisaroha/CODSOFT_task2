import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  TextEditingController usernamecontroller = new TextEditingController();
  TextEditingController userpasswordcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFededeb),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 45.0, horizontal: 20.0),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4b6cb7),
                            Color(0xFF182848)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.elliptical(
                      MediaQuery.of(context).size.width,
                      100.0,
                    ),
                  ),
                ),
              ),
              
            ),
            Container(
              margin: EdgeInsets.only(left: 30.0, right:30.0,top:60.0),
              child:Form(child:Column(
                children: [
                  Text('Let\'s start with Admin!', style:TextStyle(
                    color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold
                  )),
                  SizedBox(height: 30.0),
                  Material(
                    elevation:3.0,
                    borderRadius: BorderRadius.circular(20),
                    child:Container(
                      height: MediaQuery.of(context).size.height/2.2,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(20),

                      ),
                      child:Column(children: [
                        SizedBox(height:50.0),
                        Container(
                          padding: EdgeInsets.only(left:20.0, top:5.0),
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.orangeAccent)
                          ),
                          child: Center(
                            child: TextFormField(
                              controller:usernamecontroller ,
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  return 'Please Enter Username';
                                }
                              } ,
                              decoration: InputDecoration(border:InputBorder.none, hintText: "Username", hintStyle: TextStyle(color:Colors.black,) ),
                              
                            ),
                          ),
                        ),
                        SizedBox(height: 40,),
                         Container(
                          padding: EdgeInsets.only(left:20.0, top:5.0),
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.orangeAccent)
                          ),
                          child: Center(
                            child: TextFormField(
                              controller:usernamecontroller ,
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  return 'Please Enter Password!';
                                }
                              } ,
                              decoration: InputDecoration(border:InputBorder.none, hintText: "Password", hintStyle: TextStyle(color:Colors.black,) ),
                              
                            ),
                          ),
                        )
                        
                      ],)
                    )

                  ),

                ],
              ))
            ),
          ],
        ),
      ),
    );
  }
}
