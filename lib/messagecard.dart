import 'package:flutter/material.dart';
import 'package:flutter_simple_mess/message.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({Key key, this.message}) : super(key: key);
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(message.avatarUrl),
              ),
              if(message.isActive==true)
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3)),
                  ))
            ],
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  message.senderName,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800),
                ),
                SizedBox(height: 8),
                Text(
                  message.messageContent,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                )
              ],
            ),
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                timeAgo(message.sentDate),
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(height: 8),
              if (message.countMess != 0)
                Container(
                  height: 28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.blue),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.center,
                    child: Text(
                      message.countMess.toString(),
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }

  String timeAgo(DateTime notificationDate) {
    final date2 = DateTime.now();
    final difference = date2.difference(notificationDate);

    if (difference.inDays > 8) {
      return notificationDate.toString();
    } else if ((difference.inDays / 7).floor() >= 1) {
      return '1 week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} day';
    } else if (difference.inDays >= 1) {
      return '1 day';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hour';
    } else if (difference.inHours >= 1) {
      return '1 hour';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} min';
    } else {
      return '1 min';
    }
  }
}
