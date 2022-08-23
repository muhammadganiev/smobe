import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double screenHeight = 0;
  double screenWidth = 0;

  Color primary = const Color.fromARGB(255, 144, 202, 77);
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

//main body of login
    return Scaffold(
      body: Column(
        children: [
          //logo with photo
          Container(
            height: screenHeight / 3,
            width: screenWidth,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/pics/main_page.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(87, 0, 0, 0),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
              ),
              child: Center(
                child: Text(
                  'SMOBE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth / 10,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NexaBold'),
                ),
              ),
            ),
          ),

          //login container
          Container(
            margin: EdgeInsets.only(
              top: screenHeight / 15,
              bottom: screenHeight / 20,
            ),
            child: Text(
              'Login',
              style: TextStyle(
                fontFamily: 'NexaBold',
                color: primary,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //information container
          Container(
            width: 400,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  fieldTitle('Employee ID'),
                  customField('Enter your employee ID', Icons.person, false),
                  fieldTitle('Password'),
                  customField('Enter your password', Icons.lock, true),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: screenHeight / 20),
                    height: 60,
                    width: screenWidth,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: const Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'NexaBold',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

//information about inputs
  Widget fieldTitle(String title) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 6,
        top: 15,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black54,
          fontSize: 20,
          fontFamily: 'NexaBold',
        ),
      ),
    );
  }

  //inputs
  Widget customField(String hint, final IconData icon, bool _isIcon) {
    return Container(
      width: screenWidth,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.all(Radius.circular(50)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: screenWidth / 15,
            margin: EdgeInsets.symmetric(horizontal: screenWidth / 34),
            child: Icon(
              icon,
              color: primary,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: screenWidth / 10),
              child: Expanded(
                child: TextFormField(
                  obscureText: _isIcon ? _isObscure : false,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: screenHeight / 35,
                    ),
                    border: InputBorder.none,
                    hintText: hint,
                    suffixIcon: _isIcon
                        ? IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                              maxLines:
                              1;
                            },
                            // ignore: dead_code
                          )
                        : null,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
