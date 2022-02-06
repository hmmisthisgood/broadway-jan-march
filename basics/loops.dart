// for

// for each

//  for in

//  while

//  do while

main() {
  int i = 2;

  List<int> listExample = [1, 2, 3, 45, 6];

  Map languages = {
    "name": "Nepali ",
    "type": "Indo aryan ",
    "country": "Nepal   ",
  };

  for (i; i < listExample.length; i++) {
    print("the curretn value is : ${listExample[i]}");

    // listExample.removeAt(10);
  }

// for each

  listExample.forEach((item) {
    print("looping form for each : $item");
    // listExample.removeAt(0);
  });

  var evenList = listExample.where((element) {
    if (element % 2 == 0) {
      return true;
    }
    return false;
  }).toList();

  var itemFound =
      listExample.firstWhere((element) => element == 45, orElse: () => -1);

  // listExample.indexWhere((element) => false);
  // listExample.indexOf(element);

  var newList = listExample.map<String>((item) {
    return "${item + 1}";
  }).toList();

  newList.add("1");
  newList.addAll(["1", "3"]);

  // print("old map: ");
  // print(languages);
  languages = languages.map((key, value) {
    return MapEntry(key, value.toString().trim());
  });

  languages['script'] = "devnagari";

  MapEntry entry = MapEntry("key", "value");
  languages.addEntries([entry]);

  // print(languages);

  if (languages.containsKey("name")) {
  } else if (languages.containsKey("name")) {
  } else {}

// for in

  for (int item in listExample) {
    print(item);
  }

  int whileLoop = 0;

  while (whileLoop < 10) {
    print("while loop printing:$whileLoop");
    whileLoop++;
  }
}
