import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobil_yazilim_proje_zehra/Models/student.dart';

class StudentsAdd extends StatefulWidget {
  late List<Student> students;
  //StudentAdd(List<Student> students){
  //this.students=students; //listeye eklmee yapmak içi öğrencinin referansı
  // }
  StudentsAdd(this.students); //dartta böyle kullanılıyor

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State<StudentsAdd> { //özelliklerine  ulaşabilmek için fonksiyonlarda
  var formKey=GlobalKey<FormState>();
  //eklenilen student degeri olusturulur
   Student student = Student("", "", 0);

  @override
  Widget build(BuildContext context) {
    //scaffold geri tuşunu otomatik oluşturuyor
    return Scaffold(
        appBar: AppBar(
          title: Text("Yeni Öğrenci"),
        ),
        body: Container(
          //margin her taraaftan boşuk bırakıyor, only oldugunda tek tarf
            margin: EdgeInsets.all(20.0), //sağdan soldan boşluklar
            child: Form(
              key: formKey,
                child: Column(
                  children: <Widget>[
                    buildFirstNameField(),
                    buildLastNameField(),
                    buildGradeField(),//firstname e fonk.
                    buildSubmitButton()
                  ],
                ),),),);
  }


 Widget buildFirstNameField() {
    return TextFormField(
      //text formu
      decoration: InputDecoration(labelText: "ÖĞRENCİ ADI", hintText: "ÖĞRENCİ ADI GİRİNİZ"),
      //tıklayınca örn
      onSaved: (value) { //textin degeri otomatik parametre atansın diye
        student.firstName = value!; //firstname i value olsun
      },

    );
  }
  Widget buildLastNameField() {
    return TextFormField(
      //text formu
      decoration: InputDecoration(labelText: "ÖĞRENCİ SOYADI", hintText: "ÖĞRENCİ SOYADI GİRİNİZ"),
      //tıklayınca örn
      onSaved: (value) { //textin degeri otomatik parametre atansın diye
        student.lastName = value!; //firstname i value olsun
      },

    );
  }
  Widget buildGradeField() {
    return TextFormField(
      //text formu
      decoration: InputDecoration(labelText: "ALDIĞI NOT", hintText: "ÖRN : 100"),
      //tıklayınca örn
      onSaved: (value){
        student.grade=int.parse(value!);
      },

    );
  }
  Widget buildSubmitButton(){
    return RaisedButton(
      child: Text("KAYDET"),
        color: Colors.orangeAccent,
      onPressed: (){
        formKey.currentState!.save();
        widget.students.add(student);
        Navigator.pop(context); //ekleyince bir önceki sayfaya geri dönmesi için


      },

    );
  }

}