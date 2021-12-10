class Student {
  late int id;
  late String firstName;
  late String lastName;
  late int grade;
  late String status; //durum

//get okumak set yazmak
  Student(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }
  //withıd ikinci constructur demek

  Student.withId(int id, String firstName, String lastName, int grade){
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }
//status un bir getter ı olduğunu anlatmak için getstatus yazdık
  String get getStatus{
    String message="";
    if(this.grade>=50){
      message ="geçti";

    }else if(this.grade>40){
      message="bütünlemeye kaldı";
    }else{
      message="kaldı";
    }
    //this.status=message;
    return message;
  }






}

