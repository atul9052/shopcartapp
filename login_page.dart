import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopcartapp/ui/register.dart';

import 'home.dart';
class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formkey =GlobalKey<FormState>();
  TextEditingController _emailtextcontroller =TextEditingController();
  TextEditingController _passwordtextcontroller =TextEditingController();
  bool loading = false;
  bool islogedin=false;
  @override
  void initState() {
    super.initState();
    isSignedin();
  }
  void isSignedin() async{
    setState(() {
      loading = true;
    });
    await firebaseAuth.currentUser().then((user){
      if(user != null){
        setState(() => islogedin = true);
      }
    });
   // islogedin = await googleSignIn.isSignedIn();
    if(islogedin){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Shopapp()));
    }
    setState(() {
      loading=false;
    });
  }

 // Future handlesignin() async{
   // preferences = await SharedPreferences.getInstance();
    //setState(() {
      //loading=true;
    //});

  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
      ),
      body:  Stack(
        children: <Widget>[
Container(
  color: Colors.white,
  child: Center(
    child: Form(
        key: _formkey,
        child: Column(
      children: <Widget>[
        Material(
          borderRadius:  BorderRadius.circular(50.0),
          child: TextFormField(

            decoration: InputDecoration(
              hintText: "Email*",
            icon: Icon(Icons.email, ),
            border: OutlineInputBorder()),
            keyboardType: TextInputType.emailAddress,
            controller: _emailtextcontroller,
            validator: (value) {
              if (value.isEmpty) {
                Pattern pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regex = new RegExp(pattern);
                if (!regex.hasMatch(value))
                  return 'Please make sure your email address is valid';
                else
                  return null;
              }
            },
          ),
        ),
        Material(
          borderRadius:  BorderRadius.circular(20.0),
          child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: "Password*",
                icon: Icon(Icons.lock, ),
                border: OutlineInputBorder()),
            keyboardType: TextInputType.visiblePassword,
            controller: _passwordtextcontroller,
            validator: (value) {
              if (value.isEmpty) {
                return "The password feild cannot be empty";
              }else if(value.length < 6){
                return "the password has to be at least 6 char";
              }
              return null;
            },
          ),
        ),
        Material(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.red,
          elevation: 0.0,
          child: MaterialButton(onPressed: (){},
            minWidth: MediaQuery.of(context).size.width,
            child:Text("login",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
                ,fontSize: 16.0
            )),),
        ),
Text("Forgott password",style: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold
    ,fontSize: 16.0
)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
                  ,fontSize: 16.0
            ),
            children: [
              TextSpan(text: "Dont have an account? click here to"),
               ]
          ),),
        ),
        InkWell(
onTap: (){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
},

          child: Text("sign up"),
        )
      ],
    )),
  ),
),


        ],
      ),
    );
  }


}


