
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/database/moor_database.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'injection_container.dart';

//import 'package:bottom_navigation_bar/home_screen.dart';

class favouritesPage extends StatefulWidget {
  @override
  _favouritesPageState createState() => _favouritesPageState();
}

class _favouritesPageState extends State<favouritesPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favorites'),
          backgroundColor: Color(0xff669db2),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: _buildFavList(context)),
//            NewFavInput(),
          ],
        ));
  }

  StreamBuilder<List<Fav>> _buildFavList(BuildContext context) {
    var database=sl<AppDatabase>();
    database = Provider.of<AppDatabase>(context);
    return StreamBuilder(
      stream: database.watchAllFavs(),
      builder: (context, AsyncSnapshot<List<Fav>> snapshot) {
        final favs = snapshot.data ?? List();

        return ListView.builder(
          itemCount: favs.length,
          itemBuilder: (_, index) {
            final itemFav = favs[index];
            return _buildListItem(itemFav, database);
          },
        );
      },
    );
  }

  Widget _buildListItem(Fav itemFav, AppDatabase database) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => database.deleteFav(itemFav),
        )
      ],
      child: ExpansionTile(
        title: Text(itemFav.bank.BANK,style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(itemFav.bank.BRANCH),
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text("Address",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(itemFav.bank.ADDRESS,textAlign: TextAlign.center,),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("City",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(itemFav.bank.CITY,textAlign: TextAlign.center,),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("State",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(itemFav.bank.STATE,textAlign: TextAlign.center,),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("RTGS",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(itemFav.bank.RTGS.toString(),textAlign: TextAlign.center,),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("District",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(itemFav.bank.DISTRICT.toString(),textAlign: TextAlign.center,),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("NEFT",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(itemFav.bank.NEFT.toString(),textAlign: TextAlign.center,),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("UPI",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(itemFav.bank.UPI.toString(),textAlign: TextAlign.center,),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("Contact",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(itemFav.bank.CONTACT,textAlign: TextAlign.center,),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("MICR CODE",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(itemFav.bank.MICRCODE.toString(),textAlign: TextAlign.center,),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("IMPS",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(itemFav.bank.IMPS.toString(),textAlign: TextAlign.center,),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("Bank Code",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(itemFav.bank.BANKCODE.toString(),textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}