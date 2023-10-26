import 'package:flutter/material.dart';
import 'package:usersapp/assistantMethods/assistant_methods.dart';
import 'package:usersapp/widgets/app_bar.dart';


class CartScreen extends StatefulWidget
{
  final String? sellerUID;
  CartScreen({this.sellerUID});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
{
  @override
  void initState() {
    super.initState();
    separateItemQuantities();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(sellerUID: widget.sellerUID),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 10,),
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton.extended(
                label: const Text("Clear cart",style: TextStyle(fontSize: 16),),
              backgroundColor: Colors.cyan,
              icon: const Icon(Icons.clear_all),
              onPressed: ()
              {

              },
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton.extended(
              label: const Text("Check Out",style: TextStyle(fontSize: 16),),
              backgroundColor: Colors.cyan,
              icon: const Icon(Icons.clear_all),
              onPressed: ()
              {

              },
            ),
          ),
        ],
      ),
    );
  }
}
