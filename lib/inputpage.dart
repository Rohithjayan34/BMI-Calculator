import 'reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';

const BottomHeightContainer=80.0;
const ActiveCardColor=Color(0xff1D1e33);
const InActiveCardColor=Color(0xff111328);
const BottomCardColor=Color(0xffeb1555);

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
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('BMI CALCULATOR'),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender=Gender.male;
                          });
                        },
                        child: ReusableCard(
                          colour: selectedGender==Gender.male?ActiveCardColor:InActiveCardColor,
                          cardChild: IconContent(icon: FontAwesomeIcons.mars,
                            label: 'MALE',),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender=Gender.female;
                          });
                        },
                        child: ReusableCard(
                          colour: selectedGender==Gender.female?ActiveCardColor:InActiveCardColor,
                          cardChild: IconContent(icon: FontAwesomeIcons.venus,
                            label: 'FEMALE'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(colour: ActiveCardColor),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(colour: ActiveCardColor),
                    ),
                    Expanded(
                        child: ReusableCard(colour: ActiveCardColor)
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                color: BottomCardColor,
                width: double.infinity,
                height: BottomHeightContainer,
              ),
            ],
          ),
        );
      }
    }

