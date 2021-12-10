import 'package:flutter/material.dart';
import 'package:mobil_yazilim_proje_zehra/Models/student.dart';
import 'package:mobil_yazilim_proje_zehra/screens/StudentRemove.dart';

import 'screens/StudentRemove.dart';
import 'screens/StudentsAdd.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //stataless da tek ekran cizer
  //stateless widget ını kullanmak için extend ettik
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //birşey döndürülüyor //material app tasarımı yapılacak anlamına geliyor
      home: HomeScreen(),
      //spagetti olmaması için ve tekrar tekrar kullanabilmek için
    );
  }
}

//homescreen artık stateful widget
class HomeScreen extends StatefulWidget {
  //stateful da tekrar tekrar ekranın çizilmesine gerek kalmıyor
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState(); //aşağıdaki homescreen di statefula cevirdik
  }
}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.withId(1, "Ayse", "Demir", 95),
    Student.withId(2, "Ali", "Oz", 45),
    Student.withId(3, "Aylin", "Toprak", 34),
  ];
  Student selectedStudent = Student.withId(0, "firstName", "lastName", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      //scaffoldun child ı yok body kullanılır
      appBar: AppBar(
        title: Text("OGRENCİ KAYIT SİSTEMİ"),
      ),
      body: buildBody(),
    );
  }

  buildBody() {
    return Column(
      //column alt alta yazar //Row ise yan yana yazar
      children: [
        Expanded(
          //boyutları ayarlayabilmesi için //hata vermemesi için -size
          child: ListView.builder(
              itemCount: students.length, //eleman sayısı kadar çalışır
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(students[index].firstName +
                      " " +
                      students[index].lastName),
                  //boşluklu alt alta
                  subtitle: Text("sınavdan aldığı not: " +
                      students[index].grade.toString() +
                      "[" +
                      students[index].getStatus +
                      "]"),
                  //grade int oldugundan metine cevirdik
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.google.com.tr/imgres?imgurl=https%3A%2F%2Fwww.odersburada.com%2Fimg%2Fprofil.jpg&imgrefurl=https%3A%2F%2Fwww.odersburada.com%2Fprofil.php%3Fkid%3D753469663&tbnid=3-Spbr88gVJJ5M&vet=12ahUKEwidlPbn4MX0AhW5ybsIHb3WBW8QMygCegQIARA2..i&docid=eMMLHvCeeCT6ZM&w=460&h=460&q=bilinmeyen%20%C3%B6%C4%9Frenci%20profili&hl=tr&ved=2ahUKEwidlPbn4MX0AhW5ybsIHb3WBW8QMygCegQIARA2"),
                  ),
                  trailing: buildStatusIcon(students[index].grade),

                  onTap: () {
                    setState(() {
                      //setState buıld ı tekrar çalıştır demek. tekrar çizmesi için sectiginde alta yazması için
                      this.selectedStudent = students[
                          index]; //yeni değişkene atadı çünkü expanded ın içinde tanımlı olan bir tek orada kullanılır
                    });
//buıld ekrana çiz demek,tamamını değil
                    print(selectedStudent.firstName);
                    //print(students[index].firstName+"secildi"); //terminale secildi yazar
                  },
                  //basıldıgında
                  onLongPress: () {
                    //fonksiyon()
                    print("uzun basıldı");
                  },
                );
              }),
        ),
        Text("SEÇİLEN ÖĞRENCİ: " + selectedStudent.firstName),
        Flexible(
            //buton
            fit: FlexFit.loose,
            flex: 1,
            child: RaisedButton(
              //buton

              color: Colors.deepOrange,
              onPressed: () {}, //buton ekleyince kendi getiriyor
              child: Row(
                //yanyana
                children: <Widget>[
                  Icon(Icons.accessibility_new_rounded),
                  SizedBox(width: 4.0), //boşuk bırakmak için
                  Text("       ÖĞRENCİ EKLE       "),
                  Icon(Icons.add)
                ],
              ),

              onLongPress: () {
                //uzun basınca gelir
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StudentsAdd(
                            students))); //referans aldık yukarıdakş liseteden
              },
            ))
      ],
    );

  }
}




Widget buildStatusIcon(int grade) {
  if (grade >= 50) {
    return Icon(Icons.star);
  } else if (grade >= 40) {
    return Icon(Icons.album);
  } else {
    return Icon(Icons.clear);
  }
}
