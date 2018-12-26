import 'package:flutter/cupertino.dart';
import 'package:inkino/assets.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {


 String _userName = "赵尖矢";
 String _department = "中原地产";
 String _userId = "YD745";


Widget _buildTopSection()
{
  return Row(children: <Widget>[
    Expanded(child: _buildUserNameSection())
    ,Expanded(child: _buildUserIDSection())

  ],);
}

Widget _buildBottomSection()
{
  return Container();
}



Widget _buildUserNameSection()
{
  return IconTextWidthLine(_userName,ImageAssets.userPageName);
}

Widget _buildUserIDSection()
{
   return Row(children: <Widget>[
                Expanded(child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                 Expanded( flex: 1, child: Container( color: Colors.redAccent, child: Image.asset(ImageAssets.userPageID,
            fit: BoxFit.scaleDown,)
           )),
           Expanded(flex: 2,  child: Column(
             children: <Widget>[
               Expanded(flex: 2, child: Container(
               child: Text(_userId,textAlign: TextAlign.center, style: TextStyle(fontSize: 14),))),  
                Expanded(flex: 1, child: Container( child: Image.asset(ImageAssets.userPageLine,width: 75,
            fit: BoxFit.fitWidth,
           ),) )          
             ],
           ),)
                ],) ,
                )),                
              ],);
}

Widget _buildUserDepartSection()
{
  return Row(children: <Widget>[
                Expanded(child: Container(
                child: Row(children: <Widget>[
                 Expanded(child: Container( padding: EdgeInsets.all(3), child: Image.asset(ImageAssets.userPageDepartment,
            fit: BoxFit.scaleDown)
           )),Expanded(child: Column(
             children: <Widget>[
               Expanded(flex: 5, child:Text(_userName,style: TextStyle(fontSize: 15),)),
               Expanded(flex: 1, child: Container( child: Image.asset(ImageAssets.userPageLine,
            fit: BoxFit.scaleDown,
           ),) )
             ],
           ),)
                ],) ,
                )),
                                
              ],);
}

Widget _buildLogoutSection()
{
  return Container();
}

    Widget _buildBG( String iconName)
    {
      return  Center(child: Image.asset(
      iconName,
      fit: BoxFit.fitWidth));
    }
  @override
  Widget build(BuildContext context) {
    return 
      Container(
        padding: EdgeInsets.fromLTRB(0,25, 0, 10),
          child: Column(children: <Widget>[
            Expanded(child:    
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
              Image.asset(ImageAssets.userPageBigBG,
            fit: BoxFit.fill,
            width: 370,),
            Container(padding: EdgeInsets.fromLTRB(5, 5, 0, 5), 
            child: 
            Stack(
            alignment: AlignmentDirectional.center,  
            children: <Widget>[
            Image.asset(ImageAssets.userPageSmallBG,
            fit: BoxFit.fill,
            width: 350,),
            Container(
            padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
            
            child:             
             Column(      
              mainAxisAlignment: MainAxisAlignment.start,  
              crossAxisAlignment: CrossAxisAlignment.start,        
              children: <Widget>[ 
              Expanded(child: _buildTopSection(),),
              Expanded(child: _buildBottomSection(),),
            ],))
            ],) ) 
              ],
            )                  
            )
          ],),  
    );
  }
}

class IconTextWidthLine extends StatelessWidget {

  final String titleContent;
  final String titleBgIconName;

  IconTextWidthLine(this.titleContent,this.titleBgIconName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(child: Image.asset(titleBgIconName,
            fit: BoxFit.fill,)),
            Expanded(child: Text(titleContent))
        ],
      ),
    );
  }
}



class ImageChild extends StatelessWidget 
{
  final String _iconName;
  final Widget _child;
  ImageChild(this._iconName,this._child);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Expanded(child:  Image.asset(ImageAssets.userPageBigBG,
            fit: BoxFit.fill)),
            Expanded(child: _child,)
        ],
      ),
    );
  }
}

