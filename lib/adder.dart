
class Adder {
  int _a;
  int _b;

  Adder() {
    _a = 0;
    _b = 0;
  }

  int get a => _a;
  int get b => _b;
  int get sum => a + b;

  set a(int value) {
    _a = value;
  }

  set b(int value) {
    _b = value;
  }

}