import 'package:flutter/material.dart';
import 'package:usersapp/mainScreens/items_screen.dart';
import 'package:usersapp/models/menus.dart';
import 'package:usersapp/models/sellers.dart';

class MenusDesignWidget extends StatefulWidget
{
  Menus? model;
  BuildContext? context;

  MenusDesignWidget({this.model, this.context});
  @override
  State<MenusDesignWidget> createState() => _InfoDesignWidgetState();
}


class _InfoDesignWidgetState extends State<MenusDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> ItemsScreen(model: widget.model)));
      },
      splashColor: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
            height: 280,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Divider(
                  height: 4,
                  thickness: 3,
                  color: Colors.grey[300],
                ),
                Image.network(
                  widget.model!.thumbnailUrl!,
                  height: 210.0,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 1.0,),
                Text(
                  widget.model!.menuTitle!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontFamily: "Train",
                  ),
                ),
                Text(
                  widget.model!.menuInfo!,
                  style: const TextStyle(
                    color: Colors.cyan,
                    fontSize: 12,
                  ),
                ),
                Divider(
                  height: 4,
                  thickness: 3,
                  color: Colors.grey[300],
                ),
              ],
            )
        ),
      ),
    );
  }
}
