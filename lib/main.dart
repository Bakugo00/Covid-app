import 'package:covidapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Covid 19',
        theme: ThemeData(
            scaffoldBackgroundColor: kBackgroundColor,
            fontFamily: "Poppins",
            textTheme: TextTheme(
              bodyText1: TextStyle(color: kBodyTextColor),
            )),
        home: homescreen());
  }
}

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  String? value1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: myclipper(),
              child: Container(
                padding: EdgeInsets.only(left: 40, top: 50, right: 20),
                height: 350,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xFF3383CD), Color(0xFF11249F)]),
                  image: DecorationImage(
                      image: AssetImage('assets/images/virus.png')),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset("assets/icons/menu.svg")),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/Drcorona.svg",
                          alignment: Alignment.topCenter,
                          fit: BoxFit.fitWidth,
                          width: 230,
                        ),
                        Positioned(
                          child: Text(
                            'All you need \nis stay home',
                            style:
                                kHeadingTextStyle.copyWith(color: Colors.white),
                          ),
                          top: 20,
                          left: 150,
                        ),
                        Container(),
                      ],
                    )),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Color(0xFFE5E5E5))),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: DropdownButton(
                        isExpanded: true,
                        underline: SizedBox(),
                        icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                        value: value1,
                        items: [
                          'Indonesia',
                          'Bangladesh',
                          'United States',
                          'Japan'
                        ].map<DropdownMenuItem<String>>((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newvalue) {
                          setState(() {
                            value1 = newvalue!;
                          });
                        }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(children: [
                Row(
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Case update\n",
                          style: kTitleTextstyle,
                        ),
                        TextSpan(
                            text: "newest update march 28",
                            style: TextStyle(color: kTextLightColor))
                      ]),
                    ),
                    Spacer(),
                    Text(
                      "See detailes",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 30,
                        color: kShadowColor,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      counter(
                        color: kInfectedColor,
                        number: 1046,
                        title: "Infected",
                      ),
                      counter(
                        color: kDeathColor,
                        number: 87,
                        title: "Deaths",
                      ),
                      counter(
                        color: kRecovercolor,
                        number: 46,
                        title: "Recovered",
                      ),
                    ],
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Spread of Virus",
                    style: kTitleTextstyle,
                  ),
                  Text(
                    "See details",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(20),
              height: 178,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 30,
                    color: kShadowColor,
                  ),
                ],
              ),
              child: Image.asset(
                "assets/images/map.png",
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class counter extends StatelessWidget {
  final String title;
  final Color color;
  final int number;
  const counter({
    Key? key,
    required this.title,
    required this.color,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: color,
                width: 2,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "$number",
          style: TextStyle(
            fontSize: 40,
            color: color,
          ),
        ),
        Text(title, style: kSubTextStyle),
      ],
    );
  }
}

class myclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
