import 'package:flutter/material.dart';

class RegisterOptions extends StatefulWidget {
  const RegisterOptions({super.key});
  @override
  State<RegisterOptions> createState() => _RegisterOptionsState();
}

class _RegisterOptionsState extends State<RegisterOptions> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
  Widget _buildBody(){
    return   Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Geeta" , style:  TextStyle(fontWeight: FontWeight.bold , fontSize: 50 ,fontFamily: 'Rubik' ),textAlign: TextAlign.center,),
            const SizedBox(height: 65,),
            const Text("Create your fashion in your own way" , style: TextStyle(fontWeight: FontWeight.bold ,fontFamily: 'Rubik', fontSize: 30 ),textAlign: TextAlign.center,),
            const SizedBox(height: 120,),
            _buildBButtonWithBorder(),
            _buildTextWithBorderAndLine(),
            _buildBButtonRoundedWithBackground()

          ],),
      ),
    );
  }

  Widget _buildBButtonWithBorder() {
    return OutlinedButton(
      onPressed: () {
        onLoginPressed();

      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Adjust the value for the desired roundness
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(color: Colors.black),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 90 , vertical: 9),
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
  Widget _buildTextWithBorderAndLine() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 20.0, // Adjust the width to control the length of the line
            child: Divider(
              color: Colors.black,
              thickness: 1.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'LOGIN',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(
            width: 20.0, // Adjust the width to control the length of the line
            child: Divider(
              color: Colors.black,
              thickness: 1.0,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildBButtonRoundedWithBackground() {
    return ElevatedButton(
      onPressed: () {
        onRegisterPressed();
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Adjust the value for the desired roundness
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF6342E8)),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 75 , vertical: 9),
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

  onLoginPressed(){
    Navigator.pushNamed(context, '/LoginScreen');
  }
  onRegisterPressed(){
    Navigator.pushNamed(context, '/RegisterScreen');

  }



}
