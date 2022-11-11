import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Explore.', style: TextStyle(
            fontSize: 24,
            fontFamily: 'tectonica', color: Colors.black
          ),),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.lightbulb_circle_sharp,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                // onChanged: (value) => _runFilter(value),
                onTap: () {

                },
                readOnly: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey,),
                  hintText: 'Search Country',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)
                  )
                )
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.language),
                          Text(' EN')
                        ],
                      ),
                    ),
                    onTap: () {

                    },
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.grey
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.filter_alt),
                          Text(' Filter')
                        ],
                      ),
                    ),
                    onTap: () {
                      
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
