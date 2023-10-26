import 'package:flutter/material.dart';
import 'package:usersapp/models/items.dart';

class CartItemDesign extends StatefulWidget
{
  final Items? model;
  BuildContext? context;
  final List<int>? separateItemQuantitiesList;

  CartItemDesign({
    this.model,
    this.context,
    this.separateItemQuantitiesList,
});

  @override
  State<CartItemDesign> createState() => _CartItemDesignState();
}

class _CartItemDesignState extends State<CartItemDesign>
{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.cyan,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          height: 165,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [

              Image.network(widget.model!.thumbnailUrl!, width: 140,height: 120,),

              const SizedBox(width: 6,),

              //title
              //quantity number
              //price
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model!.title!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "Kiwi",
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  //quantity number x7
                  Row(
                    children: [
                      Text(
                        "x ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: "Acme",
                        ),
                      ),
                      Text(
                        widget.separateItemQuantitiesList.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: "Acme",
                        ),
                      ),
                    ],
                  ),

                  //price
                  Row(
                    children: [
                      const Text(
                        "Price: ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        "₹",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        widget.model!.price.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
