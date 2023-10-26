//import 'dart:js_util';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:usersapp/global/global.dart';
import 'package:usersapp/models/menus.dart';
import 'package:usersapp/models/sellers.dart';
import 'package:usersapp/widgets/menus_design.dart';
import 'package:usersapp/widgets/my_drawer.dart';
import 'package:usersapp/widgets/progress_bar.dart';
import 'package:usersapp/widgets/text_widget_header.dart';


class MenusScreen extends StatefulWidget {

  final Sellers? model;
  MenusScreen({this.model});

  @override
  _MenusScreenState createState() => _MenusScreenState();
}


class _MenusScreenState extends State<MenusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.cyan,
                  Colors.amber,
                ],
                begin:  FractionalOffset(0.0, 0.0),
                end:  FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              )
          ),
        ),
        title: Text(
          "iFood",
          style: const TextStyle(fontSize: 45, fontFamily: "Signatra"),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: CustomScrollView(
        slivers: [
          //SliverPersistentHeaderDelegate(pinned: true, delegate: TextWidgetHeader(title: "My Menus")),
          SliverPersistentHeader(pinned: true, delegate: TextWidgetHeader(title: widget.model!.sellerName.toString() + " Menus")),

          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("sellers").
            doc(widget.model!.sellerUID).
            collection("menus").
          //  orderBy("publishedDate", descending: true).
            snapshots(),
            builder: (context, snapshot)
            {
              return !snapshot.hasData?
              //SliverToBoxAdapter(child: Center(child: circularProgress(),),) : StaggeredGrid.count(
              SliverToBoxAdapter(child: Center(child: circularProgress(),),) : SliverStaggeredGrid.countBuilder(
                crossAxisCount: 1,
                staggeredTileBuilder: (c) => StaggeredTile.fit(1),
                itemBuilder: (context, index)
                {
                  Menus model = Menus.fromJson(
                    snapshot.data!.docs[index].data()! as Map<String, dynamic>,
                  );
                  //design for displaying sellers-cafes-restaurants
                  return MenusDesignWidget(
                      model: model, context: context);
                },
                itemCount: snapshot.data!.docs.length,
              );
            },
          ),
        ],
      ),
    );
  }
}

