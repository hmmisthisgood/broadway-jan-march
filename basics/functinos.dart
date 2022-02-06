import 'dart:io';

num area(num length, num breadth) {
  // final area = length * breadth;
  // return area;

  // if (1 == 1) {}

  if (length == 0) return -1;

  if (breadth == null || breadth == 0) {
    return -1;
  }

  return length * breadth;
}

division(number) {
  if (number == 0) {
    throw "tHIS IS AN EXCEPTION";
  }
}

void main() {
  var rectArea = area(10, 20);

  if (rectArea == -1) {
    print("ARea is invalid or incorrect");
  }

  try {
    division(0);
    print("this is division result");
  } on IOException catch (e, s) {
  } catch (e, s) {
    print(e);
  } finally {
    /// this is executed no mattter the success or failure
  }

  print("area in main is : $rectArea");
}
