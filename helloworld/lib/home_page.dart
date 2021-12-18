import 'package:flutter/material.dart';
import 'package:helloworld2/app_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<StatefulWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                    'https://pbs.twimg.com/media/Ew-UF4dWUAIUjT5.jpg'),
              ),
              accountName: Text('Mundell San'),
              accountEmail: Text('e123@gmail.com'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Início'),
              subtitle: Text('Tela de início'),
              onTap: () => print('Home'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              subtitle: Text('Finalizar sessão'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Login'),
        actions: [
          CustomSwitcher(),
        ],
      ),

      //body 1 - introdução
      // body: Center(
      //   child: GestureDetector(
      //       child: Text(
      //         'Contador: $counter',
      //         style: TextStyle(
      //           fontSize: 20,
      //         ),
      //       ),
      //       onTap: () {},
      //     ),
      // ),

      //body 2 - simple state e multi state
      // body: Container(
      //   height: 200,
      //   width: 200,
      //   color: Colors.black,
      //   child: Align(
      //     //single render
      //     alignment: Alignment.centerLeft,
      //     child: Container(
      //       height: 100,
      //       width: 100,
      //       color: Colors.deepOrangeAccent,
      //     ),
      //   ),
      // ),

      //body 3 - pra gerenciamento de estado
      // body: Center(
      //   child: CustomSwitcher(),
      // ),

      // body 4 = Colunm
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contador: $counter'),
            Container(height: 20),
            CustomSwitcher(),
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black45,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black45,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black45,
                ),
              ],
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(
            () {
              counter++;
            },
          );
        },
      ),
    );
  }
}

//componentização de widget
class CustomSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: AppController.instance.isDarkTheme,
        onChanged: (value) {
          AppController.instance.changeTheme();
        });
  }
}
