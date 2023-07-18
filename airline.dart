import 'dart:io';

final List<Map<String, String>> users = [
  {'username': 'user1', 'password': 'password1'},
  {'username': 'user2', 'password': 'password2'},
];

void main() {
  bool isRunning = true;

  print('========= Airline Management System =========');
  print('1. Login');
  print('2. Flight Detail');
  print('3. Exit');
  stdout.write('Enter your choice: ');
  int choice = int.parse(stdin.readLineSync()!);

  if (choice == 1) {
    login();
  } else if (choice == 2) {
    booking();
  } else if (choice == 3) {
    print('Exiting the program');
    isRunning = false;
  }
}

void loginOptions() {
  bool isLoggedIn = true;

  while (isLoggedIn) {
    print('========= Login Options =========');
    print('1. Add Flights');
    print('2. display Flight');
    print('3. Update Flight');
    print('4. Delete Flight');
    print('5. Exit');
    stdout.write('Enter your choice: ');
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      addFlight();
    } else if (choice == 2) {
      displayFlights();
    } else if (choice == 3) {
      updateFlight();
    } else if (choice == 4) {
      deleteFlight();
    } else if (choice == 5) {
      print('Existing the program');
      isLoggedIn = false;
    }
  }
}

void login() {
  bool isAuthenticated = false;
  String? authenticatedUsername;

  print('Welcome to the Login System.');

  while (!isAuthenticated) {
    stdout.write('Username: ');
    String username = stdin.readLineSync()!.trim();

    stdout.write('Password: ');
    String password = stdin.readLineSync()!.trim();

    for (var user in users) {
      if (user['username'] == username && user['password'] == password) {
        isAuthenticated = true;
        authenticatedUsername = username;
        break;
      }
    }

    if (!isAuthenticated) {
      print('Login failed. Invalid username or password.');
    }
  }

  if (authenticatedUsername != null) {
    print('Login successful. Welcome, $authenticatedUsername!');
    loginOptions();
  } else {
    print('Something went wrong during the login process.');
  }
}

//
class Flight {
  final String airline;
  final String flightNumber;
  final String origin;
  final String destination;
  final DateTime departureTime;
  final DateTime arrivalTime;

  Flight(this.airline, this.flightNumber, this.origin, this.destination,
      this.departureTime, this.arrivalTime);
}

void booking() {
  List<Flight> availableFlights = [
    Flight('Airline A', 'AA101', 'Karachi', 'Lahore',
        DateTime(2023, 7, 20, 8, 0), DateTime(2023, 7, 20, 12, 0)),
    Flight('Airline B', 'BB202', 'Karachi', 'Islamabad',
        DateTime(2023, 7, 20, 14, 0), DateTime(2023, 7, 20, 17, 0)),
    Flight('Airline C', 'CC303', 'Pakistan', 'Canada',
        DateTime(2023, 7, 20, 19, 0), DateTime(2023, 7, 20, 22, 0)),
  ];

  print('Welcome to the Flight Booking System.');

  while (true) {
    stdout.write('Enter your origin city: ');
    String origin = stdin.readLineSync()!;

    stdout.write('Enter your destination city: ');
    String destination = stdin.readLineSync()!;

    List<Flight> matchingFlights = availableFlights
        .where((flight) =>
            flight.origin.toLowerCase() == origin.toLowerCase() &&
            flight.destination.toLowerCase() == destination.toLowerCase())
        .toList();

    if (matchingFlights.isNotEmpty) {
      print('Available Flights:');
      for (var flight in matchingFlights) {
        print('${flight.airline} - Flight ${flight.flightNumber}');
        print('Departure: ${flight.departureTime}');
        print('Arrival: ${flight.arrivalTime}');
        print('');
      }
      break;
    } else {
      print('No flights available for the selected route. Please try again.');
    }
  }
}
//

List<Map<String, dynamic>> airlineFlight = [];

void addFlight() {
  stdout.write('Enter Flight Number: ');
  String flightNumber = stdin.readLineSync()!;

  stdout.write('Enter your origin city:');
  String flightCity = stdin.readLineSync()!;

  stdout.write('Enter Destination: ');
  String destination = stdin.readLineSync()!;

  stdout.write('Enter Departure Time (yyyy-mm-dd): ');
  DateTime departureTime = DateTime.parse(stdin.readLineSync()!);

  stdout.write('Enter available seat: ');
  String availableSeat = stdin.readLineSync()!;

  Map<String, dynamic> flight = {
    'flightNumber': flightNumber,
    'flightCity': flightCity,
    'destination': destination,
    'departureTime': departureTime,
    'availableSeats': availableSeat,
  };

  airlineFlight.add(flight);
  print('Flight added successfully');
}

//
void displayFlights() {
  print(
      'Flight Number\tOrigin City\tDestination\tDeparture Time\t\tAvailable Seats');
  for (Map<String, dynamic> flight in airlineFlight) {
    print(
        '${flight['flightNumber']}\t\t${flight['flightCity']}\t\t${flight['destination']}\t\t${flight['departureTime']}\t\t${flight['availableSeats']}');
  }
}

//
void updateFlight() {
  stdout.write('Enter Flight Number to update: ');
  String flightNumber = stdin.readLineSync()!;

  int flightIndex = airlineFlight
      .indexWhere((flight) => flight['flightNumber'] == flightNumber);

  if (flightIndex == -1) {
    print('Flight not found with the provided flight number.');
  } else {
    Map<String, dynamic> flight = airlineFlight[flightIndex];

    stdout.write('Enter New origin City: ');
    String flightCity = stdin.readLineSync()!;

    stdout.write('Enter New Destination: ');
    String newDestination = stdin.readLineSync()!;

    stdout.write('Enter New Departure Time (yyyy-mm-dd HH:mm): ');
    DateTime newDepartureTime = DateTime.parse(stdin.readLineSync()!);

    stdout.write('Enter New Available Seats: ');
    int newAvailableSeats = int.parse(stdin.readLineSync()!);

    flight['flightCity'] = flightCity;
    flight['destination'] = newDestination;
    flight['departureTime'] = newDepartureTime;
    flight['availableSeats'] = newAvailableSeats;

    print('Flight updated successfully!');
  }
}

//
void deleteFlight() {
  stdout.write('Enter Flight Number to delete: ');
  String flightNumber = stdin.readLineSync()!;

  int flightIndex = airlineFlight
      .indexWhere((flight) => flight['flightNumber'] == flightNumber);

  if (flightIndex == -1) {
    print('Flight not found with the provided flight number.');
  } else {
    airlineFlight.removeAt(flightIndex);
    print('Flight deleted successfully!');
  }
}
