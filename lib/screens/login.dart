import 'package:flutter/material.dart';


/* Diferença entre Stateful e Stateless
 *
 * Stateless: Widget que não tem estado, ou seja, não muda de acordo com a interação do usuário
 * Ex: um texto, uma imagem e outras coisas que não pode alterar o status;
 * Stateful: Widget que tem estado, ou seja, muda de acordo com a interação do usuário
 * Ex: um botão quando clicado muda de cor;
 * */

/* Descrição dos Widgets utilizados comparando com HTML
*
* Contaner: Widget que cria um container para outros widgets, ele pode ser usado para criar uma estrutura de layout e funciona como uma Div do HTML;
* Center: Widget que centraliza os widgets filhos;
* Column: Widget que cria uma coluna de widgets, funciona como uma Div com Display: flex;
* Text: Widget que cria um texto, funciona como um h1, h2, h3, p, span, etc;
* Circle Avatar: Widget que cria um avatar circular, funciona para deixar um ícone ou uma imagem redonda. Obs: pode ser utilizado um Container com borda redonda também;
* SizedBox: Widget geralmente utilizado para criar espaço entre os widgets, ele funciona semelhante a um container mas não contém as opções de costumização;
* Padding: Widget que cria um espaço entre o widget e o seu conteúdo, funciona como um padding do CSS;
* TextField: Widget que cria um campo de texto, funciona como um input do HTML;
* TextButton: Widget que cria um botão, funciona como um a ou button do HTML;
* AlertDialog: Widget que cria uma caixa de diálogo, funciona como um alert do JS;
* TextStyle: Widget que cria um estilo de texto, funciona como um style do CSS;
* Navigator: Widget que cria uma navegação entre as telas, funciona como um href do HTML;
* Appbar: Widget que cria uma barra que fica no topo da aplicação, ela pode conter um título, um ícone e um botão de ação, como um navbar do Bootstrap;
*/

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //TextEditinController é uma classe que controla o estado e o valor de um TextInput
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
                  //showDialog é um método que cria uma caixa de diálogo na tela, ele recebe como parâmetro um context e um builder
                  //o contexto de uma aplicação é basicamente as inforções da tela atual, como por exemplo, o tamanho da tela, a cor de fundo, etc.
                  //Você pode pegar esses dados através de um MediaQuery.of(context).size.width, por exemplo.
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