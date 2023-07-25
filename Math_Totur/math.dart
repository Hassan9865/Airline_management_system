import 'dart:io';

import 'dart:math';

final List<Map<String, String>> users = [
  {'username': 'bhai', 'password': 'bhai'}
];

void main() {
  bool isAuthentication = true;
  String? login;
  print("\n=========== Welcome to Math Tutor ==============\n");
  print("Plesae login\n");

  while (isAuthentication) {
    stdout.write("Enter username : ");
    String username = stdin.readLineSync()!;

    stdout.write("Enter password : ");
    String password = stdin.readLineSync()!;

    for (var user in users) {
      if (user['username'] == username && user['password'] == password) {
        isAuthentication = false;
        login = username;
        break;
      }
    }
    if (isAuthentication) {
      print('login failed! Please try again!');
    }
  }
  if(isAuthentication !=null){
    print('login successfully! Salam $login!\n');
    selectOption();
  }
}
  
  void selectOption(){
    print("===== please select option =====");
    print('1- Addition');
    print('2- Subtraction');
    print('3- Multiplication');
    print('4- Division');
    print("What do you want to practice?");
    int choice = int.parse(stdin.readLineSync()!);

    if(choice == 1){
      add();
    }else if(choice == 2){
      sub();
    }else if(choice == 3){
      multi();
    }else if(choice == 4){
      division();
    }
  }
  



void add(){
  final random = Random();
  int count = 0;

  while(count < 5){
  final num1 = random.nextInt(10);
  final num2 = random.nextInt(10);

  final correctAnswer = num1 + num2;

  stdout.write("What is $num1 + $num2? \n");
  final answer = int.parse(stdin.readLineSync()!);

  if(correctAnswer == answer){
    print("Good Job");
  }else{
    print("Thats not correct answer.The correct anser is $correctAnswer");
  }
  count++;
  }
  stdout.write("Do you want to solve more problems? (yes/no)\n");
  final play = stdin.readLineSync();

  if(play == 'yes'){
    add();
  }else{
  print("Thanks for playing keep practice for math skill!");
  }
}
//subtract function
void sub(){
  final random = Random();
  int count = 0;

  while(count < 5){
  final num1 = random.nextInt(10);
  final num2 = random.nextInt(10);

  final correctAnswer = num1 - num2;

  stdout.write("What is $num1 - $num2? \n");
  final answer = int.parse(stdin.readLineSync()!);

  if(correctAnswer == answer){
    print("Good Job");
  }else{
    print("Thats not correct answer.The correct anser is $correctAnswer");
  }
  count++;
  }
  stdout.write("Do you want to solve more problems? (yes/no)\n");
  final play = stdin.readLineSync();

  if(play == 'yes'){
    sub();
  }else{
  print("Thanks for playing keep practice for math skill!");
  }
}
//miltiply function
void multi(){
  final random = Random();
  int count = 0;

  while(count < 5){
  final num1 = random.nextInt(10);
  final num2 = random.nextInt(10);

  final correctAnswer = num1 * num2;

  stdout.write("What is $num1 x $num2? \n");
  final answer = int.parse(stdin.readLineSync()!);

  if(correctAnswer == answer){
    print("Good Job");
  }else{
    print("Thats not correct answer.The correct anser is $correctAnswer");
  }
  count++;
  }
  stdout.write("Do you want to solve more problems? (yes/no)\n");
  final play = stdin.readLineSync();

  if(play == 'yes'){
    multi();
  }else{
  print("Thanks for playing keep practice for math skill!");
  }
}
//division function
void division(){
  final random = Random();
  int count = 0;

  while(count < 5){
  final num1 = random.nextInt(10);
  final num2 = random.nextInt(10);

  final correctAnswer = num1 / num2;

  stdout.write("What is $num1 ÷ $num2? \n");
  final answer = int.parse(stdin.readLineSync()!);

  if(correctAnswer == answer){
    print("Good Job");
  }else{
    print("Thats not correct answer.The correct anser is $correctAnswer");
  }
  count++;
  }
  stdout.write("Do you want to solve more problems? (yes/no)\n");
  final play = stdin.readLineSync();

  if(play == 'yes'){
    division();
  }else{
  print("Thanks for playing keep practice for math skill!");
  }
}