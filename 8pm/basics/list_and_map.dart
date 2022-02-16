main() {
  List simpeleList = ["string", 1, 3, 4];

  List listExample = [1, 1, 1, 1, 1, 1, 2, 3, 4, "roll", 3.0, true, false];
  List<int> integerList = [12, 3, 3, 4];

  ///  list index starts at 0.

  var listItem = listExample[5];

  print("the 6th item in list is : $listItem");

// adding value in list
  listExample.add("some random value");

  listExample.remove("roll");
  listExample.removeAt(0);
  listExample.clear();

  bool isListEmpty = listExample.isEmpty;

// Map is a collection of key and values where a value is associated
// with its key

//  map with dynamic key and values
  Map dynamicMap = {
    "name": "Flutter",
    "startedDate": 2018,
    360: 3 + 60.0,
    500: "Five hundred",
    "randomKey": {},
    "features": [
      "fast",
      "reliable",
      "flexible",
    ],
  };

//  strongly typed map
  Map<String, List<int>> strongMap = {
    "1": [1, 2],
    "2": [34]
  };
  Map emptyNap = {};

  emptyNap.isEmpty;

// accessing the values of map

  var strongMapItem = strongMap["1"];

  var dynamicMapItem = dynamicMap["features"];

  print("value of 1 is :$strongMapItem");

  print("feauters of flutter are: $dynamicMapItem");

// Iterable = countable

  /// Set

  Set setEample = {1, 1, 2, 3};
  print(setEample);
}
