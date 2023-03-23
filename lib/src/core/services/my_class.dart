class MyClass {
  static final MyClass _myClass = MyClass._internal();

  factory MyClass() {
    return _myClass;
  }

  MyClass._internal();

  void sayHello(int number1, int number2) {
    print(number1 + number2);
  }
}
