import 'package:flutter/material.dart';
import 'drawer.dart';

class LineupPage extends StatefulWidget {
  final int teamId;
  final bool admin;

  const LineupPage({required this.teamId, required this.admin});

  @override
  _LineupPageState createState() => _LineupPageState();
}

class _LineupPageState extends State<LineupPage> {  
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool admin = widget.admin;
    _textEditingController.text = """aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa  
    dsfsdfsd
    fsdfsdfdsfsdfsdsdfsdfdsdf
    dsafdsafasdf
    dasfdsfdf
    sadfasdfasdfsda
    fadsfsadfafsdaf
    dsfdsfsad fsdaf dsaf asdf
    adfs 
    ads f
    ds
    fsdf dsfsdf asdf 
     dsaf adsf
     
     
     
     
     
     fasdfsdf
     
     
     
     
     
     sdfsdfsda""";
    const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
 
    String dropdownValue = list.first;


    return Scaffold(
      appBar: AppBar(
        title: Text('Zgodovina prijav'),
      ),
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('TTTT'),
                  ]),
               ),
              ),
            ],
        ),
      ),
      endDrawer: CustomDrawer(),
    );
  }


}