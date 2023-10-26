import 'package:flutter/material.dart';
import 'package:usersapp/mainScreens/item_detail_screen.dart';
import 'package:usersapp/models/items.dart';
import 'package:usersapp/models/sellers.dart';

class ItemsDesignWidget extends StatefulWidget
{
  Items? model;
  BuildContext? context;

  ItemsDesignWidget({this.model, this.context});
  @override
  State<ItemsDesignWidget> createState() => _InfoDesignWidgetState();
}


class _InfoDesignWidgetState extends State<ItemsDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=>ItemDetailsScreen(model: widget.model)));
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
                  widget.model!.title!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontFamily: "Train",
                  ),
                ),
                Text(
                  widget.model!.shortInfo!,
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
