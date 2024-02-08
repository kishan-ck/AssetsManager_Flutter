import 'package:dynamicutils/dynamic_size.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

class AppString {
  static const String inventoryEnquiry = "Inventory Enquiry";

}

DynamicSize size = DynamicSize(849, 393);

printData(String msg) {
  if (kDebugMode) {
    print(msg);
  }
}
