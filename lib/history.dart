import 'package:flutter/material.dart';
import 'drawer.dart';

class HistoryPage extends StatefulWidget {
  final int teamId;
  final bool admin;

  const HistoryPage({required this.teamId, required this.admin});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {  
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
            Visibility(
              visible: admin,
              child: DropdownMenu<String>(
                initialSelection: list.first,
                onSelected: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                  });
                },
              dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
              )
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextField(
                        controller: _textEditingController,
                        maxLines: null,
                        enabled: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                       ),
                    ),
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