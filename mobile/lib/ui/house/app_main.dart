import 'package:flutter/material.dart';
import 'package:inkino/assets.dart';
import 'package:inkino/ui/house/user_page.dart';
import 'app_page.dart';



class AppMainPage extends StatelessWidget {
  const AppMainPage();

  @override
  Widget build(BuildContext context) {
    return Container(child: Stack(
      fit: StackFit.expand,
      children: <Widget>[
       _buildBg(),
       Container(child: Column(children: <Widget>[
       Expanded(flex: 1,  child: UserPage(),),
       Expanded(flex:  6, child: AppPage(),)
     ],),)
    ],),);
  } 

    Widget _buildBg()
    {
      return
      Image.asset(
          ImageAssets.backgroundImage,
          fit: BoxFit.cover);
    }


}
