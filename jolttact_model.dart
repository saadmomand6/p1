
class JoltTactItemModel {
  String name;
  String time;
  String imageurl;
  String nojolt;
  int id;

  JoltTactItemModel(this.name, this.time, this.imageurl,this.nojolt,this.id);
  
}

class JoltTactHelper {
  static var chatList = [
    JoltTactItemModel("Anna Bella", '08:29 AM', "assets/woman.jpeg", "16",0),
    JoltTactItemModel("Hannan", '11:54 PM',  "assets/man.jpg","20",1),
    JoltTactItemModel("Mommy", '12:24 PM', "assets/man2.jpeg","50",2),
    JoltTactItemModel("Julia William", '03:22 AM', "assets/man3.jpeg","10",3),
    JoltTactItemModel("K Sen", '08:29 AM', "assets/woman2.jpeg","20",4),
    JoltTactItemModel("Tom", '09:37 PM', "assets/man4.jpeg","15",5),

    
  ];
  static JoltTactItemModel getchatitem(int index){
      return chatList[index];
    }

  static var itemCount = chatList.length;
  
}