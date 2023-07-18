import 'dart:io';

void main() {
  bool isRunning = true;

  while (isRunning) {
    print('========= Airline Management System =========');
    print('1. Add Flight');
    print('2. Display Flights');
    print('3. Search Flight');
    print('4. Update Flight');
    print('5. Delete Flight');
    print('6. Exit');
    stdout.write('Enter your choice: ');
    int choice = int.parse(stdin.readLineSync()!);

    if(choice == 1){
      addFlight();
  }
  else if (choice == 2) {
    displayFlight();
    }
    else if (choice == 3){
      searchFlight();
    }
  else if (choice == 6){
    print('Existing the program');
    isRunning = false;
  }
}
}

List<Map<String,dynamic>> airlineFlight = [];

void addFlight(){
  
  stdout.write('Enter Flight number:');
  String flightNumber = stdin.readLineSync()!;

  stdout.write('Enter Destination: ');
  String destination =stdin.readLineSync()!;

  stdout.write('Enter available seat: ');
  String availableSeat = stdin.readLineSync()!;

  Map<String,dynamic> flight={
    'flightNumber':flightNumber,
    'destination':destination,
    'availableSeat':availableSeat,
  };

  airlineFlight.add(flight);
  print('Flight added successfully');

  }

void displayFlight() {
  print('Flight Number\tDestination\t\tAvailable Seats');
  for (Map<String, dynamic> flight in airlineFlight) {
    print(
        '${flight['flightNumber']}\t\t${flight['destination']}\t\t\t${flight['availableSeat']}');
  }
  }

  void searchFlight() {
  stdout.write('Enter Flight Number or Destination: ');
  String searchQuery = stdin.readLineSync()!;

 List<Map<String, dynamic>> searchResults = airlineFlight
      .where((flight) =>
          flight['flightNumber'].contains(searchQuery) ||
          flight['destination'].toLowerCase().contains(searchQuery.toLowerCase()))
      .toList();

       if (searchResults.isEmpty) {
    print('No flights found matching the search criteria.');
  } else {
    print('Flight Number\tDestination\tAvailable Seats');
    for (Map<String, dynamic> flight in searchResults) {
      print(
          '${flight['flightNumber']}\t\t${flight['destination']}\t\t\t${flight['availableSeat']}');
    }
  }
  }