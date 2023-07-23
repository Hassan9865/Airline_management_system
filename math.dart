import 'dart:io';
import 'dart:math';

void main() {
  final random = Random();

  while (true) {
    // Generate two random numbers.
    final num1 = random.nextInt(10);
    final num2 = random.nextInt(10);

    // Calculate the correct answer.
    final correctAnswer = num1 + num2;

    // Ask the user to solve the problem.
    stdout.write('What is $num1 + $num2? ');
    final userAnswer = int.tryParse(stdin.readLineSync()!);

    if (userAnswer == correctAnswer) {
      print('Correct! Good job.\n');
    } else {
      print('Sorry, that\'s not correct. The correct answer is $correctAnswer.\n');
    }

    // Ask the user if they want to continue.
    stdout.write('Do you want to solve another problem? (yes/no) ');
    final continuePlaying = stdin.readLineSync();

    if (continuePlaying != 'yes') {
      break;
    }
  }

  print('\nThanks for playing! Keep practicing your math skills!');
}

