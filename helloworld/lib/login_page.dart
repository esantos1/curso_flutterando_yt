import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '', password = '';

//metodo para inserir o body do scaffold
  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //para inserir uma imagem da web
              // Container(
              //   width: 200,
              //   height: 200,
              //   child: Image.network(
              //       'https://cdn1.iconfinder.com/data/icons/computer-techologies-outline-free/128/ic_ex_example-512.png'),
              // ),

              //para inserir uma imagem local

              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        child: Image.asset('assets/images/logo.png'),
                      ),
                      Container(height: 20),
                      TextField(
                        onChanged: (text) {
                          //evento para escutar o que esta sendo digitado
                          //print(text);
                          email = text;
                        },
                        autofocus: true,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(gapPadding: 10),
                        ),
                      ),
                      Container(height: 12),
                      TextField(
                        onChanged: (text) {
                          password = text;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 12),
                      ElevatedButton(
                        style: ButtonStyle(
                          alignment: Alignment.center,
                          padding: MaterialStateProperty.all(
                              EdgeInsetsDirectional.all(25)),
                        ),
                        onPressed: () {
                          if (email == 'e123@gmail.com' && password == '123') {
                            // print('Correto');

                            //empurra uma tela em cima da atual
                            // Navigator.of(context).push(
                            //     MaterialPageRoute(builder: (context) => HomePage()));

                            //chama a proxima tela e extingue a atual
                            // Navigator.of(context).pushReplacement(
                            //     MaterialPageRoute(builder: (context) => HomePage()));

                            //chama as rotas nomeadas e empurra uma tela em cima da atual
                            // Navigator.of(context).pushNamed('/home');

                            // chama as rotas nomeadas, chama a proxima tela e extingue a atual
                            Navigator.of(context).pushReplacementNamed('/home');
                          } else {
                            print('Login Inválido');
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            'Entrar',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //stack: empilha varios widgets um em cima do outro
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(color: Colors.black.withOpacity(0.3)),
          _body(),
        ],
      ),
    );
  }
}
