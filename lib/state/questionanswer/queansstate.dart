import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final queAnsState = ChangeNotifierProvider.autoDispose<QueAnsState>((ref) {
  return QueAnsState();
});

class QueAnsState extends ChangeNotifier {
  List question = [
    {
      "id": 1,
      "index": 1,
      "que":
          "Near a pedestrian crossing, when the pedestrians are waiting to cross the road,  you should",
      "opt": [
        "Sound horn and proceed",
        "Slow down, sound horn and pass",
        "Stop the vehicle and wait till the pedestrians cross the road and then proceed"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 2,
      "que": "The following sign represents..",
      "opt": ["Stop", "No parking", "Hospital ahead"],
      "ra": 0,
      "img": "assest/images/que/image001.png",
      "point": 1
    },
    {
      "id": 3,
      "index": 2,
      "que":
          "You are approaching a narrow bridge,  another vehicle is about to enter the bridge from opposite side you should",
      "opt": [
        "Increase the speed and try to cross the bridge as  fast as possible",
        "Put on the head light and pass the bridge",
        "Wait till the other vehicle crosses the bridge and then proceed"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 4,
      "que": "The following sign represents..",
      "opt": [
        "Keep left",
        "There is no road to the left",
        "Compulsory turn left"
      ],
      "ra": 2,
      "img": "assest/images/que/image003.png",
      "point": 1
    },
    {
      "id": 5,
      "index": 3,
      "que":
          "When a vehicle is involved in an accident causinginjury to any person",
      "opt": [
        "Take the vehicle to the nearest police station and report the accident",
        "Stop the vehicle and report to the police  station",
        "Take all reasonable steps to secure medical attention to the injured and report to the nearestpolice station within 24 hours"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 6,
      "que": "The following sign represents...",
      "opt": ["Give way", "Hospital ahead", "Traffic island ahead"],
      "ra": 0,
      "img": "assest/images/que/image005.png",
      "point": 1
    },
    {
      "id": 7,
      "index": 4,
      "que": "On a road designated as one way",
      "opt": [
        "Parking is prohibited",
        "Overtaking is prohibited",
        "Should not drive in reverse gear"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 8,
      "que": "The following sign represents..",
      "opt": ["No entry", "One way", "Speed limit ends"],
      "ra": 1,
      "img": "assest/images/que/image007.png",
      "point": 1
    },
    {
      "id": 9,
      "index": 5,
      "que": "You can overtake a vehicle in front",
      "opt": [
        "Through the right side of that vehicle",
        "Through the left side",
        "Through the left side, if the road is wide"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 10,
      "que": "The following sign represents..",
      "opt": [
        "Right turn prohibited",
        "Sharp curve to the right",
        "U-turn prohibited"
      ],
      "ra": 2,
      "img": "assest/images/que/image009.png",
      "point": 1
    },
    {
      "id": 11,
      "index": 6,
      "que":
          "When a vehicle approaches an unguarded railway level crossing, before crossing it, the driver shall",
      "opt": [
        "Stop the vehicle on the left side of the road,   get down from the vehicle, go to the railway track, and ensure that no train or trolley is coming from either side",
        "Sound horn and cross the track as fast as  possible",
        "Wait till the train passes"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 12,
      "que": "The following sign represents..",
      "opt": [
        "Pedestrian crossing",
        "Pedestrians may enter",
        "Pedestrians prohibited"
      ],
      "ra": 0,
      "img": "assest/images/que/image011.png",
      "point": 1
    },
    {
      "id": 13,
      "index": 7,
      "que": "How can you distinguish a transport vehicle.",
      "opt": [
        "By looking at the tyre size.",
        "By colour of the vehicle.",
        "By looking at the number plate of the vehicle."
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 14,
      "que": "The following sign represents..",
      "opt": [
        "Keep right side",
        "Parking on the right allowed",
        "Compulsory turn to right"
      ],
      "ra": 1,
      "img": "assest/images/que/image013.png",
      "point": 1
    },
    {
      "id": 15,
      "index": 8,
      "que": "Validity of learners licence",
      "opt": ["Till the driving licence is obtained", "6 months", "30 days"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 16,
      "que": "The following sign represents..",
      "opt": [
        "U- Turn prohibited",
        "Right turn prohibited",
        "Overtaking through left prohibited"
      ],
      "ra": 1,
      "img": "assest/images/que/image015.png",
      "point": 1
    },
    {
      "id": 17,
      "index": 9,
      "que": "In a road without footpath, the pedestrians",
      "opt": [
        "Should walk on the left side of the road",
        "Should walk on the right side of the road",
        "May walk on either side of the road"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 18,
      "que": "The following sign represents..",
      "opt": ["Horn prohibited", "Compulsory sound horn", "May sound horn"],
      "ra": 0,
      "img": "assest/images/que/image017.png",
      "point": 1
    },
    {
      "id": 19,
      "index": 10,
      "que": "Free passage should be given to the following types of vehicles",
      "opt": [
        "Police vehicles.",
        "Ambulance and fire service vehicles",
        "Express, Super Express buses"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 20,
      "que": "The following sign represents..",
      "opt": [
        "Roads on both sides in front",
        "Narrow bridge ahead",
        "Narrow road ahead"
      ],
      "ra": 1,
      "img": "assest/images/que/image019.png",
      "point": 1
    },
    {
      "id": 21,
      "index": 11,
      "que":
          "Vehicles proceeding from opposite direction should be allowed to pass through \u2026.",
      "opt": ["Your right side", "Your left side", "The convenient side"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 22,
      "que": "The following sign represents..",
      "opt": ["First aid post", "Resting place", "Hospital"],
      "ra": 2,
      "img": "assest/images/que/image021.png",
      "point": 1
    },
    {
      "id": 23,
      "index": 12,
      "que": "Driver of a vehicle may overtake \u2026",
      "opt": [
        "while driving down hill",
        "If the road is sufficiently wide",
        "When the driver of the vehicle in front shows the signal to overtake"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 24,
      "que": "The following sign represents..",
      "opt": ["First aid post", "Resting place", "Hospital"],
      "ra": 0,
      "img": "assest/images/que/image023.png",
      "point": 1
    },
    {
      "id": 25,
      "index": 13,
      "que": "Driver of a motor vehicle shall drive through",
      "opt": [
        "The right side of the road",
        "The left side of the road",
        "The Center of the road"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 26,
      "que": "The following sign represents..",
      "opt": ["Hospital", "Resting place", "First aid post"],
      "ra": 1,
      "img": "assest/images/que/image025.png",
      "point": 1
    },
    {
      "id": 27,
      "index": 14,
      "que": "When a Vehicle is parked on the road side during night",
      "opt": [
        "The vehicle should be locked",
        "The person having licence to drive such a vehicle should be in  the drivers seat",
        "The park light shall remain lit"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 28,
      "que": "The following sign represents..",
      "opt": ["Road closed", "No parking", "End of speed restriction"],
      "ra": 2,
      "img": "assest/images/que/image027.png",
      "point": 1
    },
    {
      "id": 29,
      "index": 15,
      "que": "Fog lamps are used",
      "opt": [
        "During night.",
        "When there is mist.",
        "When the opposite vehicle is not using dim light"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 30,
      "que": "The following sign represents..",
      "opt": [
        "Narrow road ahead",
        "Narrow bridge ahead",
        "Roads on both sides ahead"
      ],
      "ra": 0,
      "img": "assest/images/que/image029.png",
      "point": 1
    },
    {
      "id": 31,
      "index": 16,
      "que": "Zebra lines are meant for..",
      "opt": [
        "stopping vehicle.",
        "pedestrians crossing",
        "for giving preference to vehicle"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 32,
      "que": "The following sign represents..",
      "opt": [
        "Railway station near",
        "Level crossing unguarded",
        "Level crossing Guarded"
      ],
      "ra": 1,
      "img": "assest/images/que/image031.png",
      "point": 1
    },
    {
      "id": 33,
      "que": "When an ambulance is approaching ..",
      "opt": [
        "allow passage if there are no vehicles from front  side.",
        "no preference need be given.",
        "the driver shall allow free passage by drawing to the side of the road"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 34,
      "que": "The following sign represents..",
      "opt": [
        "Entry through right side prohibited",
        "Entry through left prohibited",
        "Overtaking prohibited"
      ],
      "ra": 2,
      "img": "assest/images/que/image033.png",
      "point": 1
    },
    {
      "id": 35,
      "que": "Red traffic light indicates ..",
      "opt": [
        "vehicle can proceed with caution.",
        "stop the vehicle.",
        "slow down."
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 36,
      "que": "The following sign represents..",
      "opt": ["Cross road", "No entry", "Hospital"],
      "ra": 0,
      "img": "assest/images/que/image035.png",
      "point": 1
    },
    {
      "id": 37,
      "que": "Parking a vehicle in front of entrance to hospital",
      "opt": [
        "Proper",
        "Improper",
        "Proper if   NO PARKING sign is not provided"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 38,
      "que": "The following sign represents..",
      "opt": ["Restriction ends", "No entry", "No overtaking"],
      "ra": 1,
      "img": "assest/images/que/image037.png",
      "point": 1
    },
    {
      "id": 39,
      "que":
          "Where the slippery road sign is seen on the road, the driver shall",
      "opt": [
        "reduce the speed by changing the gear",
        "apply brake",
        "proceed in the same speed"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 40,
      "que": "The following sign represents..",
      "opt": [
        "May turn to left",
        "Compulsory go ahead or turn left",
        "Side road left"
      ],
      "ra": 2,
      "img": "assest/images/que/image039.png",
      "point": 1
    },
    {
      "id": 41,
      "que": "Overtaking is prohibited in following   circumstances",
      "opt": [
        "when it is likely to cause inconvenience or danger to other traffic",
        "when the vehicle in front is reducing speed",
        "during night"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 42,
      "que": "The following sign represents..",
      "opt": [
        "Sound horn compulsory",
        "Sound horn continuously",
        "Horn prohibited"
      ],
      "ra": 0,
      "img": "assest/images/que/image041.png",
      "point": 1
    },
    {
      "id": 43,
      "que": "Overtaking when approaching a bend",
      "opt": ["is permissible", "not permissible", "is permissible with care"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 44,
      "que": "The following sign represents..",
      "opt": [
        "Road to the right in front",
        "Compulsory turn right",
        "Turn to right prohibited"
      ],
      "ra": 1,
      "img": "assest/images/que/image043.png",
      "point": 1
    },
    {
      "id": 45,
      "que": "Drunken driving",
      "opt": [
        "allowed in private vehicles",
        "allowed during night time",
        "prohibited in all vehicles."
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 46,
      "que": "The following sign represents..",
      "opt": ["End of restriction", "Do not stop", "No parking"],
      "ra": 2,
      "img": "assest/images/que/image045.png",
      "point": 1
    },
    {
      "id": 47,
      "que": "Use of horn prohibited",
      "opt": [
        "Mosque, Church and Temple",
        "Near Hospital, Courts of Law",
        "Near Police Station"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 48,
      "que": "The sign represents",
      "opt": ["Go straight", "One-way", "Prohibited in both direction"],
      "ra": 1,
      "img": "assest/images/que/image047.png",
      "point": 1
    },
    {
      "id": 49,
      "que": "Rear view mirror is used",
      "opt": [
        "for seeing face",
        "for watching the traffic approaching from behind",
        "for seeing the back seat passenger"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 50,
      "que": "The sign represents",
      "opt": [
        "No entry for motor vehicles",
        "No entry for cars and motor cycles",
        "Entry allowed for cars and motor vehicles"
      ],
      "ra": 1,
      "img": "assest/images/que/image049.png",
      "point": 1
    },
    {
      "id": 51,
      "que": "Boarding in and alighting from a vehicle while in motion",
      "opt": [
        "Permitted in bus",
        "permitted in autorikshaw",
        "prohibited in all vehicles"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 52,
      "que": "The sign represents",
      "opt": [
        "Trucks Prohibited",
        "Bus Prohibited",
        "Heavy vehicles Prohibited"
      ],
      "ra": 0,
      "img": "assest/images/que/image051.png",
      "point": 1
    },
    {
      "id": 53,
      "que": "Parking is permitted",
      "opt": [
        "In turnings",
        "On foot paths",
        "Where parking is not prohibited"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 54,
      "que": "The sign represents",
      "opt": [
        "Bullock cart prohibited",
        "Cycle prohibited",
        "All vehicles prohibited"
      ],
      "ra": 0,
      "img": "assest/images/que/image053.png",
      "point": 1
    },
    {
      "id": 55,
      "que": "When fuel is filled in a vehicle",
      "opt": [
        "shall not check air pressure",
        "shall not smoke",
        "shall not use any light of the vehicle"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 56,
      "que": "The sign represents",
      "opt": [
        "Students prohibited",
        "Pedestrians permitted",
        "Pedestrians prohibited"
      ],
      "ra": 2,
      "img": "assest/images/que/image055.png",
      "point": 1
    },
    {
      "id": 57,
      "que": "Mobile phones shall not be used",
      "opt": [
        "in Government offices",
        "in Police Stations",
        "While driving a vehicle"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 58,
      "que": "The sign represents",
      "opt": [
        "Overtaking prohibited through the right side",
        "Turn left",
        "Left turn Prohibited"
      ],
      "ra": 2,
      "img": "assest/images/que/image057.png",
      "point": 1
    },
    {
      "id": 59,
      "que": "Overtaking is prohibited",
      "opt": [
        "When the road ahead is not clearly visible",
        "when the road ahead is wide enough",
        "when the road center is marked with white broken lines"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 60,
      "que": "The sign represents",
      "opt": [
        "Drive the vehicle not exceeding 50 km/hr.",
        "Drive the vehicle at 50 km/hr",
        "drive the vehicle exceeding 50km/hr."
      ],
      "ra": 0,
      "img": "assest/images/que/image059.png",
      "point": 1
    },
    {
      "id": 61,
      "que":
          "The pedestrians shall not cross the road at sharp bends or very near to a stopped vehicle. Why?",
      "opt": [
        "Inconvenience to other vehicles.",
        "Inconvenience to other road users.",
        "Drivers of other vehicles coming at a distance may not see persons crossing the road."
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 62,
      "que": "The sign represents",
      "opt": [
        "Speed limit 2km/hr",
        "No entry for vehicles having more than 2 meters width.",
        "No entry for vehicles having more than 2 meters height"
      ],
      "ra": 1,
      "img": "assest/images/que/image061.png",
      "point": 1
    },
    {
      "id": 63,
      "que": "Records of a private vehicle are",
      "opt": [
        "Registration Certificate, G.C.R., Insurance Certificate",
        "Registration certificate., Insurance Certificate,  Tax Token, Driving Licence",
        "Registration Certificate, Permit, Trip Sheet"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 64,
      "que": "The sign represents",
      "opt": [
        "Entry only for vehicles with height  above 3.5 meters .",
        "Entry only for vehicles with width  above  3.5 meters .",
        "Entry for vehicles having height not exceeding  3.5 meters."
      ],
      "ra": 2,
      "img": "assest/images/que/image063.png",
      "point": 1
    },
    {
      "id": 65,
      "que":
          "While turning to a road to the left of the road in which you are going, you should",
      "opt": [
        "Show the left turn signal, drive to the center and turn to the left",
        "Sound horn and turn to the left",
        "Show the left turn signal, keep to the left side of the road and turn to the left."
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 66,
      "que": "The sign represents",
      "opt": ["Stop", "No Stopping or standing", "Junction"],
      "ra": 1,
      "img": "assest/images/que/image065.png",
      "point": 1
    },
    {
      "id": 67,
      "que": "Validity of P.U.C.C. Pollution Under Control   Certificate",
      "opt": ["6 months", "One Year", "Two years"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 68,
      "que": "The sign represents",
      "opt": ["No entry", "Ahead only", "Entry in both direction"],
      "ra": 1,
      "img": "assest/images/que/image067.png",
      "point": 1
    },
    {
      "id": 69,
      "que":
          "While you are driving with the head light in high beam during night, a vehicle approaches from  opposite direction, you will",
      "opt": [
        "Proceed keeping to the left",
        "Put the head light in dim and bright alternatively several times",
        "Dim the head light till the vehicle passes"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 70,
      "que": "The sign represents",
      "opt": [
        "Compulsory ahead or turn right",
        "Compulsory ahead or turn left",
        "Side road ahead"
      ],
      "ra": 1,
      "img": "assest/images/que/image069.png",
      "point": 1
    },
    {
      "id": 71,
      "que":
          "The Driver of a vehicle extends his right arm with the palm downward and moves the arm upward  and downward several times.You will understandthat",
      "opt": [
        "He is turning to the left",
        "He is slowing down the vehicle",
        "Allowing to overtake"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 72,
      "que": "The sign represents",
      "opt": ["Stop on the left side", "Compulsory keep left", "Turn left"],
      "ra": 1,
      "img": "assest/images/que/image071.png",
      "point": 1
    },
    {
      "id": 73,
      "que":
          "Minimum age for getting a licence to drive motor cycle without gear",
      "opt": ["18 years", "21 years", "16 years"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 74,
      "que": "The sign represents",
      "opt": ["Right ascend", "Right hand curve", "Keep right"],
      "ra": 1,
      "img": "assest/images/que/image073.png",
      "point": 1
    },
    {
      "id": 75,
      "que": "When you see the traffic sign School, you should",
      "opt": [
        "Stop the vehicle, sound horn and proceed.",
        "Slow down and proceed with caution",
        "Sound horn continuously and proceed"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 76,
      "que": "The sign represents",
      "opt": ["Left hand curve", "Left ascend", "Keep left"],
      "ra": 0,
      "img": "assest/images/que/image075.png",
      "point": 1
    },
    {
      "id": 77,
      "que": "While turning to the left, the driver of a two  wheeler shall",
      "opt": [
        "Extend his left hand towards left",
        "Not show hand signal",
        "Show left turn signal with his right hand"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 78,
      "que": "The sign represents",
      "opt": [
        "Right hair pin bend",
        "Right ascend and descend",
        "Right descend"
      ],
      "ra": 0,
      "img": "assest/images/que/image077.png",
      "point": 1
    },
    {
      "id": 79,
      "que": "The Signal while taking U- turn",
      "opt": ["Left turn signal", "Right turn signal", "Slow down signal"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 80,
      "que": "The sign represents",
      "opt": ["Left descend", "Left hair pin bend", "Keep left"],
      "ra": 1,
      "img": "assest/images/que/image079.png",
      "point": 1
    },
    {
      "id": 81,
      "que": "The driver of a vehicle shall not take U-turn",
      "opt": [
        "In a road where there is no traffic restrictions",
        "In a busy road",
        "When there are vehicles passing through the left"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 82,
      "que": "The sign represents",
      "opt": [
        "Right reverse bend",
        "Left reverse bend",
        "Turn right and go ahead"
      ],
      "ra": 0,
      "img": "assest/images/que/image081.png",
      "point": 1
    },
    {
      "id": 83,
      "que": "One time tax for a new car is for",
      "opt": [
        "Till the registration of the vehicle is cancelled",
        "15 years",
        "5 years"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 84,
      "que": "The sign represents",
      "opt": [
        "Right reverse bend",
        "Left reverse bend",
        "Turn left and go ahead"
      ],
      "ra": 1,
      "img": "assest/images/que/image083.png",
      "point": 1
    },
    {
      "id": 85,
      "que": "Before overtaking a vehicle, it should be ensured that \u2026..",
      "opt": [
        "No vehicle is approaching from behind",
        "The road ahead is clearly visible and it is safe to overtake",
        "The vehicle in front is turning left."
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 86,
      "que": "The sign represents",
      "opt": ["Side road left", "Speed limit", "Axle weight limit"],
      "ra": 2,
      "img": "assest/images/que/image085.png",
      "point": 1
    },
    {
      "id": 87,
      "que":
          "Number of persons can be carried in the cabin of a Goods Carriage",
      "opt": [
        "5 Persons",
        "Sufficient persons for loading and unloading the goods",
        "As many persons as recorded in the Registration Certificate"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 88,
      "que": "The sign represents",
      "opt": ["Turn right", "Side road right", "Keep right"],
      "ra": 1,
      "img": "assest/images/que/image087.png",
      "point": 1
    },
    {
      "id": 89,
      "que":
          "When your vehicle is being overtaken,                     you should",
      "opt": [
        "Stop your vehicle and let the vehicle to overtake",
        "Increase the speed of your vehicle",
        "Not obstruct the other vehicle from over taking"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 90,
      "que": "The sign represents",
      "opt": ["Major Road ahead", "Cross Road ahead", "Narrow road ahead"],
      "ra": 0,
      "img": "assest/images/que/image089.png",
      "point": 1
    },
    {
      "id": 91,
      "que": "A place where parking is prohibited",
      "opt": [
        "In front of a parked vehicle",
        "On one-way road",
        "On foot-path"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 92,
      "que": "The sign represents",
      "opt": ["Turn right", "Turn left", "Round about"],
      "ra": 2,
      "img": "assest/images/que/image091.png",
      "point": 1
    },
    {
      "id": 93,
      "que": "The hand brake is to be used",
      "opt": [
        "To reduce the speed",
        "To apply sudden brake",
        "To park a vehicle"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 94,
      "que": "The sign represents",
      "opt": ["Narrow road ahead", "Dangerous dip", "Ferry"],
      "ra": 1,
      "img": "assest/images/que/image093.png",
      "point": 1
    },
    {
      "id": 95,
      "que": "More than two persons  on a two wheeler is",
      "opt": [
        "Allowed in unavoidable circumstances",
        "Violation of law",
        "Allowed when the traffic is less"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 96,
      "que": "The sign represents",
      "opt": ["Guarded level cross", "Unguarded level cross", "Barrier ahead"],
      "ra": 0,
      "img": "assest/images/que/image095.png",
      "point": 1
    },
    {
      "id": 97,
      "que": "You want to overtake a vehicle near a hospital.  You will",
      "opt": [
        "Blow the horn continuously.",
        "Not blow horn.",
        "Blow the horn only intermittently."
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 98,
      "que": "The sign represents",
      "opt": [
        "Y-inter section left",
        "Y-inter section right",
        "Side road left"
      ],
      "ra": 0,
      "img": "assest/images/que/image097.png",
      "point": 1
    },
    {
      "id": 99,
      "que": "Using unregistered vehicle in public place is",
      "opt": ["Illegal", "Legal", "Legal if there is urgency"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 100,
      "que": "The sign represents",
      "opt": [
        "Y-inter section left",
        "Y-inter section right",
        "Side road right"
      ],
      "ra": 1,
      "img": "assest/images/que/image099.png",
      "point": 1
    },
    {
      "id": 101,
      "que":
          "Minimum age for obtaining driving licence for  transport vehicles.",
      "opt": ["25 years", "18 years", "20 years"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 102,
      "que": "The sign represents",
      "opt": ["Turn left", "Turn right", "Y-inter section"],
      "ra": 2,
      "img": "assest/images/que/image101.png",
      "point": 1
    },
    {
      "id": 103,
      "que": "Overtaking is prohibited in the following case",
      "opt": ["State highway", "Panchayath roads.", "Narrow bridge."],
      "ra": 2,
      "point": 1
    },
    {
      "id": 104,
      "que": "The following sign represents..",
      "opt": [
        "Road to the right in front",
        "There are roads ahead and to the right",
        "Compulsory go ahead or turn to right"
      ],
      "ra": 2,
      "img": "assest/images/que/image103.png",
      "point": 1
    },
    {
      "id": 105,
      "que":
          "If a person in charge of an animal apprehending that the animal may become unmanageable, request to stop a vehicle.",
      "opt": [
        "The driver shall stop the vehicle.",
        "The driver shall proceed, blowing the horns.",
        "The driver shall reduce the speed."
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 106,
      "que": "The sign represents",
      "opt": ["Slippery road", "Gravel road", "No entry for motor car"],
      "ra": 0,
      "img": "assest/images/que/image105.png",
      "point": 1
    },
    {
      "id": 107,
      "que": "Parking prohibited in the following case ..",
      "opt": [
        "road side.",
        "where parking is permitted.",
        "near traffic light."
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 108,
      "que": "The sign represents",
      "opt": ["Loose gravel", "Slippery road", "No entry for motor car"],
      "ra": 0,
      "img": "assest/images/que/image107.png",
      "point": 1
    },
    {
      "id": 109,
      "que": "Over speeding\u2026\u2026",
      "opt": [
        "is an offence leading to suspension  or cancellation of driving licence",
        "is an offence leading to punishment by fine only",
        "is not an offence"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 110,
      "que": "The sign represents\u2026.",
      "opt": [
        "Cycle crossing",
        "Cycle crossing prohibited",
        "No entry for cycles"
      ],
      "ra": 0,
      "img": "assest/images/que/image109.png",
      "point": 1
    },
    {
      "id": 111,
      "que":
          "When school buses are stopped for picking up or setting down students\u2026.",
      "opt": [
        "Blow horn and proceed",
        "proceed slowly and cautiously since there is chance of  students suddenly crossing the road",
        "No special care is required"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 112,
      "que": "The sign represents\u2026..",
      "opt": [
        "Cattle prohibited",
        "Possibility of cattle on road",
        "Vehicles carrying cattle prohibited"
      ],
      "ra": 1,
      "img": "assest/images/que/image111.png",
      "point": 1
    },
    {
      "id": 113,
      "que": "When a blind person crosses the road holding   White Cane\u2026.",
      "opt": [
        "The driver of a vehicle shall consider the white  cane as a traffic sign to stop the vehicle",
        "Blow the horn and proceed",
        "Slow down and proceed with caution"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 114,
      "que": "The sign represents\u2026..",
      "opt": [
        "School ahead",
        "Pedestrians crossing",
        "Pedestrians crossing prohibited"
      ],
      "ra": 0,
      "img": "assest/images/que/image113.png",
      "point": 1
    },
    {
      "id": 115,
      "que": "When a motor vehicle is involved in an accident\u2026..",
      "opt": [
        "shall report to the nearest police station within  24 hours",
        "shall report to the nearest police station within 12 hours",
        "shall report to the nearest police station within  48 hours"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 116,
      "que": "The sign represents\u2026.",
      "opt": ["Men at work", "Children playing", "Pedestrian crossing"],
      "ra": 0,
      "img": "assest/images/que/image115.png",
      "point": 1
    },
    {
      "id": 117,
      "que":
          "When any property of a third party is damaged  due to an accident\u2026.",
      "opt": [
        "driver shall report to the nearest police station within 24 hours",
        "driver shall report to the nearest police station within 7 days",
        "need not report to any police station"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 118,
      "que": "The sign represents\u2026",
      "opt": ["Rough road", "Slippery road", "Falling rocks"],
      "ra": 2,
      "img": "assest/images/que/image117.png",
      "point": 1
    },
    {
      "id": 119,
      "que":
          "When the vehicle behind has begun to over take our vehicle\u2026.",
      "opt": [
        "We shall not overtake another vehicle.",
        "we can over take another vehicle.",
        "we can overtake another vehicle blowing horn"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 120,
      "que": "The sign represents\u2026..",
      "opt": ["Bridge ahead", "Ferry", "Refreshment stall ahead"],
      "ra": 1,
      "img": "assest/images/que/image119.png",
      "point": 1
    },
    {
      "id": 121,
      "que":
          "The driver of the vehicle in front has not given  signal for over taking\u2026\u2026",
      "opt": [
        "We can overtake",
        "we shall not overtake",
        "we can overtake blowing horn"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 122,
      "que": "The sign represents\u2026.",
      "opt": ["Steep ascend", "Steep descend", "Slippery road"],
      "ra": 0,
      "img": "assest/images/que/image121.png",
      "point": 1
    },
    {
      "id": 123,
      "que": "When our vehicle is being over taken\u2026.",
      "opt": [
        "We shall not increase speed",
        "We can increase speed",
        "We can increase speed with due care"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 124,
      "que": "The sign represents\u2026..",
      "opt": ["Steep ascend", "Steep descend", "Slippery road"],
      "ra": 1,
      "img": "assest/images/que/image123.png",
      "point": 1
    },
    {
      "id": 125,
      "que": "Parking is prohibited in the following place\u2026..",
      "opt": ["Entrance of hospital", "Left side of the road", "Market area"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 126,
      "que": "The sign represents\u2026..",
      "opt": ["Narrow road ahead", "Y-intersection", "Road widens ahead"],
      "ra": 2,
      "img": "assest/images/que/image125.png",
      "point": 1
    },
    {
      "id": 127,
      "que": "Parking is prohibited in the following place\u2026..",
      "opt": [
        "blocking a fire hydrant",
        "near a public well",
        "left side of the road"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 128,
      "que": "The sign represents\u2026",
      "opt": ["Drainage in middle", "Bridge ahead", "Gap in median"],
      "ra": 2,
      "img": "assest/images/que/image127.png",
      "point": 1
    },
    {
      "id": 129,
      "que": "To carry pillion rider on a motor cycle\u2026.",
      "opt": [
        "the vehicle shall be provided with foot rest, hand grip and sari guard",
        "the vehicle shall be provided with side car",
        "vehicle shall be provided with rear view mirror"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 130,
      "que": "The sign represents\u2026",
      "opt": ["Hump or rough road", "Zigzag road", "Ghat road"],
      "ra": 0,
      "img": "assest/images/que/image129.png",
      "point": 1
    },
    {
      "id": 131,
      "que": "Smoking while driving public service vehicle\u2026",
      "opt": [
        "can attract suspension of driving licence",
        "can attract fine only",
        "None of the above"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 132,
      "que": "The sign represents\u2026",
      "opt": ["Barrier ahead", "Railway cross ahead", "Weighbridge ahead"],
      "ra": 0,
      "img": "assest/images/que/image131.png",
      "point": 1
    },
    {
      "id": 133,
      "que":
          "Abandoning vehicle in a public place causing in convenience to others or passengers\u2026\u2026",
      "opt": [
        "the driving licence is liable to be suspended or cancelled",
        "only fine is attracted",
        "None of the above"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 134,
      "que": "The sign represents\u2026.",
      "opt": ["No thorough side road", "Left turn", "Bridge ahead"],
      "ra": 0,
      "img": "assest/images/que/image133.png",
      "point": 1
    },
    {
      "id": 135,
      "que":
          "Abandoning a transport vehicle as a mark of  protest or agitation or any kind of strike, in a  public place or in any other place causing obstruction or inconvenience to the public or  passengers or other users of such places\u2026",
      "opt": [
        "the driving licence is liable to be suspended or cancelled",
        "only fine is attracted",
        "Legitimate right of driver"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 136,
      "que": "The sign represents\u2026.",
      "opt": ["Ferry ahead", "Main road ahead", "No thorough road"],
      "ra": 2,
      "img": "assest/images/que/image135.png",
      "point": 1
    },
    {
      "id": 137,
      "que": "Carrying overload in goods carriages\u2026.",
      "opt": [
        "legally not punishable",
        "Only fine is attracted",
        "can attract suspension or cancellation of driving licence"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 138,
      "que": "The sign represents\u2026",
      "opt": ["Parking prohibited", "Parking both sides", "Police aid post"],
      "ra": 1,
      "img": "assest/images/que/image137.png",
      "point": 1
    },
    {
      "id": 139,
      "que":
          "The driver of a taxi refusing the offer for journey for the reason that the distance is short\u2026",
      "opt": [
        "can attract suspension / cancellation of driving  licence",
        "only fine is attracted",
        "None of the above"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 140,
      "que": "The sign represents\u2026",
      "opt": [
        "Parking lot - scooters and motor cycles",
        "Scooters and motor cycles prohibited",
        "Scooters and motor cycles repairing"
      ],
      "ra": 0,
      "img": "assest/images/que/image139.png",
      "point": 1
    },
    {
      "id": 141,
      "que":
          "When you reach an intersection where there is no signal light or police man, you will\u2026",
      "opt": [
        "Give way to traffic approaching the intersection  from other roads",
        "Give proper signal, sound the horn and proceed",
        "Give way to the traffic approaching the intersection on your right side and proceed after giving  necessary signals."
      ],
      "ra": 2,
      "img": "assest/images/que/image143.png",
      "point": 1
    },
    {
      "id": 142,
      "que": "The sign represents\u2026",
      "opt": [
        "No entry for private cars",
        "Parking lot - Taxis",
        "Parking for police vehicles"
      ],
      "ra": 1,
      "img": "assest/images/que/image141.png",
      "point": 1
    },
    {
      "id": 143,
      "que":
          "While you are approaching an intersection where the yellow signal light is blinking, you should\u2026.",
      "opt": [
        "As there is no restriction, proceed at the same speed",
        "Stop the vehicle and wait for the green light to appear",
        "Slow down the vehicle and proceed only after ensuring that it is safe to do so"
      ],
      "ra": 2,
      "img": "assest/images/que/image145.png",
      "point": 1
    },
    {
      "id": 144,
      "que": "The sign represents\u2026",
      "opt": [
        "Petrol pump",
        "Parking lot - Autorikshaws",
        "Autorikshaw parking prohibited"
      ],
      "ra": 1,
      "img": "assest/images/que/image143.png",
      "point": 1
    },
    {
      "id": 145,
      "que":
          "Where the road is marked with continuous  yellow line the vehicle should\u2026",
      "opt": [
        "Not touch or cross the yellow line",
        "Allow to overtake only through the right side of yellow line",
        "Cross the line only when overtaking a vehicle in front"
      ],
      "ra": 0,
      "img": "assest/images/que/image151.png",
      "point": 1
    },
    {
      "id": 146,
      "que": "The signal represents\u2026.",
      "opt": [
        "Request to stop the vehicle coming behind",
        "Intends to turn right",
        "Request to stop the vehicle from opposite direction"
      ],
      "ra": 1,
      "img": "assest/images/que/image145.png",
      "point": 1
    },
    {
      "id": 147,
      "que": "While you are driving on gradient roads,  you should\u2026.",
      "opt": [
        "Give precedence to the vehicles coming down the hill",
        "Give precedence to the vehicles going up the hill",
        "Give precedence to the vehicles carrying heavy load"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 148,
      "que": "The signal represents\u2026",
      "opt": [
        "Intends to turn left",
        "Intends to turn right",
        "Request to stop all other vehicles"
      ],
      "ra": 0,
      "img": "assest/images/que/image147.png",
      "point": 1
    },
    {
      "id": 149,
      "que": "The driver of a tractor shall not carry\u2026..",
      "opt": [
        "Any person other than the driver.",
        "More than three persons other than the driver.",
        "More than two persons including the driver."
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 150,
      "que": "The signal represents\u2026",
      "opt": [
        "Intends to turn right",
        "Request to stop the vehicle coming from opposite direction",
        "Intends to slow down the vehicle"
      ],
      "ra": 2,
      "img": "assest/images/que/image149.png",
      "point": 1
    },
    {
      "id": 151,
      "que":
          "While a vehicle entering a main road from a  branch road, the driver shall give preference\u2026",
      "opt": [
        "To the vehicles coming from the left",
        "To the vehicles coming from the right",
        "To all vehicles proceeding along the main road"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 152,
      "que": "The signal represents\u2026",
      "opt": [
        "Intends to go straight",
        "Intends to stop the vehicle",
        "Intends to turn right"
      ],
      "ra": 1,
      "img": "assest/images/que/image151.png",
      "point": 1
    },
    {
      "id": 153,
      "que": "You can overtake a vehicle through the left side if\u2026",
      "opt": [
        "The driver of that vehicle indicates his intention  to turn  right and proceeds to the center of the road",
        "There is sufficient space on the left side",
        "That vehicle moves slowly"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 154,
      "que": "The signal represents\u2026",
      "opt": [
        "Request to stop the vehicle from behind",
        "Request to pass the vehicle from behind",
        "Request to stop the vehicle from front"
      ],
      "ra": 0,
      "img": "assest/images/que/image153.png",
      "point": 1
    },
    {
      "id": 155,
      "que": "What is \"Tail-gating\" ?",
      "opt": [
        "Driving too close behind a vehicle in a dangerousmanne r.",
        "Keeping safe distance from the vehicle ahead regulating the speed proportionately.",
        "Keeping a distance of atleast  7  metres from the vehicle ahead."
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 156,
      "que": "The signal represents\u2026",
      "opt": [
        "Request to pass the vehicles coming from the left",
        "Request to pass the vehicle coming in opposite direction",
        "Request to stop the vehicle from behind and front"
      ],
      "ra": 2,
      "img": "assest/images/que/image155.png",
      "point": 1
    },
    {
      "id": 157,
      "que": "A vehicle can be seized by authorised officers, if\u2026",
      "opt": [
        "The vehicle is not covered by a valid registration or permit",
        "The vehicle is not covered by a  valid insurance",
        "The vehicle exceeds the speed limit"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 158,
      "que": "The signal represents\u2026",
      "opt": [
        "Request to stop the vehicle from front",
        "Request to stop the vehicle from behind",
        "Request to pass the vehicle from front"
      ],
      "ra": 0,
      "img": "assest/images/que/image157.png",
      "point": 1
    },
    {
      "id": 159,
      "que": "Type of horn permitted\u2026.",
      "opt": ["Air- horn", "Multi-toned horn", "Electric horn"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 160,
      "que": "Road on which driving in reverse gear is  prohibited\u2026",
      "opt": ["One-way road", "Steep descending road", "Steep ascending road"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 161,
      "que":
          "If drunken driving is detected, the driver is liable to be punished with\u2026",
      "opt": [
        "Imprisonment which may extent to 6 months or Rs.2000/- as fine or both",
        "Imprisonment which may extent to 1 year or fine up to Rs.4000/- or both",
        "2 years rigorous imprisonment"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 162,
      "que": "You hold a  learners licence for motor cycle \u2026.",
      "opt": [
        "You will drive when the traffic is less",
        "You will drive the vehicle only when an  instructor holding driving licence to drive motor cycle accompanies",
        "You will not carry any other person on the motor cycle except for the purpose of getting instructions from an instructor who holds a valid driving  licence to drive motor cycle"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 163,
      "que":
          "When the yellow light at an intersection appear  on the signal light, the driver of a approaching  vehicle should\u2026",
      "opt": [
        "Ensure safety and drive away",
        "Slow down to stop",
        "Sound horn and proceed"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 164,
      "que": "All motor vehicles must be covered by\u2026.",
      "opt": [
        "Life Insurance",
        "Third party Insurance",
        "Comprehensive Insurance"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 165,
      "que":
          "Minimum distance to be kept from the vehicle  going in front\u2026",
      "opt": ["10 meter", "5 meter", "safe distance according to speed."],
      "ra": 2,
      "point": 1
    },
    {
      "id": 166,
      "que":
          "The number of passengers permitted to be taken in private vehicle is recorded in the\u2026..",
      "opt": ["Registration Certificate", "Tax Token", "Permit"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 167,
      "que": "Overtaking is prohibited when \u2026",
      "opt": [
        "the road is marked with broken center line in  white colour.",
        "the road is marked with continuous center line in yellow colour.",
        "vehicle is driven on a steep hill."
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 168,
      "que": "If the road is marked with broken white lines,  you \u2026",
      "opt": [
        "shall not change track.",
        "can change track if required.",
        "shall stop the vehicle."
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 169,
      "que": "Blinking red traffic light means\u2026",
      "opt": [
        "stop the vehicle till green light glows.",
        "stop the vehicle and proceed if safe.",
        "reduce speed and proceed."
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 170,
      "que":
          "Maximum permitted speed of a motor car on  national high way in the state\u2026",
      "opt": ["60 km/hour", "70 km/hour", "80 km/hour"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 171,
      "que": "What is defensive driving ?",
      "opt": [
        "Driving cautiously anticipating violation of trafficrules and road signs both by drivers and other  road  users.",
        "Driving with sole aim of reaching the destination with no regards to road signs.",
        "Driving on the assumption that other road users will be cautious about their safety."
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 172,
      "que": "What is meant by  stop line?",
      "opt": [
        "A line with 5 centimeters width in white or yellowcolour at the approach of road junction or pedestrian crossing",
        "A line drawn through the center of the road in yellow colour",
        "A broken white line through the center of the road"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 173,
      "que": "Before starting the engine of a vehicle\u2026.",
      "opt": [
        "Check radiator water level and engine oil level",
        "Check head light",
        "Check brake"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 174,
      "que": "Maximum permissible speed of  a motor cycle\u2026",
      "opt": ["No Limit", "50 Km/hr", "60 Km/hr"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 175,
      "que":
          "The only vehicle which is permitted to be driven at a speed exceeding 60 Km/hr\u2026",
      "opt": ["Motor Cycle", "Motor Car", "Stage Carriage"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 176,
      "que":
          "Maximum permissible speed of a motor car near educational institution \u2026..",
      "opt": ["40 km/hour", "25 km/hour", "30 km/hour"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 177,
      "que":
          "Maximum permitted speed of trucks on national high way in the state\u2026.",
      "opt": ["50 km/hour", "60 km/hour", "70 km/hour"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 178,
      "que":
          "Maximum permissible speed of a two wheeler   near educational institution\u2026.",
      "opt": ["25 km/hour", "30 km/hour", "40 km/hour"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 179,
      "que":
          "Projection of load upto one metre (100 cms)  towards back is permitted\u2026..",
      "opt": ["in tractor", "in stationwagon", "in goods carriages"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 180,
      "que": "When lorries are loaded\u2026",
      "opt": [
        "The load can be projected to both sides  within  30 cm.",
        "The load shall not project on both sides.",
        "The load can be projected to both sides within  50 cm."
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 181,
      "que":
          "Maximum length of load that can be projected  from the rear part of a goods carriage\u2026.",
      "opt": ["150 cm", "100 cm", "120 cm"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 182,
      "que":
          "Maximum permissible speed of  heavy motor  vehicles in the cities\u2026\u2026..",
      "opt": ["35 Km/hr", "45 Km/hr", "60 Km/hr"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 183,
      "que":
          "Maximum distance allowed between towing and towed vehicles\u2026..",
      "opt": ["15 meters", "5 meters", "10 meters"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 184,
      "que": "Maximum permissible speed of a motor cycle in  cities\u2026.",
      "opt": ["40 km/hour", "30 km/hour", "50 km/hour"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 185,
      "que":
          "You are driving on a two-lane street, vehicle in     front of you is moving very slowly and the road  ahead is clear for overtaking, you should  .. ..",
      "opt": [
        "Pass the vehicle from the left hand side.",
        "Pass the vehicle from the right hand side.",
        "Pass the vehicle from any convenient side."
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 186,
      "que":
          "Maximum speed permitted for vehicles towing  another vehicle\u2026\u2026.",
      "opt": ["20 km/hour", "24 km/hour", "32 km/hour"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 187,
      "que":
          "Motor vehicle which is not permitted to drive in  ghat roads at a speed of  more than 30 Km/h\u2026\u2026.",
      "opt": ["heavy passenger vehicle", "motor car", "Autorickshaw"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 188,
      "que":
          "Circumstances in which a motor cycle can be  driven at the speed of 60 km/hour\u2026..",
      "opt": ["During night .", "During day time.", "Under no circumstances."],
      "ra": 2,
      "point": 1
    },
    {
      "id": 189,
      "que":
          "The maximum speed permitted for motor cycles  in city during night time\u2026.",
      "opt": ["25Km/hr", "30 Km/hr", "40 Km/hr"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 190,
      "que":
          "Maximum permitted weight that can be carried  on a goods carriage\u2026.",
      "opt": ["No limit", "allowed as per permit", "10 ton"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 191,
      "que": "The minimum fine for over - loading in goods  carriage\u2026.",
      "opt": ["Rs- 1000/-", "Rs- 2000/-", "Rs- 3000/-"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 192,
      "que":
          "Maximum permissible speed of an autorickshaw near educational inistitution\u2026.",
      "opt": ["35 km/hour", "25 km/hour", "20 km/hour"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 193,
      "que":
          "Maximum permissible speed of a light motor  vehicle near educational institution\u2026.",
      "opt": ["45 km/hour", "35 km/hour", "25 km/hour"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 194,
      "que": "Maximum permissible speed of motor car on  ghat roads\u2026.",
      "opt": ["40 km/hour", "30 km/hour", "20 km/hour"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 195,
      "que": "Maximum permissible speed of motor cycle on  ghat roads\u2026.",
      "opt": ["30 km/hour", "35 km/hour", "40 km/hour"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 196,
      "que": "Maximum permissible speed of an autorickshaw\u2026.",
      "opt": ["50  Km/hr", "30 Km/hr", "40 Km/hr"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 197,
      "que": "Maximum permissible speed of a light motor  vehicle\u2026.",
      "opt": ["60 Km/hr", "70 Km/hr", "No limit"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 198,
      "que": "Maximum permissible speed of a medium motorvehicle\u2026",
      "opt": ["80 Km/hr", "65 Km/hr", "70 Km/hr"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 199,
      "que": "According to section 112 of the Motor Vehicles  Act 1988\u2026",
      "opt": [
        "Speed limit shall not be exceeded",
        "Shall not drive after consuming alcohol",
        "Shall not use vehicle on road without paying tax"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 200,
      "que":
          "Section  113  of the Motor Vehicle  Act 1988  stipulates that the driver should not drive a  vehicle\u2026..",
      "opt": [
        "After consuming alcohol.",
        "Exceeding the speed limit",
        "Exceeding the weight permitted to carry"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 201,
      "que": "Maximum speed allowed to vehicles passing a procession\u2026.",
      "opt": ["15 KM/hr", "25 KM/hr", "35 KM/hr"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 202,
      "que":
          "The height limit of load on goods vehicle from  ground level\u2026..",
      "opt": ["3.8 meters", "3 meters", "no limit."],
      "ra": 0,
      "point": 1
    },
    {
      "id": 203,
      "que":
          "Maximum permissible speed of heavy motor  vehicle near education inistitution\u2026.",
      "opt": ["35 km/hour", "25 km/hour", "15 km/hour"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 204,
      "que":
          "Maximum permissible speed of heavy passenger motor vehicle  near educational institution \u2026..",
      "opt": ["35 km/hour", "25 km/hour", "15 km/hour"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 205,
      "que":
          "According to section 129  of Motor Vehicle  Act 1988 a person driving a motor cycle shall\u2026.",
      "opt": ["wear jerkins", "wear helmet", "wear shoes"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 206,
      "que":
          "Maximum permissible speed of a medium motor vehicle near educational institution\u2026.",
      "opt": ["15 km/hour", "25 km/hour", "35 km/hour"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 207,
      "que": "Maximum permissible speed of autorickshaws  on ghat road\u2026..",
      "opt": ["30 km/hour", "40 km/hour", "20 km/hour"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 208,
      "que":
          "Maximum permissible speed of heavy motor  vehicles on ghat roads\u2026.",
      "opt": ["35 km/hour", "25 km/hour", "15 km/hour"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 209,
      "que":
          "Maximum permissible speed of autorikshaw in  cites and municipal towns\u2026..",
      "opt": ["40 Km/hr", "30 Km/hr", "20 cm"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 210,
      "que": "Maximum permissible speed of heavy motor  vehicles\u2026.",
      "opt": ["70 Km/hr", "65 Km/hr", "50 Km/hr"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 211,
      "que":
          "Maximum permissible speed of medium motor  vehicles on ghat roads\u2026",
      "opt": ["45 km/hour", "35 km/hour", "25 km/hour"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 212,
      "que":
          "You wish to take \"U\" turn at an intersection controlled by a traffic light you should \u2026.",
      "opt": [
        "Drive to another intersection that has no traffic light",
        "Wait until the light turns green before making  the \"U\" turn",
        "Make the \"U\" turn if there is a policeman at the intersection"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 213,
      "que": "Zig-Zag driving is\u2026.",
      "opt": [
        "Dangerous to two-wheelers only",
        "Dangerous to all at all times",
        "Dangerous to four- wheelers vehicles"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 214,
      "que":
          "You are on a long downhill slope. What should you do to help control the speed of your vehicle ?",
      "opt": ["change to low gear", "Stop the Engine", "select neutral"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 215,
      "que": "To supervise a learner driver you MUST\u2026.",
      "opt": [
        "Be an approved driving instructor",
        "Hold a Driving licence",
        "Hold a learner\u2019s licence"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 216,
      "que": "While on a round about",
      "opt": [
        "traffic entering has right of way",
        "traffic existing has right of way",
        "traffic on the roundabout has right of way"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 217,
      "que":
          "It is essential to wear a helmet while driving a two- wheeler because\u2026.",
      "opt": [
        "It is for your individual safety",
        "Otherwise you will be caught by the traffic police",
        "It is necessary for uniformity on the road"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 218,
      "que": "When you shall sound the horn of your vehicle ?",
      "opt": [
        "to give you right of way",
        "to warn other drivers of your presence",
        "to attract a friend\u2019s attention"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 219,
      "que":
          "You are behind a bus that has stopped to pickup or drop off passengers you should\u2026..",
      "opt": [
        "wait behind patiently",
        "overtake from the left",
        "overtake from the pedestrians"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 220,
      "que": "You are overtaking a car at night. You must ensure that\u2026.",
      "opt": [
        "you do not dazzle other road users",
        "you flash headlamps before overtaking",
        "your rear fog lights are switched on"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 221,
      "que": "The middle lane is for\u2026.",
      "opt": ["overtaking", "two wheelers", "traffic at 40 km/h"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 222,
      "que": "A flashing yellow signal is used when\u2026..",
      "opt": [
        "traffic lights aren\u2019t working",
        "you should slow down & proceed with caution",
        "men are at work"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 223,
      "que":
          "You  stop  for  pedestrians waiting  to  cross   at   a zebra crossing. They do not start to cross. What should you do ?",
      "opt": ["sound your horn", "be patient and wait", "drive on"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 224,
      "que": "You are allowed to park\u2026.",
      "opt": [
        "on a footpath",
        "at top of a hill",
        "neither of these two alternatives"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 225,
      "que": "A high beam in foggy conditions\u2026.",
      "opt": [
        "is good because you can see more",
        "is bad because it reflects back and can dazzle",
        "make sure others can see you"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 226,
      "que": "Dipping your lights is necessary when\u2026..",
      "opt": ["you want to overtake", "it is foggy", "following a vehicle"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 227,
      "que":
          "When  approaching  a crossing  where you are  to go       straight\u2026.",
      "opt": [
        "change lanes to the right lane",
        "change lanes at least 50 mts ahead to the middle lane",
        "change lanes to the middle lane at the crossing"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 228,
      "que":
          "You are driving. A vehicle comes up quickly behind, flashing head lamps. You should\u2026..",
      "opt": [
        "accelerate to maintain gap behind you",
        "touch the breaks to show your brake lights",
        "allow the vehicle to over take, if safe"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 229,
      "que": "When must you use a dipped high beam headlight during the day ?",
      "opt": [
        "in poor visibility and highways",
        "on country roads",
        "along narrow streets"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 230,
      "que":
          "You are driving in rain. Why should you keep well back from the vehicle in front ?",
      "opt": [
        "in case it changes direction suddenly",
        "in case its fog lights dazzle you",
        "in case it stop suddenly"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 231,
      "que": "What can cause hard steering",
      "opt": ["badly worn tyre", "over inflated tyre", "under inflated tyre"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 232,
      "que": "Motor cyclists usually cause hazard by",
      "opt": [
        "Speed more than permitted",
        "passing very close to you by driving in the zig zag manner",
        "all of the above"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 233,
      "que":
          "You are waiting at a T- Junction, A vehicle is coming from the left with right signal flashing, you should",
      "opt": [
        "accelerate hard and move forward",
        "move forward slowly",
        "wait until the vehicle turn to right side"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 234,
      "que": "While you reach a junction with limited visibility you should",
      "opt": [
        "look both ways and move carefully",
        "look at right and move slowly",
        "move quickly"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 235,
      "que": "You should switch on your hazard warning lights",
      "opt": [
        "When you are moving straight",
        "When your vehicle is parked and the same is causing inconvenience to other road users",
        "when your vehicle parked at a no parking area"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 236,
      "que": "You are driving on a well-lit motor way at night, you must",
      "opt": [
        "use your head light on high beam",
        "always use your head lights in low beam",
        "always use hazard light"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 237,
      "que":
          "Anti lock braking system prevents wheels from locking. This avoid tyres to",
      "opt": ["Puncture", "skid", "wear"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 238,
      "que":
          "While travelling over motor way at night with other vehicles just ahead, better the switched on lights should be",
      "opt": [
        "hazard warning light",
        "low beam head light",
        "high beam head light"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 239,
      "que":
          "A cyclist is signalling to turn right and drawn to center of the road, you should",
      "opt": [
        "over take through left side",
        "sound horn continually",
        "overtake through right side only"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 240,
      "que": "Driving at high speed",
      "opt": [
        "gives you better fuel efficiency",
        "take less time for your journey",
        "reduces time to react to hazard"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 241,
      "que": "While driving, avoid",
      "opt": [
        "observing traffic rules",
        "reacting to wrong behaviour of other drivers",
        "observing the dash board guages"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 242,
      "que": "The continuous yellow line in the centre of the road means",
      "opt": ["no parking", "do not over take", "stop"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 243,
      "que": "In this carriage way you can drive",
      "opt": [
        "above 50 km/hr",
        "below 50 km/hr.",
        "up to a maximum legal speed permitted to your vehicle"
      ],
      "ra": 1,
      "img": "assest/images/que/image159.png",
      "point": 1
    },
    {
      "id": 244,
      "que": "When you approach a bridge you should",
      "opt": [
        "slow down and do not over take",
        "beware of pedestrians",
        "switch on the head lights"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 245,
      "que":
          "When approaching a right hand curve, you should keep well to the left to",
      "opt": [
        "improve your view of the road",
        "avoid skid",
        "to pass the vehicle from behind"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 246,
      "que": "While you are approaching a staggered junction, You should",
      "opt": [
        "slow the vehicle",
        "maintain your speed and sound the horn",
        "use hazard warning light"
      ],
      "ra": 0,
      "img": "assest/images/que/image161.png",
      "point": 1
    },
    {
      "id": 247,
      "que": "At the Blind Junction you must stop",
      "opt": [
        "only if there is traffic on the main road",
        "behind the line and move forward slowly as vision improves",
        "only if you are turning to the right"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 248,
      "que":
          "You entered  a one-way in the opposite direction unknowingly, you should",
      "opt": [
        "reverse out of the road",
        "Turn back carefully and drive away",
        "continue to the end of the road"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 249,
      "que":
          "While driving through a main road another vehicle is reversing from a side road, You should",
      "opt": [
        "Move to the opposite side of the road",
        "speed up and drive through quickly",
        "sound your horn and be prepared to stop"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 250,
      "que":
          "Approaching a cross road, the driver of the long vehicle ahead of you, signals right and moves to left, You should",
      "opt": [
        "sound horn and warn the driver",
        "wait behind the vehicle",
        "over take on the right hand side"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 251,
      "que": "Basic rule on a two lane high way is",
      "opt": [
        "keep to the left lane unless over taking",
        "keep the lane with the least traffic",
        "always keep to the right lane at high speed"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 252,
      "que": "You meet an obstruction on your side of the road, You should",
      "opt": [
        "move on as you have priority",
        "accelerate to move quickly",
        "give way to on coming traffic"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 253,
      "que": "The white line along the side of the road",
      "opt": [
        "means no parking",
        "means no overtaking",
        "edge of carriage way"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 254,
      "que": "The mandatory signs giving orders  are mostly in",
      "opt": ["Red/Blue circles", "Red Triangles", "Base triangles"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 255,
      "que": "This line means",
      "opt": [
        "cross it when ever you feel",
        "cross it when it is safe and come back after over taking",
        "not cross it under any circumstances"
      ],
      "ra": 1,
      "img": "assest/images/que/image163.png",
      "point": 1
    },
    {
      "id": 256,
      "que": "Vehicles adjacent to the solid line",
      "opt": [
        "can cross line for over taking",
        "cannot cross  for over taking",
        "cannot stop"
      ],
      "ra": 1,
      "img": "assest/images/que/image165.png",
      "point": 1
    },
    {
      "id": 257,
      "que": "Before you make an \"U\" turn you should",
      "opt": [
        "Select the neutral gear and the indicator",
        "show the signal for a right turn , watch in the rear wiew mirror",
        "wait for signal to turn red"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 258,
      "que": "While taking \"U\" turn in this road, You should",
      "opt": [
        "Move forward since prohibited",
        "Look in the mirror give signal and turn",
        "show the signal pass the vehicle from the opposite direction and turn"
      ],
      "ra": 0,
      "img": "assest/images/que/image167.png",
      "point": 1
    },
    {
      "id": 259,
      "que": "When you are moving from a parking place, You should",
      "opt": [
        "use the rear view mirrors, check in the blind spot and give signal",
        "look around the vehicle",
        "sound horn and move ahead"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 260,
      "que": "When do you stop on a motor way",
      "opt": [
        "when ordered by police or if traffic signal is red",
        "in an emergency or brake down",
        "all of the above"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 261,
      "que":
          "You are intending to turn left , you should position your vehicle at",
      "opt": [
        "the middle lane",
        "the left hand lane",
        "on the shoulder of the road"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 262,
      "que":
          "You are in a wrong lane while approaching a busy Junction you should",
      "opt": [
        "continue in that lane",
        "stop until other lane is cleared",
        "show signal and cut across"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 263,
      "que": "When going straight ahead at a round about",
      "opt": [
        "indicate right signal and then left signal",
        "No signals is required",
        "use hazard warning lamp"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 264,
      "que": "You must not reverse your vehicle",
      "opt": ["on a busy road", "on a one way road", "all of the above"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 265,
      "que": "When do you reverse from a side road in to a main road",
      "opt": [
        "only if both roads are clear and empty",
        "at any time",
        "legally not permitted"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 266,
      "que":
          "When approaching from the rear, where two lanes of traffic have stopped at a signal, you should",
      "opt": [
        "pass all the vehicle and stop in front of them",
        "stop behind the last vehicle in the appropriate lane",
        "stop any where"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 267,
      "que": "Rear Mirror is slightly curved to",
      "opt": [
        "give a wider field of vision",
        "cover the blind spot totally",
        "judge the speed of following vehicle"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 268,
      "que": "Noise pollution may result in",
      "opt": [
        "disturbing mental equilibrium",
        "Disturbing the concentration of the driver",
        "all of the above"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 269,
      "que": "Air pollution affects",
      "opt": [
        "Human beings only",
        "plants and animals only",
        "all of the above"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 270,
      "que": "Fitment of multi toned horns on a motor vehicle is",
      "opt": [
        "permitted only in emergency",
        "an offence under the law as it causes  noise pollution",
        "for avoiding accident"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 271,
      "que": "Your vehicle pulls to one side while braking, You should",
      "opt": [
        "change the tyres around",
        "pump the pedal when braking",
        "consult your mechanic"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 272,
      "que": "What is the common cause of skidding",
      "opt": [
        "bad condition of tyres and road",
        "error of driver",
        "both of the above"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 273,
      "que":
          "While travelling  you are dazzled by head lights of on coming vehicle, you should",
      "opt": [
        "pull down your sun visor",
        "slow down and stop",
        "switch on your main beam"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 274,
      "que": "What is blind spot",
      "opt": [
        "An area not seen in your rear view mirrors",
        "an area not covered by head lights",
        "an area not covered by the  rear view mirror inside your vehicle"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 275,
      "que":
          "While approaching a road under repair, you comply the permitted speed limit",
      "opt": [
        "during day time and working is going on",
        "During night time only",
        "at all times"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 276,
      "que": "Section 185 of MV Act pertains to",
      "opt": [
        "Driving at excessive speed",
        "Drunken driving",
        "Both of the above"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 277,
      "que": "Dangerous driving is",
      "opt": [
        "allowed in an emergency situation",
        "punishable offence under section 184of M.V. act",
        "both of the above are correct"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 278,
      "que":
          "An accident has just happened and the injured person is lying on the road, you should",
      "opt": [
        "protect the area and inform the authorities",
        "protect the area and give first aid to injured",
        "protect the area, give first aid ,take the injured to the hospital  and inform the authorities"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 279,
      "que": "What is the main aim of the first aid",
      "opt": [
        "To treat the injury",
        "To prevent aggravating the injury  and its effects",
        "all of the above"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 280,
      "que": "How does alcohol affect your driving",
      "opt": [
        "It increase your awareness",
        "it reduce your concentration and attention",
        "it increase your confidence"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 281,
      "que": "Which of these lights will come after Amber at a traffic light",
      "opt": ["Red", "Green", "red or greeen"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 282,
      "que":
          "While driving you start feeling tired or unable to concentrate, You should",
      "opt": [
        "Stop as soon as it is safe to do so and take rest",
        "switch on the stereo to help you concentrate",
        "speed up to get your destination sooner"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 283,
      "que":
          "You are drivng at night, what can you do to help you to keep alert?",
      "opt": [
        "takes proper rest periods at correct intervals",
        "walk around in fresh air after a rest stop",
        "both of the above"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 284,
      "que":
          "You are driving a car during a journey you are feeling ill and unable to concentrate, what should you do?",
      "opt": [
        "increase your speed to finish your work earlier",
        "continue your journey and keep your windows open",
        "stop in a safe place and if possible seek for medical attention"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 285,
      "que": "Anti lock braking system is designed to",
      "opt": [
        "prevent the driving wheel from spinning",
        "prevent moisture from building up inside the braking system",
        "prevent wheels from locking up on braking and avoid skidding of the tyres"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 286,
      "que": "What is \"brake fade\"",
      "opt": [
        "A reduction of air pressure",
        "smooth progressive braking",
        "reduction of braking effectiveness"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 287,
      "que": "To prevent brake fade while descending you should",
      "opt": [
        "select neutral for a short distance",
        "repeatedly pump the brake pedal",
        "select a suitable higher power gear and apply brakes if only necessary"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 288,
      "que": "When stopping on an uphill gradient, one should",
      "opt": [
        "Hold the vehicle on the clutch",
        "Hold the vehicle on the foot brake",
        "Hold the vehicle applying parking brake after stopping"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 289,
      "que":
          "You are driving behind a large vehicle, how can you improve your view ahead?",
      "opt": [
        "Overtake as soon as you can",
        "Move over to the left",
        "Stay further back"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 290,
      "que": "While driving through a flooded road what should you do?",
      "opt": [
        "Stop the vehicle until the flood stops",
        "Watch flood level guage drive in high torque gear with high acceleration",
        "Drive in high torque gear with low acceleration"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 291,
      "que":
          "Driving the vehicle in a neutral gear in down hill is dangerous because it affects the",
      "opt": ["Cooling system", "Speed governor", "Brake system"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 292,
      "que": "what is the benefit of   power assisted steering",
      "opt": [
        "Reduce tyre wear",
        "assist with braking",
        "reduce driving effort"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 293,
      "que": "How can you avoid harsh driving?",
      "opt": [
        "gently apply the parking brake",
        "plan and take earlier action in using brake",
        "slow down by using gears only"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 294,
      "que":
          "On which occasions would passengers be most likely to notice weight transfer?",
      "opt": ["braking", "cornering", "both of the above"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 295,
      "que":
          "Which of the following should you do before a bend, round about or corner?",
      "opt": [
        "select the appropriate gear",
        "adjust your speed",
        "both of the above"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 296,
      "que": "Hazard warning lamps may only be used at certain times",
      "opt": [
        "for going ahead at a junction",
        "For slowing down the rear vehicle",
        "for emergency parking especially on high ways and busy roads"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 297,
      "que": "A laminated safety wind screen glass is one which",
      "opt": [
        "will not shatter",
        "has a plastic layer pasted between dual glasses",
        "both of the above"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 298,
      "que": "What must you do if your vehicle is involved in an accident?",
      "opt": [
        "stop at the scene of the accident, give First Aid to the victim if possible and help him to get medical attention",
        "drive the vehicle to the nearest police station",
        "inform the insurance authorities at the earliest"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 299,
      "que":
          "Your vehicle has hit a parked vehicle.  The owner of that vehicle could not be traced out  at the time, you must",
      "opt": [
        "drive away from the accident spot and clear the damage at the earliest",
        "inform the insurance authorities as soon as possible",
        "inform the police station having jurisdiction over the place in which the accident occurred within 24 hours"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 300,
      "que":
          "While  driving your vehicle on a motor way a front tyre gets burst.  You should",
      "opt": [
        "loosen  the grip on the steering wheel",
        "brake firmly for a stop",
        "hold the steering wheel firmly and stop safely by using brake"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 301,
      "que":
          "Motor cyclist are advised to wear type of clothing at night  to make them visible to other road users",
      "opt": ["bright clothing", "dark clothing", "none of this"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 302,
      "que": "Before you open the right side doors on parking, you should",
      "opt": [
        "ensure that no vehicle is passing by",
        "quickly open the door and get down",
        "do not open the right doors and get down through the left only"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 303,
      "que": "Which of the following is most important when loading a vehicle?",
      "opt": [
        "Loading it towards the rear",
        "loading it towards the front",
        "spreading the load evenly"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 304,
      "que":
          "You are driving a tipper vehicle carrying loose dry sand.  Why should you cover this load properly ?",
      "opt": [
        "To stop handling being affective _x000D_",
        "to set your rear ward vision",
        "to prevent sand being blown into the eyes of other road users"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 305,
      "que": "How many people can you carry over the load carried on a truck?",
      "opt": ["one", "as per permit", "none"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 306,
      "que": "What should be  checked first before turning to the left?",
      "opt": [
        "the right side mirror",
        "the left side mirror",
        "look behind over your right shoulders"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 307,
      "que": "You are about to move off you should always",
      "opt": [
        "using your mirrors  look behind and give proper signal",
        "signal left with indicator and move",
        "use only the off side mirror and move away quickly"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 308,
      "que": "At road junction which of the following are most at risk",
      "opt": ["Cyclist and motor cyclist", "pedestrian", "both"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 309,
      "que": "The turning circle of a vehicle is the",
      "opt": [
        "number of turns of the steering wheels between locked",
        "amount by which a vehicle cuts corners",
        "amount of space needed for the vehicle to turn"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 310,
      "que":
          "Before braking in wet condition you should make sure as far as possible that",
      "opt": [
        "the gear lever is in neutral",
        "there is no mist or water in your rear view mirror",
        "your vehicle is traveling slowly in a straight line"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 311,
      "que":
          "Your vehicle broken down on a motor way you have several passengers on board you should",
      "opt": [
        "stop the vehicle on the left side of the road as you can",
        "move the passengers to the front of your vehicle",
        "both"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 312,
      "que": "Wiper  fitted on the windscreen of a vehicle is",
      "opt": [
        "only for rainy season",
        "for cleaning the wind shield at any season",
        "as a signal to the on coming vehicle to stop approaching"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 313,
      "que":
          "A motor cycle rider observes a signboard which indicates \"Restrictions ends\", can he travel at a speed of",
      "opt": [
        "more than 50 kmph",
        "maximum speed of the vehicle",
        "not more than 50km/hr"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 314,
      "que":
          "The correct procedure for stopping a vehicle not equipped with anti lock brake system",
      "opt": [
        "Apply the foot brake firmly in a pumping action until the vehicle has stopped",
        "apply the foot brake firmly once until the vehicle has been stopped",
        "apply the foot brake and hand brake until the vehicle has stopped"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 315,
      "que":
          "You are driving a vehicle fitted with a speed governor you should be careful when",
      "opt": ["overtaking another vehicle", "cornering", "braking"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 316,
      "que": "Which of the following is a legal requirement for every vehicle?",
      "opt": ["First aid box", "spare wheel", "audio system"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 317,
      "que":
          "A driver of a motor car driving behind a long truck can keep a braking distance",
      "opt": ["1.2 meters", "2.5 meters", "safe distance"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 318,
      "que": "Traffic signs includes",
      "opt": [
        "all signals and warning sign posts",
        "direction posts and marking on road",
        "all of the above"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 319,
      "que":
          "What are the dangerous substances that can be carried on public service vehicle",
      "opt": [
        "Explosives",
        "fuel and lubricant of the vehicles",
        "safely packed catridge of small arms"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 320,
      "que": "No driver of a motor vehicle shall sound horn on",
      "opt": [
        "highways",
        "prohibited areas by notification of the authority",
        "rural roads"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 321,
      "que":
          "Which of the safety device fitted in Light Motor vehicle protects the driver from injury",
      "opt": ["helmet", "Seat belt", "none of above"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 322,
      "que": "Basic safety requirements of a two wheeler",
      "opt": [
        "rear wheel cover/sari guard",
        "crash guard",
        "both of the above"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 323,
      "que": "Pedestrians should walk on the side of the road",
      "opt": ["right", "left", "middle"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 324,
      "que": "Things to be checked before a long drive",
      "opt": [
        "fuel, oil, brake fluid, coolant, condition of tyre",
        "spare wheel, tools, tension of all drive belts",
        "all of the above"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 325,
      "que": "Reverse driving is permitted only for",
      "opt": [
        "Minimum distance required for changing direction",
        "during night driving",
        "driving on ghat roads"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 326,
      "que": "Precautions to be followed during parking at night",
      "opt": [
        "park out side of the carriage way and use park light and hand brake",
        "park the vehicle on foot path away from traffic",
        "use tyre jacky to prevent roling"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 327,
      "que": "Use of LPG as fuel in vehicle",
      "opt": [
        "is prohibited by law",
        "can be used after certification from authorities",
        "cannot be used even in case of modern LPG inbuilt models"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 328,
      "que": "Using LPG",
      "opt": ["Reduces pollution", "cost effective", "all of the above"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 329,
      "que": "On roads with defined lanes",
      "opt": [
        "use appropriate indicator signal before changing lanes",
        "lane changing is prohibited by law",
        "peep and see backwards through the front window before changing lanes"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 330,
      "que": "Towing is permitted only for",
      "opt": [
        "mechanically disabled or incompletely assembled motor vehicles",
        "registered travellers and side cars",
        "all of the above"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 331,
      "que":
          "During night, a car driving towards you with high beam on, the driver of that car is",
      "opt": [
        "driving with bad manners since high beams blind others",
        "a safe driver since high beam lights up the road",
        "not obeying law"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 332,
      "que":
          "When you want to change from one lane to another you should .....",
      "opt": [
        "give proper turn signal",
        "Look through Rear view mirror and change lane if it is safe to do",
        "both of the above"
      ],
      "ra": 2,
      "img": "assest/images/que/image169.png",
      "point": 1
    },
    {
      "id": 333,
      "que":
          "When you are driving in a four lane road, the vehicle in front of you is moving slowly and driving in the right lane and the road ahead is clear, for overtaking you should",
      "opt": [
        "pass the vehicle from the left side",
        "pass the vehicle from the convenient side",
        "pass the vehicle from the right hand side after getting signal from the vehicle at the front"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 334,
      "que":
          "You are moving into the street from a parallel parking space, you should",
      "opt": [
        "blow horn and pull out slowly,",
        "show signal to other traffic and then move carefully",
        "proceed with caution  after making sure that there is no vehicle in the vicinity that may cause an accident"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 335,
      "que":
          "While on a main road, another vehicle enters from a cross road, which vehicle has the \"Right of way\"_x000D_",
      "opt": [
        "Vehicle on the main road",
        "the vehicle approaching",
        "none of the cars"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 336,
      "que": "In lane traffic,before making a right turn you should be  in",
      "opt": ["any lane", "extreme left lane", "extreme right lane"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 337,
      "que": "If your vehicle hits a pedestrian you should",
      "opt": [
        "identify yourself and leave",
        "help the person, and call an ambulance",
        "help the injured  for medical aid identify yourself and then report to police"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 338,
      "que": "You should not over take",
      "opt": [
        "when the road ahead is not visible",
        "on straight road",
        "in rural areas"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 339,
      "que": "Reversing is prohibited in",
      "opt": ["main road", "in one way", "at T Junction"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 340,
      "que": "While driving on wet or slippery road",
      "opt": [
        "tyre pressure must be reduced",
        "avoid sudden braking and acceleration",
        "vehicle should be driven at high speed"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 341,
      "que": "While driving a motor cycle behind a four wheeler , you should",
      "opt": [
        "keep the motor cycle in the centre and behind the vehicle ahead",
        "stay slightly on the right or left of the vehicle",
        "none of the above"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 342,
      "que":
          "While driving a motor cycle or an auto rickshaw hand signals can be shown by using",
      "opt": ["both hands", "right hand only", "left hand only"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 343,
      "que": "While parking  the vehicle, you should",
      "opt": [
        "park the vehicle in such a way that it does not obstruct or make inconvenience to other road users",
        "parrellel to the kerb",
        "right angle to the kerb"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 344,
      "que": "To drive a vehicle with expired insurance, one",
      "opt": [
        "should drive cautiously to avoid any accident or loss to third party",
        "should not drive",
        "may drive if the driver has a valid personal life insurance policy"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 345,
      "que":
          "A person affected by a motor vehicle accident can apply for compensation before",
      "opt": [
        "RTO",
        "Motor Accident Claims Tribunal",
        "banker of the driver or owner"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 346,
      "que":
          "The penalty for driving a vehicle under the influence of drugs or alcohol are",
      "opt": [
        "imprisonment upto six months, fine upto 2000 or both_x000D_",
        "strict warning from authorities",
        "a fine of Rs.5000/-"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 347,
      "que": "Before leaving your parked vehicle, you should",
      "opt": [
        "turn ignition key off",
        "stop the engine, remove key and engage hand brake",
        "lock the car"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 348,
      "que": "A motor driving licence issued in a State is valid",
      "opt": [
        "throughout India",
        "throughout  the World",
        "only in the State of issue"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 349,
      "que": "You can hold",
      "opt": [
        "a maximum of 3 licence",
        "only one licence",
        "any number of licences however, each licence authorise only one class of vehicle for driving"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 350,
      "que":
          "Can you give a motor vehicle for driving to a person who does not have a valid licence?",
      "opt": [
        "yes, since the driver solely is responsible",
        "No, since it is a serious offence",
        "an offence only if the vehicle involves in an accident"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 351,
      "que":
          "Whether extra head light can be provided other than the standard head lights.",
      "opt": [
        "yes, adding extra light brightens the road",
        "No, you should not",
        "Can be provided on the bottom part of the vehicle"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 352,
      "que":
          "Driving of a vehicle with the pollution values exceeding the limits.",
      "opt": [
        "is permitted in emergency",
        "is an offence under law",
        "is liable for a strict warning from authorities"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 353,
      "que": "Abrupt braking shall not be resorted to",
      "opt": [
        "unless it is absolutely necessary",
        "on down hill",
        "on main road"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 354,
      "que": "Attaching or hanging of something on the rear view mirror is",
      "opt": [
        "against regulation",
        "permitted, depending upon its size",
        "permitted if the object does not obstruct the view of the driver"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 355,
      "que":
          "While passing a procession, body of troops or men at work  you should",
      "opt": [
        "proceed at regular speed",
        "stop",
        "proceed with not more than 25 Km/hr and carefully"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 356,
      "que": "To stop a motor cycle",
      "opt": [
        "apply rear brakes and after slowing apply front brakes",
        "apply both front and rear brakes simultaneously",
        "apply rear brake only"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 357,
      "que":
          "While travelling together (group riding) two or more motor cycles can take the position",
      "opt": [
        "side by side",
        "maintain the lane in a staggered position keeping a proper distance between motor cycle",
        "travel behind each other in a single line"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 358,
      "que":
          "While approaching a section of road way when there is loose sand or gravel, you should",
      "opt": [
        "hit the area as fast as possible",
        "go as slowly as possible",
        "slow down change to high torque gears before entering"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 359,
      "que": "You can conserve fuel when you drive the vehicle at",
      "opt": [
        "high speeds in high torque gears",
        "high speed in low torque gears",
        "a moderate uniform speed of 45-55 KMPH in top gear"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 360,
      "que": "Exhaust of your vehicle contains",
      "opt": [
        "oxygen, Nitrogen and hydrogen",
        "carbon dioxide, nitrogen and water",
        "carbon monoxide, nitrogen oxide, and hydro carbon"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 361,
      "que":
          "Failed to produce the P.U.C Certificate within 7 days of the detection by the Inspecting officer will attract",
      "opt": [
        "cancellation of driving licence",
        "Suspension of Registration Certificates",
        "Cancellation of Insurance Certificates"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 362,
      "que":
          "Which is the poison gas emitted through the exhaust gas of petrol vehicle",
      "opt": ["ammonia", "carbon monoxide", "chlorine"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 363,
      "que": "It is dangerous to drive with bald(worn out) tyres, since",
      "opt": [
        "the vehicle pick up speed quickly",
        "It has little road grip",
        "it has too much road grip"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 364,
      "que":
          "A vehicle with a temporary Registration number plate can be used on road",
      "opt": [
        "for 30 days",
        "only for the purpose of registration",
        "for 6 months"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 365,
      "que": "Over speeding or dangerous driving may",
      "opt": [
        "attracts a strict warning for the authorities",
        "is an offence and  is punishable",
        "attract other road users"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 366,
      "que": "Clutch riding or Riding on clutch means",
      "opt": [
        "using clutch frequently",
        "keeping a foot on the clutch pedal",
        "not using clutch at all"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 367,
      "que":
          "When a vehicle is approaching with  flashing red or blue light  you should",
      "opt": [
        "keep to the left of the road and slow down",
        "stop where you are",
        "ignore the vehicle"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 368,
      "que": "You can open the doors on the traffic side(right side) when",
      "opt": [
        "traffic is clear",
        "the car stop completely",
        "after signalling other cars to side"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 369,
      "que":
          "To park in a space where there is room for only one car.  You should",
      "opt": [
        "pull slowly into the parking space",
        "park carefully into the parking space",
        "park in front of the space"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 370,
      "que": "When your vehicle skid while driving, You should",
      "opt": [
        "turn steering both the left and right",
        "put on the brakes first",
        "turn the steering wheel in the direction of the car is skidding"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 371,
      "que": "Fitment of a multi toned horn in a vehicle is",
      "opt": [
        "allowed",
        "not recommended since it is a costly alternative",
        "is against law"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 372,
      "que": "Flashing yellow traffic light means",
      "opt": [
        "continue at the same speed",
        "stop, if possible to do so.",
        "slow down and proceed with caution"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 373,
      "que":
          "When you observe a yellow traffic light glowing  in an intersection, you should",
      "opt": [
        "hurry to cross",
        "stop at the stop line",
        "proceed across the intersection with caution"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 374,
      "que": "A flashing red light means",
      "opt": [
        "stop and proceed with caution",
        "slow sign",
        "yield right of way sign"
      ],
      "ra": 0,
      "img": "assest/images/que/image171.png",
      "point": 1
    },
    {
      "id": 375,
      "que":
          "When you are approaching a round to which you are about to enter you should",
      "opt": [
        "continue into the circular traffic at slow speed",
        "give way to the vehicles coming from the right direction",
        "use the outside lane only"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 376,
      "que":
          "When you approach an intersection and you are in main road without traffic lights, police man and traffic signs, you should",
      "opt": [
        "slow down and be cautious to negotiate the intersection",
        "come to full stop and proceed with caution",
        "not change speed if the way is clear"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 377,
      "que": "Emergency vehicles means",
      "opt": [
        "road rollers and cranes",
        "mobile automobile work shop",
        "ambulance and fire service vehicles"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 378,
      "que": "Drivers should not sound horn",
      "opt": ["in one way", "on main road", "at silent zone"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 379,
      "que": "Registration numbers  should be illuminated by",
      "opt": ["red light", "white light", "blue light"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 380,
      "que": "Mandatory signs are exhibited in",
      "opt": [
        "circular shape except stop and give way signs",
        "triangular shape",
        "rectangular shape"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 381,
      "que": "Cautionary signs are exhibited in",
      "opt": ["circular shape", "triangular shape", "rectangular shape"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 382,
      "que": "Informative signs are exhibited in",
      "opt": ["circular shape", "triangular shape", "rectangular shape"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 383,
      "que": "A school bus can be identified by",
      "opt": ["Creame yellow paint", "red paint", "green paint"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 384,
      "que":
          "While you intend to take a right or left turn, the sequence of action which you have to do",
      "opt": [
        "gear -mirror- signal",
        "mirror-gear-signal",
        "signal-gear-mirror"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 385,
      "que":
          "The sequence of operation when your vehicle moves from a stationary position are",
      "opt": [
        "mirror-start-gear- signal-move",
        "start-gear-mirror-signal- move",
        "start-mirror-signal-gear- move"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 386,
      "que": "The safe way to stop the vehicle",
      "opt": [
        "press clutch and then brake",
        "press brake and then clutch",
        "press clutch and brake simultaneously"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 387,
      "que": "The safest way to negotiate to steep descent",
      "opt": [
        "use higher torque gear with brake",
        "use top gear with brake",
        "use brake and clutch simultaneously"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 388,
      "que": "If your vehicle became break down during night",
      "opt": [
        "stop, use hand brake and exhibit hazardous warning light",
        "stop and exhibit red light",
        "leave the vehicle"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 389,
      "que": "When a cow is standing across the road",
      "opt": [
        "wait until it clears the road",
        "pass it from front",
        "pass it from behind"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 390,
      "que": "Painting olive green in a private motor car is",
      "opt": ["not permitted", "permitted", "special permission is required"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 391,
      "que": "For higher power, the gear to be used",
      "opt": ["1st gear", "top gear", "2nd gear"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 392,
      "que": "Abrupt braking by driver",
      "opt": [
        "is allowed for safety reason",
        "is not encouraged",
        "is allowed in busy roads"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 393,
      "que": "Vehicle with left hand controls",
      "opt": [
        "can be used",
        "cannot be used",
        "can be used with signalling device only"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 394,
      "que": "An accident victim can be treated by",
      "opt": [
        "only a government hospital doctor",
        "any registered medical practitioner or doctor",
        "by the driver"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 395,
      "que":
          "While parking your vehicle on a downward gradient, in addition to the application of hand brake, the gear engaged should be",
      "opt": ["neutral gear", "first gear", "reverse gear"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 396,
      "que": "While turning to right or left it is more safe if you",
      "opt": [
        "use only indicators",
        "show only hand signal",
        "use both light indicators and hand signal"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 397,
      "que": "A driver shall drive in one way",
      "opt": [
        "only in the direction specified by the sign board",
        "reverse direction in emergencies",
        "both ways on sundays"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 398,
      "que":
          "On ghat roads, when vehicles approach from the opposite sides the driver travelling down hill shall",
      "opt": [
        "drive fast before the opposite vehicle enters",
        "switch on the head lights and take way",
        "give preference to the vehicles going up"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 399,
      "que":
          "When you leave a vehicle in a dangerous position, you are inviting action under",
      "opt": ["section 121", "section 122", "serction 185"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 400,
      "que":
          "Driving under the influence of drugs or alcohol invites actions under",
      "opt": ["section 121", "section 125", "section 185"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 401,
      "que":
          "Section 131 of MV Act 1988 lays down the duties of the driver_x000D_",
      "opt": [
        "regarding the limits of weight",
        "regarding the signal and signalling devices",
        "regarding the precautions at unguarded railway level crossing"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 402,
      "que": "Maximum speed limit of an Ambulance",
      "opt": ["60 km/hr", "70km/hr", "80km/hr"],
      "ra": 0,
      "point": 1
    },
    {
      "id": 403,
      "que":
          "Whether audio-visual equipments are permitted in any class of vehicle? if so, in which class",
      "opt": ["stage carriage", "contract carriage  except AR", "E.I.B"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 404,
      "que": "Under which circumstance you will avoid overtaking",
      "opt": [
        "after a curve",
        "on a curve",
        "when the visibility ahead is clear"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 405,
      "que": "Which type of parking is more suitable on wide roads",
      "opt": ["in line", "parallel", "inclined"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 406,
      "que":
          "When a pedastrian Steps in to a zebra line in front of you to cross the road",
      "opt": [
        "stop befor the stop line and treat it as a stop signal",
        "you have to proceed before him",
        "sound horn and speed up your vehicle to cross before him"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 407,
      "que": "Using mobile phone while driving can be punished with",
      "opt": [
        "A fine of Rs. 100/- only",
        "Disqualify from holding the driving licence Under CMVR 21(25)",
        "A fine of Rs. 500/- only"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 408,
      "que":
          "How many students aged 5 to 12 are permitted to travel in an auto rickshaw",
      "opt": [8, 7, 6],
      "ra": 2,
      "point": 1
    },
    {
      "id": 409,
      "que":
          "While driving behind a motor cycle on a badly maintained road you should",
      "opt": [
        "continuously blow horn",
        "over take immediately",
        "keep safe distance"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 410,
      "que": "If you are fined for any traffic violation, you must feel",
      "opt": ["proud", "humiliated", "to correct your attitude in future"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 411,
      "que": "If permitted, a  free  turn  can be taken in a junction",
      "opt": [
        "while taking a left turn",
        "while travelling straight",
        "while taking a right turn"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 412,
      "que": "Seat belts have to be used by",
      "opt": ["Driver only", "Front seat Passengers only", "Both"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 413,
      "que": "Over loading of any kind is",
      "opt": [
        "prohibited under law",
        "if the driver can control the vehicle safely",
        "allowed if the driver pays the fine"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 414,
      "que": "Not using seat belt can lead to a fine of",
      "opt": ["Rs. 250/-", "Rs. 50/-", "Rs. 100/-"],
      "ra": 2,
      "point": 1
    },
    {
      "id": 415,
      "que":
          "Driving by a drunken  driver  is punishable if the quantity of alcohol in blood",
      "opt": [
        "exceeds 30mg/100ml of blood",
        "below 30mg/100ml  blood",
        "exceeds 100mg/100 ml of blood"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 416,
      "que":
          "Person sitting or standing by the side of the driver causing inconvenience to control the vehicle",
      "opt": [
        "is allowed with the permission of the RTO",
        "is not allowed",
        "allowed in case of emergency"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 417,
      "que": "Vehicle with left hand steering control shall be used",
      "opt": [
        "by displaying a board caution left hand drive",
        "by using light or mechanical indicator system",
        "by using both of the above"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 418,
      "que": "This sign means",
      "opt": ["Road divides", "Staggerd junction ahead", "median ahead"],
      "ra": 1,
      "img": "assest/images/que/image173.png",
      "point": 1
    },
    {
      "id": 419,
      "que": "Carrying of load which projects backwards beyond the vehicle is",
      "opt": [
        "always permitted",
        "permitted only to extend upto one meter from the rear end of the vehicle  with suitable warning lights or flags",
        "not permitted"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 420,
      "que":
          "How can we overcome the reduction of braking action after water servicing",
      "opt": [
        "brakes shall be adjusted by a mechanic",
        "The vehicle to be withdrawn from the traffic at once",
        "by operating the brake at several times at a slow driving speed"
      ],
      "ra": 2,
      "point": 1
    },
    {
      "id": 421,
      "que":
          "Driver driving  a vehicle in a public place without a licence, is liable for",
      "opt": [
        "penalty only",
        "penalty  for the driver and the owner and/ or  seizure of vehicle",
        "warning"
      ],
      "ra": 1,
      "point": 1
    },
    {
      "id": 422,
      "que": "In this road you should not",
      "opt": [
        "Park the vehicle",
        "Slow the vehicle",
        "Overtake another vehicle"
      ],
      "ra": 0,
      "img": "assest/images/que/image175.png",
      "point": 1
    },
    {
      "id": 423,
      "que":
          "Can we allow any person to travel along with the driver of a tractor",
      "opt": ["yes", "No", "Up to 2 persons are permitted"],
      "ra": 1,
      "point": 1
    },
    {
      "id": 424,
      "que":
          "When the visibility becomes very low, during the day time in rainy season, the driver shall",
      "opt": [
        "use head light",
        "make sure that wiper blades are not old",
        "none of the above"
      ],
      "ra": 0,
      "point": 1
    },
    {
      "id": 425,
      "que": "What this road means?",
      "opt": ["Lane Traffic", "Road Divides", "One way"],
      "ra": 0,
      "img": "assest/images/que/image177.png",
      "point": 1
    },
    {
      "id": 426,
      "que": "Yellow line means ?",
      "opt": ["No parking", "Stop Line", "Do not overtake"],
      "ra": 2,
      "img": "assest/images/que/image179.png",
      "point": 1
    },
    {
      "id": 427,
      "que": "What these Line means ?",
      "opt": ["It act as a median", "No parking", "No Stopping"],
      "ra": 0,
      "img": "assest/images/que/image181.png",
      "point": 1
    },
    {
      "id": 428,
      "que": "A flashing yellow at an intersection means ?",
      "opt": ["Proceed with caution", "Stop and proceed", "Proceed fast"],
      "ra": 0,
      "img": "assest/images/que/image183.png",
      "point": 1
    },
    {
      "id": 429,
      "que": "What is this line means?",
      "opt": ["Two line traffic", "Road divides", "Lane traffic"],
      "ra": 0,
      "img": "assest/images/que/image185.png",
      "point": 1
    },
    {
      "id": 430,
      "que": "The picture shows",
      "opt": ["Tail gating", "Safe distance", "Follow the vehicle"],
      "ra": 1,
      "img": "assest/images/que/image187.png",
      "point": 1
    },
    {
      "id": 431,
      "que": "What is indicated by these on the instrument console?",
      "opt": ["warning lamps", "Road signs", "Hazard lamp"],
      "ra": 0,
      "img": "assest/images/que/image189.png",
      "point": 1
    },
    //extra question
    {
      "id": 432,
      "que": "A flashing yellow at an intersection means ?",
      "opt": ["Proceed with caution", "Stop and proceed", "Proceed fast"],
      "ra": 0,
      "img": "assest/images/que/image183.png",
      "point": 1
    },
    {
      "id": 433,
      "que": "What is this line means?",
      "opt": ["Two line traffic", "Road divides", "Lane traffic"],
      "ra": 0,
      "img": "assest/images/que/image185.png",
      "point": 1
    },
    {
      "id": 434,
      "que": "The picture shows",
      "opt": ["Tail gating", "Safe distance", "Follow the vehicle"],
      "ra": 1,
      "img": "assest/images/que/image187.png",
      "point": 1
    },
  ];

  int sequence = 1;
  int questionCompleted = 0;

  int range = 0;
  int start = 0;

  int selectedAns = -1;

  int currentQuestion = 0;
  bool startTest = false;
  bool endTest = false;

  void setSequence(int val) {
    sequence = val;
  }

  void setCompletedQue() {
    ++questionCompleted;
  }

  void setRange(int val) {
    range = val;
  }

  void setStart(int val) {
    start = val;
  }

  void setStartingQue() {
    currentQuestion = start;
  }

  void setSelectedAns(int val) {
    selectedAns = val;
    notifyListeners();
  }

  void changeStartTest() {
    startTest = !startTest;
    notifyListeners();
  }

  void nextQuestion() {
    currentQuestion += sequence;
    setCompletedQue();
    notifyListeners();
  }

  void changeEndTest() {
    endTest = !endTest;
    notifyListeners();
  }

  int skipedQuestion = 0;
  int wrongAnswers = 0;
  int rightAnswer = 0;

  void setSkip(int val) {
    skipedQuestion = val;
    notifyListeners();
  }

  void setWrongAnswer(int val) {
    wrongAnswers = val;
    notifyListeners();
  }

  void setRightAnswer(int val) {
    rightAnswer = val;
    notifyListeners();
  }
}
