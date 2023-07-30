import 'dart:io';

class Student{
  String id;
  String name;

  Student(this.id, this.name);

}
class School{
List<Student> students =[];

void addStudent(String id, String name){
  students.add(Student(id, name));
}
void displayStudent(){
  for(var student in students){
    print("ID: ${student.id} , Name: ${student.name}");
  }
}
void removeStudent(String id){
  students.removeWhere((Student) => Student.id == id);
}
}

void main(){
  School sms = School();

  while(true){
    print("======= Welcome ======");
    print("Enter 1 to add Student");
    print("Enter 2 to Disply all Student");
    print("Enter 3 to remove Student");
    print("Enter 4 to add Student");
    var input = stdin.readLineSync();

    switch (input){
      case '1':
        print("Enter ID");
        var id = stdin.readLineSync()!;
        print("Enter Name:");
        var name = stdin.readLineSync()!;
        sms.addStudent(id, name);
        print("Data Added Successfully!\n");
        break;
        case '2':
        print("Student Data");
        sms.displayStudent();
        break;
        case '3':
        print("Enter id to remove Student");
        var id = stdin.readLineSync()!;
        sms.removeStudent(id);
        break;
        case '4':
        print("Exit");
        exit(0);
      }
    }
  }