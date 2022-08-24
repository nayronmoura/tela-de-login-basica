import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController EmailController= TextEditingController();
  TextEditingController Password= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login', style: textStyle(Colors.white,30)),
      ),
      body:Container(
        color: const Color.fromARGB(255, 52, 56, 56),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
            const CircleAvatar(
            radius: 80,
            child: Icon(Icons.person,size: 40,),
          ),
          const SizedBox(height:30),
          Padding(
              padding: const EdgeInsets.only(left: 30,right:30,bottom:15),
              child: TextField(
                controller: EmailController,
                keyboardType: TextInputType.emailAddress,
                style: textStyle(const Color.fromARGB(255, 0, 180, 204),10),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: textStyle(const Color.fromARGB(255, 0, 180, 204),15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
          ),
          Padding(
              padding: const EdgeInsets.only(left: 30,right:30),
              child: TextField(
                controller: Password,
                keyboardType: TextInputType.visiblePassword,
                style: textStyle(const Color.fromARGB(255, 0, 180, 204),10),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: textStyle(const Color.fromARGB(255, 0, 180, 204),15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
          ),
          const SizedBox(height:30),
          TextButton(
            onPressed: (){
              if(EmailController.text.isNotEmpty && Password.text.isNotEmpty){
                if(EmailController.text=="admin" && Password.text=="admin"){
                  Navigator.pushReplacementNamed(context, "/home");
                }
                else{
                  showDialog(
                      context: context,
                      builder: (context) => alert("Login Falhou"));
                }
              }
              else{
                showDialog(
                    context: context,
                    builder: (context) => alert("Preencha todos os campos"));
              }
            },
            child: Text("Login",
            style: textStyle(Colors.white,20),),
        )
        ],
      ),
    ),
    ),
    );
  }

  AlertDialog alert(String message){
    return AlertDialog(
      title: Text(message),
      actions: [
        TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: const Text("OK"),
        )
      ],
    );
  }

  TextStyle textStyle(Color cor, double tamanho) {
    return TextStyle(color: cor, fontSize: tamanho);
  }
}
