import 'dart:async';

StreamController<int> numberController = StreamController();
int initValue = 0;

addDataInStream() {
  Timer.periodic(Duration(seconds: 1), (timer) {
    initValue++;
    numberController.add(initValue);
  });
}

void main(List<String> args) {
  addDataInStream();

  numberController.stream.listen(
    (data) {
      print(data);
    },
  );
}
