import 'package:ecommerce_clean_arch/core/color/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var rememberMe = false ;
  @override
  Widget build(BuildContext context) {
    return  buildLoginScreen();
  }
  buildLoginScreen() {
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
                ),                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/RegisterOptions');                        },
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      SizedBox(height: 30,),
                      const Text(
                        "Welcome Back!",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, fontFamily: 'Rubik', color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        "Yay! You're back! Thanks for shopping with us. We have excited deals and promotions going on, grab your pick now!",
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, fontFamily: 'Rubik', color: Colors.white),
                        textAlign: TextAlign.start,
                      ),
                      const Text(
                        "LOGIN",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Rubik', color: Colors.white),
                        textAlign: TextAlign.start,
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 25,),
                        outlineTextField("email" , "enter your mail" , false , const Icon(Icons.mail)),
                        outlineTextField("Password" , "enter your pass" , true , const Icon(Icons.password)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,


                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: rememberMe, // You can bind this to a boolean variable
                                  onChanged: (bool? value) {
                                    setState(() {
                                      rememberMe = !rememberMe;

                                    });
                                  },
                                ),
                                const Text("Remember Me"),
                              ],
                            ),
                            TextButton(
                              onPressed: () {

                              },
                              child: const Text("Forgot Password?" , style: TextStyle(fontWeight: FontWeight.bold , color: ColorManager.lightPur),),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25,),
                        _buildBButtonRoundedWithBackground(),
                        const SizedBox(height: 10,),

                        _buildCreateAnAccount()
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

   outlineTextField(String label , String hintText , bool isPass , Icon leftIon){
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
            borderRadius: BorderRadius.circular(20.0), // Adjust the value for the desired roundness
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF6342E8)),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 90 , vertical: 5),
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }


_buildCreateAnAccount(){

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text("Not registered yet?"),
      GestureDetector(
        onTap: () {

          },
        child: const Text(
          " Create an Account",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: ColorManager.lightPur),
        ),
      ),
    ],
  );
}


}
