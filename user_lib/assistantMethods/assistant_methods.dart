import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:usersapp/assistantMethods/car_Item_counter.dart';
import 'package:usersapp/global/global.dart';


separateItemIDs()
{
  List<String> separateItemIDsList=[], defaultItemList=[];
  int i=0;
  
  
  defaultItemList = sharedPreferences!.getStringList("userCart")!;

  for(i; i<defaultItemList.length; i++)
    {
      //56551111:5
      String item = defaultItemList[i].toString();
      var pos = item.lastIndexOf(":");
      //56551111
      String getItemId = (pos != -1) ? item.substring(0, pos) : item;

      print("\nThis is itemID now = " + getItemId);
      
      separateItemIDsList.add(getItemId);
    }

  print("\nThis is Items list now = ");
  print(separateItemIDsList);

  return separateItemIDsList;

}


addItemToCart(String? foodItemId , BuildContext context , int itemCounter)
{
  List<String>? tempList = sharedPreferences!.getStringList("userCart");
  tempList!.add(foodItemId! + ":$itemCounter");

  FirebaseFirestore.instance.collection("users")
      .doc(firebaseAuth.currentUser!.uid).update({
    "userCart": tempList,
  }).then((value)
  {
  Fluttertoast.showToast(msg: "Item Added Successfully.");

    sharedPreferences!.setStringList("userCart", tempList);

    //update the badge
    Provider.of<CartItemCounter>(context, listen: false).displayCartListItemsNumber();
  });

}



separateItemQuantities()
{
  List<int> separateItemQuantityList=[];
  List<String> defaultItemList=[];
  int i=1;


  defaultItemList = sharedPreferences!.getStringList("userCart")!;

  for(i; i<defaultItemList.length; i++)
  {
    //56551111:5
    String item = defaultItemList[i].toString();

    //5
    List<String> listItemCharacters = item.split(":").toList();
    var quantityNumber = int.parse(listItemCharacters[i].toString());
    print("\nThis is Quantity number = " + quantityNumber.toString());

    separateItemQuantityList.add(quantityNumber);
  }

  print("\nThis is Items quantity list now = ");
  print(separateItemQuantityList);

  return separateItemQuantityList;

}