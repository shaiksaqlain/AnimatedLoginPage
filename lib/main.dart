import 'package:flutter/material.dart';

void main() => runApp(new Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LoginPage",
      home: Myhome(),
    );
  }
}

class Myhome extends StatefulWidget {
  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> with SingleTickerProviderStateMixin {
  AnimationController iconanimationController;
  Animation<double> iconanimation;
  @override
  void initState() {
    super.initState();
    iconanimationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    iconanimation = new CurvedAnimation(
        parent: iconanimationController, curve: Curves.easeIn);
    iconanimation.addListener(() => this.setState(() {}));
    iconanimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage('images/saqlain.jpg'),
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
            fit: BoxFit.cover,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlutterLogo(size: iconanimation.value * 100),
                Form(
                    child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.teal,
                    brightness: Brightness.dark,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Enter Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Enter password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        MaterialButton(
                            color: Colors.teal,
                            textColor: Colors.white,
                            child: Icon(Icons.arrow_forward),
                            onPressed: () => {}),
                      ],
                    ),
                  ),
                )),
              ])
        ],
      ),
    );
  }
}
