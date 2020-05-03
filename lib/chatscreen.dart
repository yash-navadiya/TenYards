import 'package:flutter/material.dart';
import 'chatmessage.dart';
class chatscreen extends StatefulWidget {
  @override
  _chatscreenState createState() => _chatscreenState();
}

class _chatscreenState extends State<chatscreen> {

  final TextEditingController _textcontroller = new TextEditingController();
  final List<chatmessage> _messages = <chatmessage>[];

  void _handlesubmitted(String text)
  {
    _textcontroller.clear();
    chatmessage message = new chatmessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _textcomposerwidget(){
    return new IconTheme(
      data: new IconThemeData(color: Colors.blue),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(hintText: "send a message"),
                controller: _textcontroller,
                onSubmitted: _handlesubmitted,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(icon: new Icon(Icons.send), onPressed: ()=>_handlesubmitted(_textcontroller.text)),
            )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return  new Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            padding: new EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_,int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        new Divider(height: 1.0,),
        new Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textcomposerwidget(),
        )
      ],
    );
  }
}
