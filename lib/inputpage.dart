import 'package:bmi_calculator/results_page.dart';

import 'reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'constants.dart';

enum Gender {
  male,
  female,
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height =180;
  int weight=60;
  int age=20;
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('BMI CALCULATOR'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        onPress: (){
                          setState(() {
                            selectedGender=Gender.male;
                          });
                        },
                        colour: selectedGender==Gender.male?kActiveCardColor:kInActiveCardColor,
                        cardChild: IconContent(icon: FontAwesomeIcons.mars,
                          label: 'MALE',),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: (){
                          setState(() {
                            selectedGender=Gender.female;
                          });
                        },
                        colour: selectedGender==Gender.female?kActiveCardColor:kInActiveCardColor,
                        cardChild: IconContent(icon: FontAwesomeIcons.venus,
                          label: 'FEMALE'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text('cm',
                         style: kLabelTextStyle,

                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xff8d8e98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xffeb1555),
                          overlayColor: Color(0x29eb1555),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),


                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,


                          onChanged: (double value)
                        {
                          setState(() {
                            height=value.round();
                          });

                        },



                        ),
                      )
                    ],
                  ),
                    colour: kActiveCardColor),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('WEIGHT',style: kLabelTextStyle,),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIcon(
                                    icon: FontAwesomeIcons.minus,
                                  onPress: (){
                                      setState(() {
                                        weight--;
                                      });
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIcon(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                          colour: kActiveCardColor),
                    ),
                    Expanded(
                        child: ReusableCard(
                          cardChild:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                           Text('AGE',style: kLabelTextStyle,),
                           Text(
                             age.toString(),
                                style: kNumberTextStyle,),
                             Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIcon(
                           icon: FontAwesomeIcons.minus,
                             onPress: (){
                             setState(() {
                              age--;
                                   });
                                },
                              ),
                               SizedBox(
                               width: 10.0,
                              ),
                              RoundIcon(
                             icon: FontAwesomeIcons.plus,
                             onPress: (){
                              setState(() {
                               age++;
        });
        },
        ),
        ],
        ),
        ],
        ),

                            colour: kActiveCardColor)
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResultsPage()),
                    );
                  });
                },
                child: Container(
                  child: Center(child: Text('CALCULATE',style: kBottomTextStyle)),
                  margin: EdgeInsets.only(top: 10.0),
                  color: kBottomCardColor,
                  width: double.infinity,
                  height: kBottomHeightContainer,
                ),
              ),
            ],
          ),
        );
      }
    }

class RoundIcon extends StatelessWidget {

  RoundIcon({@required this.icon,@required this.onPress});

  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 2.0,
      onPressed:onPress,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}
