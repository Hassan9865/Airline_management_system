import 'dart:io';
import 'dart:math';

void main(){
  final random = Random();

  while(true){
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
  stdout.write("Do you want to solve more problems? (yes/no)\n");
  final play = stdin.readLineSync();

  if(play != 'yes'){
    break;
  }
  }
  print("Thanks for playing keep practice for math skill!");
  }