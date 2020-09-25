import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:testapp/injection_container.dart';
import 'data/post_api_service.dart';
import 'database/moor_database.dart';
import 'models/bank.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController myController = new TextEditingController();
  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Bank Search'),
            backgroundColor: Color(0xff669db2)
        ),
        body: Column(
          children: [
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        hintText: "Enter IFSC Code",
                        hintStyle: TextStyle(color: Color(0xff669db2)),
                        fillColor: Colors.white),
                    controller: myController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    backgroundColor: Color(0xff669db2),
                    onPressed: () async {
                      title=myController.text;

                      setState(() =>

                          _buildBody(context));
                    },
                    child: Icon(Icons.search,color:Color(0xffa99c94) ,),
                  ),
                ),

              ],
            ),
            Center(child:Text("Swipe the bank card to add it to your favourites") ,),
            _buildBody(context)
          ],
        )
    );
  }

  FutureBuilder<Response> _buildBody(BuildContext context) {

    var api = Provider.of<PostApiService>(context).getPost(title);
    myController.clear();
    return FutureBuilder<Response>(
      future: api,
      builder: (context, snapshot) {
       if (title == null) return Container();
       if (title == "") return Container(child: Text("Field can't be empty"),);
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == null) {
            return Container(child:  Text("No banks found!",),);
          }
          var _bank = sl<Bank>();
          _bank = Bank.fromJson(json.decode(snapshot.data.bodyString));

          return _buildBanks(context, _bank);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  static Slidable _buildBanks(BuildContext context, Bank _bank) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: ExpansionTile(
        title: Text(_bank.BANK, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(_bank.BRANCH),
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text("Address", textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(_bank.ADDRESS, textAlign: TextAlign.center,),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("City", textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(_bank.CITY, textAlign: TextAlign.center,),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("State", textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(_bank.STATE, textAlign: TextAlign.center,),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("RTGS", textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(_bank.RTGS.toString(), textAlign: TextAlign.center,),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("District", textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              _bank.DISTRICT.toString(), textAlign: TextAlign.center,),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("NEFT", textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(_bank.NEFT.toString(), textAlign: TextAlign.center,),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("UPI", textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(_bank.UPI.toString(), textAlign: TextAlign.center,),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("Contact", textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(_bank.CONTACT, textAlign: TextAlign.center,),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("MICR CODE", textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              _bank.MICRCODE.toString(), textAlign: TextAlign.center,),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("IMPS", textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(_bank.IMPS.toString(), textAlign: TextAlign.center,),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("Bank Code", textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              _bank.BANKCODE.toString(), textAlign: TextAlign.center,),
          ),
        ],
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Fav',
          color: Color(0xff669db2),
          icon: Icons.star,
          onTap: () {
            var database = sl<AppDatabase>();
            database = Provider.of<AppDatabase>(context);
            final fav = Fav(
              bank: _bank,
            );
            print("fav");
            print(fav);
            database.insertFav(fav);
            /*Add to Favorites*/
          },
        ),
      ],
    );
  }

}