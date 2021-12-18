void main() {
  // a programação já é síncrona, ou seja, executa linha por linha do codigo (event loops)
  /*print('Hello world!');
  print('1');
  print('2');
  print('3');*/

  //programação assíncrona: cria um loop paralelo ao executado na programação síncrona atual
  // for (var i = 0; i < 6; i++) {
  //   print(i);
  // }

  //para ver o future
  // var future = Future.delayed(Duration(seconds: 2));
  // future.then((value) => print('novo 4'));
  // print('1');
  // print('2');
  // print('3');

  //funcoes future
  Future<void> print4() async {
    await Future.delayed(Duration(seconds: 2));
    print(4);
  }

  print4();
  print('1');
  print('2');
  print('3');
}
