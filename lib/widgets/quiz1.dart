import "package:flutter/material.dart";

void main() {
  runApp(Anagrams());
}
class Anagrams extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anagrams',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnagramsPage(),
      debugShowCheckedModeBanner: false, 
    );
  }
}

class AnagramsPage extends StatefulWidget {
  @override
  _AnagramsPageState createState() => _AnagramsPageState();
}

class _AnagramsPageState extends State<AnagramsPage>{
  String message = "";
  TextEditingController _str1 = TextEditingController();
  TextEditingController _str2 = TextEditingController();
  String st1 = "";
  String st2 = "";

  @override
  void dispose() {
    _str1.dispose();
    _str2.dispose();
    super.dispose();
  }

  String _testanagrams(String text1, String text2) {    
    if(anagrams(text1 , text2)){
      message = "These two words are Anagram";
    }else{
      message = "These two words are NOT Anagram";
    }
    return message;
  }    
    
  bool anagrams(String str1,String str2){
    List<String> cleanstr1=str1.replaceAll(RegExp('[^A-Za-z]'),'').toLowerCase().split('')..sort();
    List<String> cleanstr2=str2.replaceAll(RegExp('[^A-Za-z]'),'').toLowerCase().split('')..sort();
    return cleanstr1.join('') == cleanstr2.join('');
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anagrams'),
        backgroundColor: Color.fromARGB(255, 63, 134, 188), 
      ),
      body: Padding(
           padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _str1,
              decoration: InputDecoration(
                labelText: 'Enter first word',
               ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _str2,
              decoration: InputDecoration(
                labelText: 'Enter second word',                
              ),
            ),
           SizedBox(height: 20),
            Expanded(
              child: Container( 
                alignment: Alignment.center,
                child: Text(message),
                ),
              ),            
           SizedBox(height: 20),
            ElevatedButton(
             onPressed: () {
                setState(() {
                  message = _testanagrams(_str1.text,_str2.text);
                });
              },
               style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 119, 188, 231), // Button background color
            ),
              child: Text("Check Anagrams"),             
            ),    
            SizedBox(height: 20),
             ElevatedButton(
             onPressed: () {
                Navigator.pop(context); // Navigate to the new page
              },
               style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 119, 188, 231), // Button background color
                ),
              child: Text("Back to Home"),
            ),
          ],
        ),
      ),
    );    
  }  
}
