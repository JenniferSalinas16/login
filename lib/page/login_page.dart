import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:flutter/src/widgets/icon.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
bool isAPIcallProcess = false;
bool hidePassword = true;
GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
String? username;
String? password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("000000"),
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _loginUI(context),
            ),
            inAsyncCall: isAPIcallProcess,
            opacity: 0.3,
            key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4 ,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                ]
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment:Alignment.center ,
                  child: Image.asset(
                    "assets/images/logo1_Png.png",
                    width: 250,
                    fit: BoxFit.contain,
                  ),
                  )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              bottom: 30,
              top: 50,
            ),
            child: Text(
          "Ingreso",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
           color: Colors.white,
            ),
           ),
          ),
          FormHelper.inputFieldWidget(
            context,
             prefixIcon: Icon(Icons.person),
            "username",
            "UserName",
            (onValidateVal){
            if (onValidateVal.isEmpty){
              return "Username can't be empty.";
            }

            return null;
          }, 
          (onSavedVal) {
            username = onSavedVal;
          },
          borderFocusColor: Colors.white,
          prefixIconColor: Colors.white,
          borderColor: Colors.white,
          textColor: Colors.white,
          hintColor: Colors.white.withOpacity(0.7),
          borderRadius: 10
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(
              context,
               prefixIcon: Icon(Icons.person),
              "password",
              "Password",
              (onValidateVal){
              if (onValidateVal.isEmpty){
                return "Password can\'t be empty.";
              }

              return null;
            }, 
            (onSavedVal) {
              password = onSavedVal;
            },
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white,
            borderColor: Colors.white,
            textColor: Colors.white,
            hintColor: Colors.white.withOpacity(0.7),
            borderRadius: 10,
            obscureText: hidePassword,
            suffixIcon: IconButton(
              onPressed: (){
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              color: Colors.white.withOpacity(0.7),
              icon: Icon(
                hidePassword ? Icons.visibility_off : Icons.visibility,
              ),
            )
            ),
          ), 
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(right: 25, top: 10),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.grey, 
                  fontSize: 14.0
                  ),
                children: <TextSpan>[
                TextSpan(
                  text: 'Olvidaste tu Contraseña',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print("Olvidaste tu contraseña");
                    },
                  ),
                ],
                ),
            ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
              "Login", 
              () {},
              btnColor: HexColor("#283B71"),
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 10,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "OR", 
              style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
            ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Registrarse 
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(right: 25, top: 10),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.grey, 
                  fontSize: 14.0
                  ),
                children: <TextSpan>[
                  TextSpan(text: "No tienes una cuenta ?"),
                TextSpan(
                  text: 'Registrarse',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, "/register");
                    },
                  ),
                ],
                ),
            ),
            ),
          ),
        ],
      ),
    );
  }
}


        
       