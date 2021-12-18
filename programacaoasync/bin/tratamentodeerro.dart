void main() {
  print(stringToInt('d'));
}

int stringToInt(String text) {
  int value;
  try {
    value = int.parse(text);
  } catch (e) {
    throw Exception('O text passado ($text) não é um número.');
  }

  return value;
}
