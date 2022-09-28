import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class QuantityController with ChangeNotifier{
  int newQuantity;
  int oldQuantity;

  QuantityController({required this.newQuantity,required this.oldQuantity});
  int plusQuan(newQuantity,oldQuantity){
    return newQuantity+oldQuantity;
    notifyListeners();
  }

  int minusQuan(newQuantity,oldQuantity){
    return oldQuantity-newQuantity;
    notifyListeners();
  }




}