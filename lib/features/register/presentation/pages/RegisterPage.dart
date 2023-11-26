import 'package:flutter/material.dart';

import '../../../../core/color/AppColors.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return buildRegisterScreen();
  }

  buildRegisterScreen() {
    return Center(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF7F77FE), Color(0xFFA573FF)],
                  ),
                ), width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/RegisterOptions');
                        },
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      SizedBox(height: 30,),
                      const Text(
                        "Get’s started with Geeta.",
                        style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 30,
                            fontFamily: 'Rubik',
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        "Register",
                        style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Rubik',
                            color: Colors.white),
                        textAlign: TextAlign.start,
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0, vertical: 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 35,),
                        outlineTextField(
                            "Name", "enter your name", false, const Icon(Icons
                            .person)),
                        outlineTextField(
                            "email", "enter your mail", false, const Icon(Icons
                            .mail)),
                        outlineTextField("Password", "enter your pass", true,
                            const Icon(Icons.password)),
                        const SizedBox(height: 50,),
                        _buildBButtonRoundedWithBackground(),
                        const SizedBox(height: 10,),

                        const Text(
                            "By  joining I agree to receive emails from Geeta.")
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  outlineTextField(String label, String hintText, bool isPass, Icon leftIon) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: TextField(
              cursorColor: ColorManager.lightPur,
              obscureText: isPass,
              decoration: InputDecoration(
                labelText: label,
                hintText: hintText,
                prefixIcon: leftIon,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBButtonRoundedWithBackground() {
    return ElevatedButton(
      onPressed: () {

      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                20.0), // Adjust the value for the desired roundness
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFF6342E8)),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 90, vertical: 5),
        child: Text(
          'REGISTER',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}


