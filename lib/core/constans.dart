import 'package:ecomerce/core/shared/local/cache_helper.dart';
import 'package:flutter/cupertino.dart';

class Constans {
 static  Size getSize(BuildContext context)=> MediaQuery.sizeOf(context);

}

var onBoarding = CacheHelper.getDate(key: "onBoarding");
var token = CacheHelper.getDate(key: "token");