
import 'package:animalicu/auth/service/user_provider.dart';
import 'package:animalicu/dashboard/screen/dashboard.dart';
import 'package:animalicu/dashboard/widget/complaint.dart';
import 'package:animalicu/profile/screens/personal_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../auth/service/auth_service.dart';


class ProfileScreen extends StatefulWidget{
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen>{


  @override
  Widget build(BuildContext context){
    final user = Provider.of<UserProvider>(context).user;
    final size = MediaQuery
        .of(context)
        .size;
    var ProfileInfo = Expanded(
      child: Column(
        children: [
          Container(
            height: size.height/8,
            width: size.width/4,
            child: Stack(
              children :<Widget>[
                CircleAvatar(
                  radius:50,
                  backgroundImage: AssetImage("assets/jpeg/register.jpeg") , backgroundColor: Colors.white,
                ),

              ],
            ),
          ),
          SizedBox(height: 20,),
          Text(user.name , style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
          SizedBox(height: 2,),
          Text(user.type , style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey)),
          SizedBox(height: 20,),


        ],
      ),
    );
    /*
    var themeSwitcher = ThemeSwitcher(builder: (context){
      return AnimatedCrossFade(
        duration: Duration(milliseconds: 200),
        crossFadeState: ThemeProvider.of(context).brightness == Brightness.dark
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        firstChild: GestureDetector(
          onTap: () =>
              ThemeSwitcher.of(context).changeTheme(theme: kLightTheme),
          child: Icon(
            LineAwesomeIcons.sun,
            size: 30,
          ),
        ),
        secondChild:GestureDetector(
          onTap: ()=>
              ThemeSwitcher.of(context).changeTheme(theme: kDarkTheme),
          child: Icon(
            LineAwesomeIcons.moon,
            size: 30,
          ),
        ),
      );
    });
    */
    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Icon(Icons.arrow_circle_left_outlined,
            size: 30, color: Colors.indigo[900],
          ),
        ),
        ProfileInfo,
      ],
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height:size.height/20,),
          Padding(
              padding: const EdgeInsets.only(left: 30 , right: 30 ,top: 8 ),
              child: header
          ),
          Expanded(child: ListView(
            children: <Widget>[
              GestureDetector(
                  child: ProfileListItem(
                    icon: Icons.person,
                    text: 'User Details',
                  ),
                  onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Personal_Details()),
                  );}
              ),
              GestureDetector(
                onTap: (){Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ComplaintEmail()),
                );},
                child: ProfileListItem(
                  icon: Icons.border_color_outlined,
                  text: 'Complaint',
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: ProfileListItem(
                    icon: Icons.privacy_tip_outlined,
                    text: 'Privacy Policy'
                ),
              ),
              GestureDetector(
                child: ProfileListItem(
                  icon: Icons.follow_the_signs,
                  text: 'Logout',
                ),
                onTap:() => AuthService().logOut(context),
              ),

            ],
          ))
        ],
      ),
    );

  }

}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final text;
  final bool hasNavigaton;

  const ProfileListItem({
    required this.icon,
    this.text,
    this.hasNavigaton=true ,
  });

  @override
  Widget build(BuildContext context){
    return Container(
      height: 55,
      margin: EdgeInsets.symmetric(
        horizontal: 40,
      ).copyWith(bottom: 20),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            //Color.fromARGB(255, 81, 177, 241),
            Colors.indigo[900]!,
            Colors.indigo
          ],
        ),

      ),
      child: Row(
        children: <Widget>[
          Icon(this.icon, size: 25,color: Colors.white,),
          SizedBox(width: 25,),
          Text(this.text,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold , color: Colors.white),
          ),
          Spacer(),
          if(this.hasNavigaton)
            Icon(
              Icons.arrow_circle_right,
              size: 25,
              color: Colors.white,
            )
        ],
      ),
    );
  }
}