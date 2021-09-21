import 'package:flutter/material.dart';
import 'package:flutter_simple_mess/message.dart';
import 'messagecard.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<String> createAddDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Add a message",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            content: Column(children: <Widget>[
              TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Name",
                    contentPadding: EdgeInsets.only(left: 15),
                  )),
              SizedBox(height: 10),
              TextField(
                  controller: contentController,
                  decoration: InputDecoration(
                    hintText: "Message",
                    contentPadding: EdgeInsets.only(left: 15),
                  ))
            ]),
            actions: <Widget>[
              MaterialButton(
                  elevation: 5.0,
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                  onPressed: () {
                    if (nameController.text.isEmpty ||
                        contentController.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Name or Message is empty",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      Navigator.of(context).pop(nameController.text.toString() +
                          "/////" +
                          contentController.text.toString());
                    }
                  })
            ],
          );
        });
  }

  TextEditingController _controller = new TextEditingController();
  List messageDataOnSeatch = [];
  List messageData = [
    Message(
        avatarUrl:
            "https://upload.wikimedia.org/wikipedia/commons/8/8c/Cristiano_Ronaldo_2018.jpg",
        senderName: "Cristiano Ronaldo",
        messageContent:
            "hello em trai, chu nhat nay di da banh 8h san old trafford nhe",
        sentDate: DateTime.parse("2021-09-21 15:30:00"),
        countMess: 2,
        isActive: true),
    Message(
        avatarUrl:
            "https://us.v-cdn.net/5021068/uploads/editor/se/nvlhpgclvt5o.jpg",
        senderName: "Tommy Shelby",
        messageContent: "Minh ma la anh em, em nhe!!!",
        sentDate: DateTime.parse("2021-09-21 12:00:00"),
        countMess: 1,
        isActive: false),
    Message(
        avatarUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHNBtjjWS4k8qhpKF5qmn6oY5e_W6n9ZWNZA&usqp=CAU",
        senderName: "Jack",
        messageContent: "Chao anh ban",
        sentDate: DateTime.parse("2021-09-21 09:00:00"),
        countMess: 1,
        isActive: true),
    Message(
        avatarUrl:
            "https://vnn-imgs-f.vgcloud.vn/2021/05/04/16/bill-gates-giau-co-nao-1.jpg",
        senderName: "Bill Gates",
        messageContent:
            "Microsoft phát hành phiên bản bán lẻ đầu tiên của Microsoft Windows vào ngày 20 tháng 11 năm 1985, và trong tháng 8, công ty ký hợp đồng với IBM nhằm phát triển một hệ điều hành riêng biệt gọi là OS/2",
        sentDate: DateTime.parse("2021-09-20 20:33:00"),
        countMess: 100,
        isActive: false),
    Message(
        avatarUrl:
            "https://media.vov.vn/sites/default/files/styles/large/public/2021-08/jesse-lingard.jpg",
        senderName: "Jesse Lingard",
        messageContent: "I am the king of football. Lord Lingardinho",
        sentDate: DateTime.parse("2021-09-20 20:20:00"),
        countMess: 0,
        isActive: true),
    Message(
        avatarUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaAwj1ZPlcERKCg50OkULMnrCW84DrZQbZDA&usqp=CAU",
        senderName: "Nguyễn Thanh Tùng",
        messageContent: "OK",
        sentDate: DateTime.parse("2021-09-20 16:03:00"),
        countMess: 0,
        isActive: true)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Positioned(
                child: Container(
              padding: EdgeInsets.only(top: 10),
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 36,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          messageDataOnSeatch = messageData
                              .where((element) => element.senderName
                                  .toString()
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                      controller: _controller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15, bottom: 15),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.search, size: 35.0)
                ],
              ),
            )),
            Container(
              padding: EdgeInsets.only(left: 30, bottom: 30),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Messages',
                style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: _controller.text.isNotEmpty && messageDataOnSeatch.isEmpty
                  ? Container(
                      alignment: Alignment.center,
                      child: Text(
                        "No results found",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: _controller.text.isNotEmpty
                          ? messageDataOnSeatch.length
                          : messageData.length,
                      itemBuilder: (context, index) => MessageCard(
                          message: _controller.text.isNotEmpty
                              ? messageDataOnSeatch[index]
                              : messageData[index]),
                    ),
            )
          ],
        ),
      )),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.black,
                    ),
                    onPressed: null),
                Positioned(
                    bottom: 0,
                    left: 22,
                    child: Container(
                        alignment: Alignment.center,
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            color: Colors.black, shape: BoxShape.circle)))
              ],
            ),
            IconButton(
                icon: Icon(Icons.account_circle_outlined), onPressed: null),
            IconButton(icon: Icon(Icons.settings_outlined), onPressed: null),
          ],
        ),
        height: 70,
        padding: EdgeInsets.only(left: 50, right: 50),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createAddDialog(context).then((value) {
            List<String> s = value.split("/////");
            String name = s[0];
            String mess = s[1];
            int position = checkSender(name);
            addMess(position, name, mess);
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  int checkSender(String name) {
    int res = -1;
    for (int i = 0; i < messageData.length; i++) {
      if (messageData[i].senderName.toString() == name) {
        res = i;
      }
    }
    return res;
  }

  void addMess(int position, String name, String mess) {
    setState(() {
      if (position == -1) {
        messageData.insert(
            0,
            Message(
                avatarUrl:
                    "https://iupac.org/wp-content/uploads/2018/05/default-avatar.png",
                senderName: name,
                messageContent: mess,
                sentDate: DateTime.now(),
                countMess: 1,
                isActive: true));
      } else {
        Message message = messageData[position];
        message.isActive = true;
        message.countMess++;
        message.messageContent = mess;
        message.sentDate = DateTime.now();
        messageData.removeAt(position);
        messageData.insert(0, message);
      }
      messageData.forEach((element) {
        element.sentDate = element.sentDate;
      });
    });
  }
}
