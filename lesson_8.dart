import 'dart:io';
import 'dart:math';

void main() {
  // randomList();
  // randomFive();
  // randomListFifty();
  // binarySearch();
  // automateRandomSearch(6);
  // automateBinarySearch(9);

  // computerPlays(list);
  computerPlaysWithCounter(list);
}

randomInt() => Random().nextInt(10);

//   1) Выведите на экран сумму двух случайно сгенерированных чисел
sumTwoRandom(int a, int b) => randomInt() + randomInt();

// 2) Заполните массив случайными числами, размер массива задайте через
// рандом
randomList() => new List<int>.generate(randomInt(), (_) => randomInt());
// 3)Заполните массив случайными числами в интервале [0,5]. Введите число X
// и найдите все индексы значения, равные X.
randomFive() {
  int x = 4;
  List indexeList = [];
  List numList = List.generate(randomInt(), (_) => Random().nextInt(5));
  for (var i = 0; i < numList.length; i++) {
    if (numList[i] == x) {
      indexeList.add(i);
    }
  }
  print(indexeList);
}

// 4)Заполните массив случайными числами в интервале [50,100]. Определить,
// есть ли в нем элементы с одинаковыми значениями, стоящие рядом.

int randomIntInRange(int min, int max) => min + Random().nextInt(max - min);

randomListFifty() {
  List list = List.generate(randomInt(), (_) => randomIntInRange(50, 100));
  for (var i = 1; i < list.length; i++) {
    if (list[i - 1] == list[i]) {
      print('case index $i');
    }
  }
  print(list);
}

// 1) Написать функцию рандомного поиска. (Пользователь загадывает число, программа выдает
// ему число от 0 до 100 рандомным образом и так до тех, пор пока пользователь не скажет,
// что число верно. Алгоритм работы схож с бинарным поиском).

randomSearch() {
  var answer = '';
  var min = 0;
  var max = 128;
  var mid = randomIntInRange(min, max);
  var counter = 0;

  do {
    stdout.write("Is your number bigger or less ${mid}, input b/l or yes \n");
    answer = stdin.readLineSync()!;
    if (answer == 'l') {
      max = mid;
      mid = randomIntInRange(min, max);
    } else if (answer == 'b') {
      min = mid;
      mid = randomIntInRange(min, max);
    } else if (answer == 'yes') {
      print('you have made $counter steps');
    } else {
      print('no such command');
    }
    counter++;
  } while (answer != 'yes');
}

// 2) Написать две дополнительные функции для проверки количества шагов,
// за которое компьютер угадал число. Компьютер играет сам с
// собой и возвращает количество шагов.

computerPlays(List<int> list) {
  var automateRandomSearchCounter = 0;
  var automateBinarySearchCounter = 0;
  list.forEach((element) {
    automateRandomSearch(element);
    automateBinarySearch(element);
  });
}

int automateRandomSearch(int num) {
  var min = 0;
  var max = 128;
  var mid = randomIntInRange(min, max);
  var counter = 0;

  do {
    if (num < mid) {
      max = mid;
      mid = randomIntInRange(min, max);
    } else if (num > mid) {
      min = mid;
      mid = randomIntInRange(min, max);
    }

    counter++;
  } while (num != mid);
  print('random search made $counter steps');
  return counter;
}

int automateBinarySearch(int num) {
  var min = 0;
  var max = 128;
  var mid = ((min + max) / 2).round();
  var counter = 0;

  do {
    if (num < mid) {
      max = mid;
      mid = ((min + max) / 2).round();
    } else if (num > mid) {
      min = mid;
      mid = ((min + max) / 2).round();
    }
    counter++;
  } while (num != mid);
  print('binary search made $counter steps');
  return counter;
}

//  3) Сгенерируйте массив из 100 или более случайных чисел и по очереди прогоните
//  его через каждый алгоритм угадывания. Определите среднее количество шагов, которое
//  потребовалось каждому алгоритму на одно число. Протестируйте, какой из способов
//  угадывания эффективнее. Лучший алгоритм тот, который угадал быстрее.

randomListForGame() => new List<int>.generate(randomIntInRange(99, 100), (_) => randomIntInRange(1, 128));
var list = randomListForGame();

computerPlaysWithCounter(List<int> list) {
  int automateRandomSearchCounter = 0;
  int automateBinarySearchCounter = 0;
  int counter = 0;
  list.forEach((element) {
    automateRandomSearchCounter += automateRandomSearch(element);
    automateBinarySearchCounter += automateBinarySearch(element);
    counter++;
  });
  print('random search has made $automateRandomSearchCounter steps');
  print('binary search has made $automateBinarySearchCounter steps');
  print(
      'average for random search ${(automateRandomSearchCounter / counter).round()} steps');
  print(
      'average for binary search ${(automateBinarySearchCounter / counter).round()} steps');
}
