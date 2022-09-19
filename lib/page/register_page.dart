import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:flutter/src/widgets/icon.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
 
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? username;
  String? password;
  String? email;
  
 
  @override
   Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("000000"),
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _registerUI(context),
            ),
            inAsyncCall: isAPIcallProcess,
            opacity: 0.3,
            key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _registerUI(BuildContext context){
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
          //DATOS
          //Usuario
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              bottom: 30,
              top: 50,
            ),
            child: Text(
          "Registro",
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
          //Contraseña
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(
              context,
               prefixIcon: Icon(Icons.person),
              "password",
              "password",
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
          //Correo Electronico 
            Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(
              context,
               prefixIcon: Icon(Icons.person),
              "email",
              "email",
              (onValidateVal){
              if (onValidateVal.isEmpty){
                return "Email can\'t be empty.";
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
            
            )
            ),
          //Boton Registrarse
          SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
              "Regisrarse", 
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
        ],
      ),
    );
  }
}

