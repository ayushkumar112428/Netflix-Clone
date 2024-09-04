import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';
import 'package:netflixclone/widget/reviews_card.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  bool myList = false;
  bool like = false;
  String movieName = "Deadpool & Wolverine";

  // timestamp
  late String timestamp;
  late String formattedDate;
  Map<String, dynamic> moveCastDetails = {
    "id": 533535,
    "cast": [
      {
        "adult": false,
        "gender": 2,
        "id": 10859,
        "known_for_department": "Acting",
        "name": "Ryan Reynolds",
        "original_name": "Ryan Reynolds",
        "popularity": 100.901,
        "profile_path": "/2Orm6l3z3zukF1q0AgIOUqvwLeB.jpg",
        "cast_id": 252,
        "character": "Wade Wilson / Deadpool / Nicepool",
        "credit_id": "66a0eeb7fadd7c4c9c38207f",
        "order": 0
      },
      {
        "adult": false,
        "gender": 2,
        "id": 6968,
        "known_for_department": "Acting",
        "name": "Hugh Jackman",
        "original_name": "Hugh Jackman",
        "popularity": 94.68,
        "profile_path": "/4Xujtewxqt6aU0Y81tsS9gkjizk.jpg",
        "cast_id": 253,
        "character": "Logan / Wolverine",
        "credit_id": "66a0eef54192f70fea09dc90",
        "order": 1
      },
      {
        "adult": false,
        "gender": 3,
        "id": 2324569,
        "known_for_department": "Acting",
        "name": "Emma Corrin",
        "original_name": "Emma Corrin",
        "popularity": 60.217,
        "profile_path": "/w4gFlPOqdSMRSH1dsuqQMKCGBWg.jpg",
        "cast_id": 254,
        "character": "Cassandra Nova",
        "credit_id": "66a0ef1ca5ab9d9f3d705ed1",
        "order": 2
      },
      {
        "adult": false,
        "gender": 2,
        "id": 15576,
        "known_for_department": "Acting",
        "name": "Matthew Macfadyen",
        "original_name": "Matthew Macfadyen",
        "popularity": 38.588,
        "profile_path": "/2FF3Yjxd7DYR4EIJL6s2GpKDMkJ.jpg",
        "cast_id": 256,
        "character": "Mr. Paradox",
        "credit_id": "66a0ef54aab1abca4f09e107",
        "order": 3
      },
      {
        "adult": false,
        "gender": 1,
        "id": 1464650,
        "known_for_department": "Acting",
        "name": "Dafne Keen",
        "original_name": "Dafne Keen",
        "popularity": 58.137,
        "profile_path": "/g325OIjIHrFr0te8ewPfhKQ2SKj.jpg",
        "cast_id": 271,
        "character": "Laura / X-23",
        "credit_id": "66a0f13d76eb26a1ca381cc0",
        "order": 4
      },
      {
        "adult": false,
        "gender": 2,
        "id": 15277,
        "known_for_department": "Acting",
        "name": "Jon Favreau",
        "original_name": "Jon Favreau",
        "popularity": 33.839,
        "profile_path": "/tnx7iMVydPQXGOoLsxXl84PXtbA.jpg",
        "cast_id": 278,
        "character": "Happy Hogan",
        "credit_id": "66a0f232a9212776c5e0d638",
        "order": 5
      },
      {
        "adult": false,
        "gender": 1,
        "id": 54882,
        "known_for_department": "Acting",
        "name": "Morena Baccarin",
        "original_name": "Morena Baccarin",
        "popularity": 86.18,
        "profile_path": "/kBSKKaOtsqIzZPhtEeHfCBmhWl9.jpg",
        "cast_id": 255,
        "character": "Vanessa",
        "credit_id": "66a0ef353e68414965705f0c",
        "order": 6
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1091324,
        "known_for_department": "Acting",
        "name": "Rob Delaney",
        "original_name": "Rob Delaney",
        "popularity": 11.753,
        "profile_path": "/xirfT1znRkkughLiPemKu3NhkKQ.jpg",
        "cast_id": 261,
        "character": "Peter",
        "credit_id": "66a0f01b537cac04b109e17e",
        "order": 7
      },
      {
        "adult": false,
        "gender": 1,
        "id": 122750,
        "known_for_department": "Acting",
        "name": "Leslie Uggams",
        "original_name": "Leslie Uggams",
        "popularity": 23.356,
        "profile_path": "/peLaqLcs3y2WY4TbrLOXQGt9I8S.jpg",
        "cast_id": 259,
        "character": "Blind Al",
        "credit_id": "66a0efdb073923ad4918be52",
        "order": 8
      },
      {
        "adult": false,
        "gender": 1,
        "id": 9278,
        "known_for_department": "Acting",
        "name": "Jennifer Garner",
        "original_name": "Jennifer Garner",
        "popularity": 71.357,
        "profile_path": "/ftymEXqdTnXfaI6dGd9qrJoFOSE.jpg",
        "cast_id": 258,
        "character": "Elektra",
        "credit_id": "66a0efbef3ce01f00535f865",
        "order": 9
      },
      {
        "adult": false,
        "gender": 2,
        "id": 10814,
        "known_for_department": "Acting",
        "name": "Wesley Snipes",
        "original_name": "Wesley Snipes",
        "popularity": 45.163,
        "profile_path": "/81D6oJ81kiQ5xnEHhaHrY29ntdO.jpg",
        "cast_id": 272,
        "character": "Blade",
        "credit_id": "66a0f1546aef695b11dd76e5",
        "order": 10
      },
      {
        "adult": false,
        "gender": 2,
        "id": 38673,
        "known_for_department": "Acting",
        "name": "Channing Tatum",
        "original_name": "Channing Tatum",
        "popularity": 95.972,
        "profile_path": "/4TpgnS6l8YUXSne9Av9nda6mjxY.jpg",
        "cast_id": 274,
        "character": "Gambit",
        "credit_id": "66a0f19973c78cc0c05dadf0",
        "order": 11
      },
      {
        "adult": false,
        "gender": 2,
        "id": 16828,
        "known_for_department": "Acting",
        "name": "Chris Evans",
        "original_name": "Chris Evans",
        "popularity": 58.431,
        "profile_path": "/3bOGNsHlrswhyW79uvIHH1V43JI.jpg",
        "cast_id": 288,
        "character": "Johnny Storm",
        "credit_id": "66a10565ceae5015037060b3",
        "order": 12
      },
      {
        "adult": false,
        "gender": 2,
        "id": 73968,
        "known_for_department": "Acting",
        "name": "Henry Cavill",
        "original_name": "Henry Cavill",
        "popularity": 87.287,
        "profile_path": "/iWdKjMry5Pt7vmxU7bmOQsIUyHa.jpg",
        "cast_id": 280,
        "character": "The Cavillrine",
        "credit_id": "66a0f26fbffb534f84e0d621",
        "order": 13
      },
      {
        "adult": false,
        "gender": 1,
        "id": 134774,
        "known_for_department": "Acting",
        "name": "Wunmi Mosaku",
        "original_name": "Wunmi Mosaku",
        "popularity": 21.961,
        "profile_path": "/mWDsVCo9sBcekrsjUTsoCFLhtYt.jpg",
        "cast_id": 277,
        "character": "B-15",
        "credit_id": "66a0f20f1e7b0e8bf5dd7752",
        "order": 14
      },
      {
        "adult": false,
        "gender": 2,
        "id": 11022,
        "known_for_department": "Acting",
        "name": "Aaron Stanford",
        "original_name": "Aaron Stanford",
        "popularity": 10.68,
        "profile_path": "/xt2c0vdTb6UmSFq6fl09iCcIFve.jpg",
        "cast_id": 265,
        "character": "Pyro",
        "credit_id": "66a0f09a3631af76bb09dac3",
        "order": 15
      },
      {
        "adult": false,
        "gender": 2,
        "id": 9832,
        "known_for_department": "Acting",
        "name": "Tyler Mane",
        "original_name": "Tyler Mane",
        "popularity": 25.917,
        "profile_path": "/h5knoBWStVv7a0FKPwfKV7f7Ez1.jpg",
        "cast_id": 266,
        "character": "Sabretooth",
        "credit_id": "66a0f0b53eaae4a1e3bf6473",
        "order": 16
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1109702,
        "known_for_department": "Acting",
        "name": "Karan Soni",
        "original_name": "Karan Soni",
        "popularity": 20.819,
        "profile_path": "/t3eNrzRKy3wTVCUiEp002UXbjxX.jpg",
        "cast_id": 263,
        "character": "Dopinder",
        "credit_id": "66a0f06295bbae847e381c4f",
        "order": 17
      },
      {
        "adult": false,
        "gender": 1,
        "id": 1492326,
        "known_for_department": "Acting",
        "name": "Brianna Hildebrand",
        "original_name": "Brianna Hildebrand",
        "popularity": 28.772,
        "profile_path": "/8lGwV4rMQReWMlsXhLBYMRTYzTA.jpg",
        "cast_id": 257,
        "character": "Negasonic Teenage Warhead",
        "credit_id": "66a0efa41570ed494f18bd16",
        "order": 18
      },
      {
        "adult": false,
        "gender": 1,
        "id": 230660,
        "known_for_department": "Acting",
        "name": "Shioli Kutsuna",
        "original_name": "忽那 汐里",
        "popularity": 34.287,
        "profile_path": "/5EdMbcRIemzLszjEr36Ic0Obmdb.jpg",
        "cast_id": 264,
        "character": "Yukio",
        "credit_id": "66a0f0811570ed494f18bd26",
        "order": 19
      },
      {
        "adult": false,
        "gender": 2,
        "id": 80507,
        "known_for_department": "Acting",
        "name": "Stefan Kapicic",
        "original_name": "Stefan Kapicic",
        "popularity": 14.862,
        "profile_path": "/6qHO7ckiyjLNOmW0v5RZj1MpLBj.jpg",
        "cast_id": 260,
        "character": "Colossus (voice)",
        "credit_id": "66a0eff7958531da34bf6286",
        "order": 20
      },
      {
        "adult": false,
        "gender": 2,
        "id": 215887,
        "known_for_department": "Acting",
        "name": "Randal Reeder",
        "original_name": "Randal Reeder",
        "popularity": 19.088,
        "profile_path": "/eJfW7w36Vl8dEnN9T2dnlkUReWG.jpg",
        "cast_id": 279,
        "character": "Buck",
        "credit_id": "66a0f2536e2a098d255dad9b",
        "order": 21
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1610940,
        "known_for_department": "Acting",
        "name": "Lewis Tan",
        "original_name": "Lewis Tan",
        "popularity": 17.501,
        "profile_path": "/ik347wakcZRfULiLbjGJpRcqSQz.jpg",
        "cast_id": 262,
        "character": "Shatterstar",
        "credit_id": "66a0f0364f446414cf0bea38",
        "order": 22
      },
      {
        "adult": false,
        "gender": 2,
        "id": 4561764,
        "known_for_department": "Acting",
        "name": "Nick Pauley",
        "original_name": "Nick Pauley",
        "popularity": 0.001,
        "profile_path": "/9cJGBxmPiZ21C71DueJLDOuPc5c.jpg",
        "cast_id": 301,
        "character": "Dancepool",
        "credit_id": "66a1f00aadc660b3fb265bf9",
        "order": 23
      },
      {
        "adult": false,
        "gender": 1,
        "id": 963257,
        "known_for_department": "Acting",
        "name": "Sonita Henry",
        "original_name": "Sonita Henry",
        "popularity": 27.889,
        "profile_path": "/oIBILFSVqHT2warKlXSPDML3llI.jpg",
        "cast_id": 302,
        "character": "Mrs. Chipman",
        "credit_id": "66a1f015c7271d45f9cf8367",
        "order": 24
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1850835,
        "known_for_department": "Acting",
        "name": "Ryan McKen",
        "original_name": "Ryan McKen",
        "popularity": 2.141,
        "profile_path": "/lGVReBLi74MCxaCBr2KBx1zTiWV.jpg",
        "cast_id": 303,
        "character": "Mr. Chipman",
        "credit_id": "66a1f023a9212776c5e0fc39",
        "order": 25
      },
      {
        "adult": false,
        "gender": 0,
        "id": 4848497,
        "known_for_department": "Acting",
        "name": "Nanak Phlora",
        "original_name": "Nanak Phlora",
        "popularity": 0.788,
        "profile_path": null,
        "cast_id": 304,
        "character": "Elliot Chipman",
        "credit_id": "66a1f035a830bd008f088731",
        "order": 26
      },
      {
        "adult": false,
        "gender": 0,
        "id": 4848499,
        "known_for_department": "Acting",
        "name": "Aydin Ahmed",
        "original_name": "Aydin Ahmed",
        "popularity": 0.08,
        "profile_path": null,
        "cast_id": 305,
        "character": "Kevin Chipman",
        "credit_id": "66a1f063eb5b530b3acf829e",
        "order": 27
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1649401,
        "known_for_department": "Acting",
        "name": "Leemore Marrett Jr.",
        "original_name": "Leemore Marrett Jr.",
        "popularity": 6.615,
        "profile_path": "/lrr8xbevZFfCMixuSPnUjwO2Oqa.jpg",
        "cast_id": 306,
        "character": "Minuteman Leader",
        "credit_id": "66a1f075fd5d5c9bfedda32c",
        "order": 28
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1587576,
        "known_for_department": "Acting",
        "name": "James Dryden",
        "original_name": "James Dryden",
        "popularity": 12.41,
        "profile_path": "/1Z3CjM13uhOlt6dUyHaewkBjUcO.jpg",
        "cast_id": 307,
        "character": "TVA Tech",
        "credit_id": "66a1f086bcf6b96327f78c14",
        "order": 29
      },
      {
        "adult": false,
        "gender": 2,
        "id": 4698632,
        "known_for_department": "Acting",
        "name": "Ollie Palmer",
        "original_name": "Ollie Palmer",
        "popularity": 0.477,
        "profile_path": "/kICsR18nsLMjxMrIWjJKtOsAkJj.jpg",
        "cast_id": 308,
        "character": "Bar Patron",
        "credit_id": "66a1f0a22b0919f669a0d0ba",
        "order": 30
      },
      {
        "adult": false,
        "gender": 2,
        "id": 167008,
        "known_for_department": "Acting",
        "name": "Greg Hemphill",
        "original_name": "Greg Hemphill",
        "popularity": 5.249,
        "profile_path": "/juE0ZmdUbxfMBhtOz9LBV8MiLKH.jpg",
        "cast_id": 281,
        "character": "Seedy Bartender",
        "credit_id": "66a0f2914194f9b3d7dd7722",
        "order": 31
      },
      {
        "adult": false,
        "gender": 2,
        "id": 3158217,
        "known_for_department": "Acting",
        "name": "Aaron W Reed",
        "original_name": "Aaron W Reed",
        "popularity": 22.728,
        "profile_path": "/e9dW9ezNxeGEu8MnQ1NTOz3PM93.jpg",
        "cast_id": 323,
        "character": "Juggernaut",
        "credit_id": "66a301b3073923ad4918fbc1",
        "order": 32
      },
      {
        "adult": false,
        "gender": 0,
        "id": 4854075,
        "known_for_department": "Acting",
        "name": "Mike Waters",
        "original_name": "Mike Waters",
        "popularity": 0.513,
        "profile_path": null,
        "cast_id": 329,
        "character": "Blob",
        "credit_id": "66a6881cef66779c2a40bae8",
        "order": 33
      },
      {
        "adult": false,
        "gender": 2,
        "id": 78597,
        "known_for_department": "Acting",
        "name": "Rob McElhenney",
        "original_name": "Rob McElhenney",
        "popularity": 17.573,
        "profile_path": "/gcep3ItyxaZ3ljH1IS6Lfkm8IAs.jpg",
        "cast_id": 330,
        "character": "TVA Soldier",
        "credit_id": "66a6886032810e2e630954ff",
        "order": 34
      },
      {
        "adult": false,
        "gender": 1,
        "id": 4854086,
        "known_for_department": "Acting",
        "name": "James Reynolds",
        "original_name": "James Reynolds",
        "popularity": 0.598,
        "profile_path": null,
        "cast_id": 331,
        "character": "Screaming Mutant (voice)",
        "credit_id": "66a688dce1321cc4eb7463d4",
        "order": 35
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1364950,
        "known_for_department": "Acting",
        "name": "Ed Kear",
        "original_name": "Ed Kear",
        "popularity": 14.015,
        "profile_path": "/jB1QY1DSN253bbtz51MHXEBj9O8.jpg",
        "cast_id": 309,
        "character": "Outpost Tech",
        "credit_id": "66a1f0ddd9ec811948cf8314",
        "order": 36
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1951011,
        "known_for_department": "Acting",
        "name": "Paul G. Raymond",
        "original_name": "Paul G. Raymond",
        "popularity": 2.382,
        "profile_path": "/28pPNcmHZuH4XM4eUHoFGZF6LGA.jpg",
        "cast_id": 310,
        "character": "TVA Office Agent",
        "credit_id": "66a1f0e8e455b7e8af18e453",
        "order": 37
      },
      {
        "adult": false,
        "gender": 1,
        "id": 59175,
        "known_for_department": "Acting",
        "name": "Blake Lively",
        "original_name": "Blake Lively",
        "popularity": 63.2,
        "profile_path": "/rkGVjd6wImtgjOCi0IpeffdEWtb.jpg",
        "cast_id": 313,
        "character": "Ladypool (voice)",
        "credit_id": "66a1f42ebffb534f84e0fe30",
        "order": 38
      },
      {
        "adult": false,
        "gender": 0,
        "id": 4846410,
        "known_for_department": "Acting",
        "name": "Inez Reynolds",
        "original_name": "Inez Reynolds",
        "popularity": 1.036,
        "profile_path": null,
        "cast_id": 318,
        "character": "Kidpool (voice)",
        "credit_id": "66a30047f807a42be983c2e1",
        "order": 39
      },
      {
        "adult": false,
        "gender": 2,
        "id": 51797,
        "known_for_department": "Acting",
        "name": "Nathan Fillion",
        "original_name": "Nathan Fillion",
        "popularity": 62.143,
        "profile_path": "/aW6vCxkUZtwb6iH2Wf88Uq0XNVv.jpg",
        "cast_id": 319,
        "character": "Headpool (voice)",
        "credit_id": "66a300706efb745b63d4f23e",
        "order": 40
      },
      {
        "adult": false,
        "gender": 2,
        "id": 10297,
        "known_for_department": "Acting",
        "name": "Matthew McConaughey",
        "original_name": "Matthew McConaughey",
        "popularity": 39.94,
        "profile_path": "/rUxLWWCDUF8RnDaocSqrVDJ2MS1.jpg",
        "cast_id": 314,
        "character": "Cowboypool (voice)",
        "credit_id": "66a201662f9da16572383f13",
        "order": 41
      },
      {
        "adult": false,
        "gender": 0,
        "id": 4850040,
        "known_for_department": "Acting",
        "name": "OIin Reynolds",
        "original_name": "OIin Reynolds",
        "popularity": 0.777,
        "profile_path": null,
        "cast_id": 320,
        "character": "Babypool (voice)",
        "credit_id": "66a300856056ca7331cf98a2",
        "order": 42
      },
      {
        "adult": false,
        "gender": 0,
        "id": 4338091,
        "known_for_department": "Acting",
        "name": "Paul Mullin",
        "original_name": "Paul Mullin",
        "popularity": 0.602,
        "profile_path": "/bZZ4wvdMJtt6aPUSQAAY4G7mzbe.jpg",
        "cast_id": 321,
        "character": "Welshpool",
        "credit_id": "66a30099f410fb5dd314f3ab",
        "order": 43
      },
      {
        "adult": false,
        "gender": 2,
        "id": 2280082,
        "known_for_department": "Crew",
        "name": "Alex Kyshkovych",
        "original_name": "Alex Kyshkovych",
        "popularity": 6.769,
        "profile_path": "/nyy5o659Z1LfLl9ckRT1FiNop4U.jpg",
        "cast_id": 322,
        "character": "Canadapool",
        "credit_id": "66a300a949a40fe7d55d46de",
        "order": 44
      },
      {
        "adult": false,
        "gender": 2,
        "id": 74568,
        "known_for_department": "Acting",
        "name": "Chris Hemsworth",
        "original_name": "Chris Hemsworth",
        "popularity": 48.689,
        "profile_path": "/piQGdoIQOF3C1EI5cbYZLAW1gfj.jpg",
        "cast_id": 333,
        "character": "Thor Odinson (archive footage) (uncredited)",
        "credit_id": "66a7ee63db5ac8177656c57b",
        "order": 45
      },
      {
        "adult": false,
        "gender": 2,
        "id": 2423284,
        "known_for_department": "Crew",
        "name": "Billy Clements",
        "original_name": "Billy Clements",
        "popularity": 4.463,
        "profile_path": "/nipJ22DXJBsdM1teQodwop42U6S.jpg",
        "cast_id": 332,
        "character": "Russian (uncredited)",
        "credit_id": "66a6899a1156084b5fdaf78d",
        "order": 46
      },
      {
        "adult": false,
        "gender": 2,
        "id": 4857614,
        "known_for_department": "Acting",
        "name": "Daniel Medina Ramos",
        "original_name": "Daniel Medina Ramos",
        "popularity": 0.861,
        "profile_path": "/3ZmlKGTlBF09ZxmoOH9lB1xdsf2.jpg",
        "cast_id": 335,
        "character": "Toad (uncredited)",
        "credit_id": "66a8ff8cb47e5a4ccdebc6c0",
        "order": 47
      },
      {
        "adult": false,
        "gender": 1,
        "id": 4115448,
        "known_for_department": "Crew",
        "name": "Jade Lye",
        "original_name": "Jade Lye",
        "popularity": 6.522,
        "profile_path": "/4r1zrh8Wf32W74fltUn37Uz2FfV.jpg",
        "cast_id": 337,
        "character": "Lady Deathstrike (uncredited)",
        "credit_id": "66a96e46f9c9f9f3a4e3aca7",
        "order": 48
      },
      {
        "adult": false,
        "gender": 0,
        "id": 4858600,
        "known_for_department": "Crew",
        "name": "Nilly Cetin",
        "original_name": "Nilly Cetin",
        "popularity": 1.05,
        "profile_path": "/vLKWIjSztXEHUOMFolVudij4jbs.jpg",
        "cast_id": 339,
        "character": "Quill (uncredited)",
        "credit_id": "66a97034b2bfdd9e37837c54",
        "order": 49
      },
      {
        "adult": false,
        "gender": 2,
        "id": 2423287,
        "known_for_department": "Crew",
        "name": "Eduardo Gago Muñoz",
        "original_name": "Eduardo Gago Muñoz",
        "popularity": 3.358,
        "profile_path": "/r9DaaOfiACoUX7Ezs63K8DZrpHI.jpg",
        "cast_id": 341,
        "character": "Azazel (uncredited)",
        "credit_id": "66a971ad9f6dabe412bfccf3",
        "order": 50
      },
      {
        "adult": false,
        "gender": 0,
        "id": 4858628,
        "known_for_department": "Crew",
        "name": "Chloe Kibble",
        "original_name": "Chloe Kibble",
        "popularity": 0.86,
        "profile_path": "/6jgp3IJenhe9R1cdV25gfzlSDpy.jpg",
        "cast_id": 344,
        "character": "Callisto (uncredited)",
        "credit_id": "66a9757cdca616e20759c86c",
        "order": 51
      },
      {
        "adult": false,
        "gender": 0,
        "id": 2151833,
        "known_for_department": "Crew",
        "name": "Curtis Rowland Small",
        "original_name": "Curtis Rowland Small",
        "popularity": 2.426,
        "profile_path": "/lgAOeihmiZ2CdKWpa35BxpBeSiK.jpg",
        "cast_id": 346,
        "character": "Bullseye (uncredited)",
        "credit_id": "66a9773bfd1353a12e837c7e",
        "order": 52
      },
      {
        "adult": false,
        "gender": 1,
        "id": 4733517,
        "known_for_department": "Crew",
        "name": "Ayesha Hussain",
        "original_name": "Ayesha Hussain",
        "popularity": 0.001,
        "profile_path": "/7bChdeG2k7GoAf8nG12p05Ssrbe.jpg",
        "cast_id": 347,
        "character": "Psylocke (uncredited)",
        "credit_id": "66a9789265780b6119cd19ed",
        "order": 53
      },
      {
        "adult": false,
        "gender": 0,
        "id": 4858668,
        "known_for_department": "Crew",
        "name": "Jessica Walker",
        "original_name": "Jessica Walker",
        "popularity": 1.159,
        "profile_path": "/5fZ41rVpPKI5VpBFt2dBRcOaHtL.jpg",
        "cast_id": 349,
        "character": "Arclight (uncredited)",
        "credit_id": "66a979ebb2bfdd9e37837c98",
        "order": 54
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1674196,
        "known_for_department": "Acting",
        "name": "Harry Holland",
        "original_name": "Harry Holland",
        "popularity": 17.359,
        "profile_path": "/8gsfzGUySLLaT0GCzuWxAfLWOWS.jpg",
        "cast_id": 334,
        "character": "Haroldpool (uncredited)",
        "credit_id": "66a806f50fb65ccb569fd9ee",
        "order": 55
      },
      {
        "adult": false,
        "gender": 2,
        "id": 3411282,
        "known_for_department": "Crew",
        "name": "Kevin Fortin",
        "original_name": "Kevin Fortin",
        "popularity": 3.319,
        "profile_path": "/bRBUOhX9Oc0A2nNARsP4jkoDzva.jpg",
        "cast_id": 350,
        "character": "Zenpool (uncredited)",
        "credit_id": "66ade5ed089fe1f033c05828",
        "order": 56
      }
    ],
    "crew": [
      {
        "adult": false,
        "gender": 2,
        "id": 17825,
        "known_for_department": "Directing",
        "name": "Shawn Levy",
        "original_name": "Shawn Levy",
        "popularity": 25.036,
        "profile_path": "/j1CXZgmfvFeD7S3PYtsEk8H3ebB.jpg",
        "credit_id": "622bc4c8a579f9006f1f0a6d",
        "department": "Directing",
        "job": "Director"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 7932,
        "known_for_department": "Writing",
        "name": "Rhett Reese",
        "original_name": "Rhett Reese",
        "popularity": 9.673,
        "profile_path": "/8QjgT3ffjzSTfih5C0LpFEea5Ps.jpg",
        "credit_id": "622be2de9a358d0071934f94",
        "department": "Writing",
        "job": "Writer"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 91269,
        "known_for_department": "Writing",
        "name": "Paul Wernick",
        "original_name": "Paul Wernick",
        "popularity": 8.831,
        "profile_path": "/12wCVgUkLv7RejadXXZrtL8Tj5N.jpg",
        "credit_id": "622be2ea24f2ce001d7e0365",
        "department": "Writing",
        "job": "Writer"
      },
      {
        "adult": false,
        "gender": 1,
        "id": 1266574,
        "known_for_department": "Art",
        "name": "Naomi Moore",
        "original_name": "Naomi Moore",
        "popularity": 1.488,
        "profile_path": null,
        "credit_id": "654939e72866fa00e1f021d9",
        "department": "Art",
        "job": "Set Decoration"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 24192,
        "known_for_department": "Sound",
        "name": "Dave Jordan",
        "original_name": "Dave Jordan",
        "popularity": 11.576,
        "profile_path": "/btzUgkKCllxClxIgLhmhZ1qaPw.jpg",
        "credit_id": "65493a401ac2927b3028ca48",
        "department": "Sound",
        "job": "Music Supervisor"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1842127,
        "known_for_department": "Editing",
        "name": "Shane Reid",
        "original_name": "Shane Reid",
        "popularity": 1.182,
        "profile_path": "/idptgX7GBTwqcM7WKKaChThDFQN.jpg",
        "credit_id": "656244223679a1097873b704",
        "department": "Editing",
        "job": "Editor"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 57027,
        "known_for_department": "Production",
        "name": "Louis D'Esposito",
        "original_name": "Louis D'Esposito",
        "popularity": 12.219,
        "profile_path": "/mPy6hxHrHoEOWdljLyZM6DNBSPn.jpg",
        "credit_id": "6333c20dd465370082a9ee7b",
        "department": "Production",
        "job": "Executive Producer"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 10859,
        "known_for_department": "Acting",
        "name": "Ryan Reynolds",
        "original_name": "Ryan Reynolds",
        "popularity": 100.901,
        "profile_path": "/2Orm6l3z3zukF1q0AgIOUqvwLeB.jpg",
        "credit_id": "6333da45eec4f300801b6800",
        "department": "Writing",
        "job": "Writer"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 10859,
        "known_for_department": "Acting",
        "name": "Ryan Reynolds",
        "original_name": "Ryan Reynolds",
        "popularity": 100.901,
        "profile_path": "/2Orm6l3z3zukF1q0AgIOUqvwLeB.jpg",
        "credit_id": "6333da1330f79c008f664626",
        "department": "Production",
        "job": "Producer"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 91269,
        "known_for_department": "Writing",
        "name": "Paul Wernick",
        "original_name": "Paul Wernick",
        "popularity": 8.831,
        "profile_path": "/12wCVgUkLv7RejadXXZrtL8Tj5N.jpg",
        "credit_id": "65c96038e4b5760164150eb9",
        "department": "Production",
        "job": "Executive Producer"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 11092,
        "known_for_department": "Production",
        "name": "Simon Kinberg",
        "original_name": "Simon Kinberg",
        "popularity": 13.734,
        "profile_path": "/3xvTvkIaKfU276cpajiAoGjvaaO.jpg",
        "credit_id": "65c9604c8d77c4017b471b14",
        "department": "Production",
        "job": "Executive Producer"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 71230,
        "known_for_department": "Production",
        "name": "Jonathon Komack Martin",
        "original_name": "Jonathon Komack Martin",
        "popularity": 1.579,
        "profile_path": "/iyFhEYrvbc5FH7YFMd7tTJi9oe3.jpg",
        "credit_id": "65c96053a93d2501844da71f",
        "department": "Production",
        "job": "Executive Producer"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 2385846,
        "known_for_department": "Production",
        "name": "George Dewey",
        "original_name": "George Dewey",
        "popularity": 1.532,
        "profile_path": "/or0HVsTZ5KsQvpI8ag0XNjFLUUv.jpg",
        "credit_id": "65c96043a93d2501634c1178",
        "department": "Production",
        "job": "Executive Producer"
      },
      {
        "adult": false,
        "gender": 1,
        "id": 1500412,
        "known_for_department": "Production",
        "name": "Wendy Jacobson",
        "original_name": "Wendy Jacobson",
        "popularity": 1.96,
        "profile_path": null,
        "credit_id": "65c9600baad9c2017db8c411",
        "department": "Production",
        "job": "Executive Producer"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 10956,
        "known_for_department": "Directing",
        "name": "Josh McLaglen",
        "original_name": "Josh McLaglen",
        "popularity": 2.918,
        "profile_path": "/5PJWCWlKF3kJWOHSqs7l7M7nZK9.jpg",
        "credit_id": "65c96028ce6c4c0149b9796b",
        "department": "Production",
        "job": "Executive Producer"
      },
      {
        "adult": false,
        "gender": 1,
        "id": 57634,
        "known_for_department": "Production",
        "name": "Mary McLaglen",
        "original_name": "Mary McLaglen",
        "popularity": 4.658,
        "profile_path": "/p2Ll42Ov1ZusGSKGJeyy5MCeP7R.jpg",
        "credit_id": "65c96020aaec71019b59e2bc",
        "department": "Production",
        "job": "Executive Producer"
      },
      {
        "adult": false,
        "gender": 1,
        "id": 7200,
        "known_for_department": "Production",
        "name": "Lauren Shuler Donner",
        "original_name": "Lauren Shuler Donner",
        "popularity": 5.825,
        "profile_path": "/a0oY5BiS6ubJv3Mxh83XH8S4fH7.jpg",
        "credit_id": "65c95fe3ce6c4c017cbaee00",
        "department": "Production",
        "job": "Producer"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 7932,
        "known_for_department": "Writing",
        "name": "Rhett Reese",
        "original_name": "Rhett Reese",
        "popularity": 9.673,
        "profile_path": "/8QjgT3ffjzSTfih5C0LpFEea5Ps.jpg",
        "credit_id": "65c9602e266778017c598c50",
        "department": "Production",
        "job": "Executive Producer"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 2014531,
        "known_for_department": "Visual Effects",
        "name": "Swen Gillberg",
        "original_name": "Swen Gillberg",
        "popularity": 3.249,
        "profile_path": "/9xyGlyUVugb2aLVnjHCEOmSHM3m.jpg",
        "credit_id": "65db6cee05b549016216f4b0",
        "department": "Visual Effects",
        "job": "Visual Effects Supervisor"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 54271,
        "known_for_department": "Editing",
        "name": "Dean Zimmerman",
        "original_name": "Dean Zimmerman",
        "popularity": 9.026,
        "profile_path": "/6mKK4thSO0CthmhygO2spWyVjcv.jpg",
        "credit_id": "65f4d7c42222f60186e5b9c0",
        "department": "Editing",
        "job": "Editor"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 17825,
        "known_for_department": "Directing",
        "name": "Shawn Levy",
        "original_name": "Shawn Levy",
        "popularity": 25.036,
        "profile_path": "/j1CXZgmfvFeD7S3PYtsEk8H3ebB.jpg",
        "credit_id": "63eba86a8e870200a98925c8",
        "department": "Production",
        "job": "Producer"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1081074,
        "known_for_department": "Crew",
        "name": "George Cottle",
        "original_name": "George Cottle",
        "popularity": 5.393,
        "profile_path": "/jwQmBfZCJk7V9W96r7fXo3JGyMs.jpg",
        "credit_id": "6606f588a6ddcb017c45a174",
        "department": "Crew",
        "job": "Stunt Coordinator"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 10956,
        "known_for_department": "Directing",
        "name": "Josh McLaglen",
        "original_name": "Josh McLaglen",
        "popularity": 2.918,
        "profile_path": "/5PJWCWlKF3kJWOHSqs7l7M7nZK9.jpg",
        "credit_id": "66293832cb6db50163b07956",
        "department": "Directing",
        "job": "First Assistant Director"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 2014410,
        "known_for_department": "Art",
        "name": "Alex Bowens",
        "original_name": "Alex Bowens",
        "popularity": 1.564,
        "profile_path": null,
        "credit_id": "6627dff9cb6db500caad41e3",
        "department": "Art",
        "job": "Art Direction"
      },
      {
        "adult": false,
        "gender": 1,
        "id": 24260,
        "known_for_department": "Costume & Make-Up",
        "name": "Claire Pritchard",
        "original_name": "Claire Pritchard",
        "popularity": 1.155,
        "profile_path": "/9yoXqLnATg2qzE4DORtYDdGzp6c.jpg",
        "credit_id": "6627e48663d937018775aebf",
        "department": "Costume & Make-Up",
        "job": "Hair Designer"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 15017,
        "known_for_department": "Costume & Make-Up",
        "name": "Bill Corso",
        "original_name": "Bill Corso",
        "popularity": 7.733,
        "profile_path": "/gY3zqmfv2kNYpQBnIgFormVU829.jpg",
        "credit_id": "6634f7fbfe6c1801262fe26b",
        "department": "Costume & Make-Up",
        "job": "Makeup Designer"
      },
      {
        "adult": false,
        "gender": 0,
        "id": 1635162,
        "known_for_department": "Costume & Make-Up",
        "name": "Sean Flanigan",
        "original_name": "Sean Flanigan",
        "popularity": 0.802,
        "profile_path": "/fPwyDOkYb6UhO8VawfqNxTrYviM.jpg",
        "credit_id": "6634fa8083ee67012d40e398",
        "department": "Costume & Make-Up",
        "job": "Hairstylist"
      },
      {
        "adult": false,
        "gender": 0,
        "id": 2010336,
        "known_for_department": "Art",
        "name": "Martin Bell",
        "original_name": "Martin Bell",
        "popularity": 0.876,
        "profile_path": null,
        "credit_id": "6635092dc9054f01338f3e8e",
        "department": "Crew",
        "job": "Visual Effects Art Director"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 17825,
        "known_for_department": "Directing",
        "name": "Shawn Levy",
        "original_name": "Shawn Levy",
        "popularity": 25.036,
        "profile_path": "/j1CXZgmfvFeD7S3PYtsEk8H3ebB.jpg",
        "credit_id": "645816486c84920181874390",
        "department": "Writing",
        "job": "Writer"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1219669,
        "known_for_department": "Writing",
        "name": "Zeb Wells",
        "original_name": "Zeb Wells",
        "popularity": 8.977,
        "profile_path": "/l6PCnqbpqCnqyJ8lXQds8Pq71uw.jpg",
        "credit_id": "6450b829e942ee0e357183db",
        "department": "Writing",
        "job": "Writer"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1669139,
        "known_for_department": "Sound",
        "name": "Samson Neslund",
        "original_name": "Samson Neslund",
        "popularity": 1.546,
        "profile_path": "/ijB0ydqIhpFz5J7IbNBMxLNEMbE.jpg",
        "credit_id": "665853fbcd22f2f92e74dde1",
        "department": "Sound",
        "job": "Sound Designer"
      },
      {
        "adult": false,
        "gender": 1,
        "id": 7232,
        "known_for_department": "Production",
        "name": "Sarah Halley Finn",
        "original_name": "Sarah Halley Finn",
        "popularity": 11.349,
        "profile_path": "/jxECVz09YGZAg1AmdzfEkPm4xeY.jpg",
        "credit_id": "6455815b57d37801717cd4a6",
        "department": "Production",
        "job": "Casting"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1017789,
        "known_for_department": "Camera",
        "name": "George Richmond",
        "original_name": "George Richmond",
        "popularity": 5.151,
        "profile_path": "/xxDOdxyiwf89xE5OULLoERKW6oG.jpg",
        "credit_id": "645d3da8fe077a5cafbec4dc",
        "department": "Camera",
        "job": "Director of Photography"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1104780,
        "known_for_department": "Art",
        "name": "Ray Chan",
        "original_name": "Ray Chan",
        "popularity": 1.398,
        "profile_path": "/u5QThOMyOpZKPXNgC2M00chzcFc.jpg",
        "credit_id": "646a469d33a37600e67b00e9",
        "department": "Art",
        "job": "Production Design"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1323295,
        "known_for_department": "Costume & Make-Up",
        "name": "Graham Churchyard",
        "original_name": "Graham Churchyard",
        "popularity": 3.111,
        "profile_path": "/xxRDb60lI0QX7tdxELT0gnvQtBg.jpg",
        "credit_id": "6665e3df67854833cf9f396e",
        "department": "Costume & Make-Up",
        "job": "Costume Design"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1458425,
        "known_for_department": "Sound",
        "name": "Ryan Cole",
        "original_name": "Ryan Cole",
        "popularity": 1.535,
        "profile_path": null,
        "credit_id": "66747e14ebdf53a68f9f747d",
        "department": "Sound",
        "job": "Supervising Sound Editor"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1352976,
        "known_for_department": "Crew",
        "name": "Colin Follenweider",
        "original_name": "Colin Follenweider",
        "popularity": 6.266,
        "profile_path": "/2n9hWyxthd6qPw3c3vxwXzwZWtn.jpg",
        "credit_id": "6674b71216a3ced7f828d703",
        "department": "Crew",
        "job": "Stunt Coordinator"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 3505013,
        "known_for_department": "Crew",
        "name": "Marvin Berrembou",
        "original_name": "Marvin Berrembou",
        "popularity": 2.099,
        "profile_path": "/s7uRgWET3heeIHjft82jKkLaIe8.jpg",
        "credit_id": "6674b990b870fbaacd28d700",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 0,
        "id": 4786182,
        "known_for_department": "Crew",
        "name": "Tom Buckley",
        "original_name": "Tom Buckley",
        "popularity": 0.063,
        "profile_path": null,
        "credit_id": "6674ba6dab719201b74ebc35",
        "department": "Crew",
        "job": "Stunt Driver"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 2244034,
        "known_for_department": "Crew",
        "name": "Adrian Derrick-Palmer",
        "original_name": "Adrian Derrick-Palmer",
        "popularity": 2.325,
        "profile_path": "/6lTrbZ7Vf19QNl3gJhkFoJ7vtS8.jpg",
        "credit_id": "6674be7ae3cded16200f21b0",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1502469,
        "known_for_department": "Crew",
        "name": "Josh Dyer",
        "original_name": "Josh Dyer",
        "popularity": 3.197,
        "profile_path": "/9qv3HhF8q6BAEpSoCJ3Np7mkxDI.jpg",
        "credit_id": "66759664ed6c6cbb2db05487",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1411839,
        "known_for_department": "Art",
        "name": "William Groebe",
        "original_name": "William Groebe",
        "popularity": 0.253,
        "profile_path": "/r9ygFRpbBSjonMSrIVn4cyv292e.jpg",
        "credit_id": "6672230d0bd9d0ec5f34439c",
        "department": "Art",
        "job": "Storyboard Artist"
      },
      {
        "adult": false,
        "gender": 1,
        "id": 17675,
        "known_for_department": "Costume & Make-Up",
        "name": "Mayes C. Rubeo",
        "original_name": "Mayes C. Rubeo",
        "popularity": 2.792,
        "profile_path": "/zq3OHlYKVGPQd1gbojz3xY6t5pT.jpg",
        "credit_id": "648114b8e375c000acc396b7",
        "department": "Costume & Make-Up",
        "job": "Costume Design"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1081074,
        "known_for_department": "Crew",
        "name": "George Cottle",
        "original_name": "George Cottle",
        "popularity": 5.393,
        "profile_path": "/jwQmBfZCJk7V9W96r7fXo3JGyMs.jpg",
        "credit_id": "64811590e2726000e8bedcff",
        "department": "Directing",
        "job": "Second Unit Director"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 95835,
        "known_for_department": "Sound",
        "name": "Eric A. Norris",
        "original_name": "Eric A. Norris",
        "popularity": 3.088,
        "profile_path": "/mksvxvfNqhFM8lsKSckosiOWYpq.jpg",
        "credit_id": "667cc2b74e2b8fdc5078509b",
        "department": "Sound",
        "job": "Sound Designer"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1701154,
        "known_for_department": "Art",
        "name": "Jeremy Simser",
        "original_name": "Jeremy Simser",
        "popularity": 1.725,
        "profile_path": "/6VCbdDFTe9ogaSU3HlKM3MJIwV4.jpg",
        "credit_id": "668ad22632c4084b8b159355",
        "department": "Art",
        "job": "Storyboard Artist"
      },
      {
        "adult": false,
        "gender": 0,
        "id": 141470,
        "known_for_department": "Lighting",
        "name": "Wayne Shields",
        "original_name": "Wayne Shields",
        "popularity": 1.275,
        "profile_path": null,
        "credit_id": "668d703d16552decc5f36544",
        "department": "Lighting",
        "job": "Gaffer"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 81671,
        "known_for_department": "Crew",
        "name": "Mark Strange",
        "original_name": "Mark Strange",
        "popularity": 3.811,
        "profile_path": "/1oYGZnDhIHpJHonuCCwKSeTN1mR.jpg",
        "credit_id": "668d91d76e82d482c61f6a4d",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1502956,
        "known_for_department": "Crew",
        "name": "Daniel Stevens",
        "original_name": "Daniel Stevens",
        "popularity": 5.898,
        "profile_path": "/oJhASwyMincQlxf42aJn9khlt9Z.jpg",
        "credit_id": "668d92a90293ab2aa81f6a80",
        "department": "Crew",
        "job": "Stunt Double"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 2441229,
        "known_for_department": "Crew",
        "name": "Oleg Podobin",
        "original_name": "Oleg Podobin",
        "popularity": 1.309,
        "profile_path": null,
        "credit_id": "668d98eb6ca04ed8da0d1af2",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 1,
        "id": 2927525,
        "known_for_department": "Crew",
        "name": "Lauriane Rouault",
        "original_name": "Lauriane Rouault",
        "popularity": 1.04,
        "profile_path": null,
        "credit_id": "668d979a281b829e800d1dec",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 1,
        "id": 2857602,
        "known_for_department": "Crew",
        "name": "Ailís Smith",
        "original_name": "Ailís Smith",
        "popularity": 2.087,
        "profile_path": null,
        "credit_id": "668d96a6381eee5eb5f369d4",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 2752041,
        "known_for_department": "Crew",
        "name": "Shane Roberts",
        "original_name": "Shane Roberts",
        "popularity": 1.593,
        "profile_path": null,
        "credit_id": "668d982b1f11861a2832a64a",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 1,
        "id": 2309141,
        "known_for_department": "Crew",
        "name": "Jessica Hooker",
        "original_name": "Jessica Hooker",
        "popularity": 5.503,
        "profile_path": "/fCiomI2oFrpSVPTWdceVnny1z9d.jpg",
        "credit_id": "668da8b5592385495dc30343",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 1,
        "id": 3352337,
        "known_for_department": "Crew",
        "name": "Maureen Lavoyer",
        "original_name": "Maureen Lavoyer",
        "popularity": 1.063,
        "profile_path": null,
        "credit_id": "668da1effdf0326f62659761",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 2770611,
        "known_for_department": "Crew",
        "name": "Bogdan Kumšackij",
        "original_name": "Bogdan Kumšackij",
        "popularity": 1.726,
        "profile_path": "/bJSkpkpRSbb7DgIVovxKu2cagN6.jpg",
        "credit_id": "668da3781305a62731ae1192",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 1,
        "id": 4733517,
        "known_for_department": "Crew",
        "name": "Ayesha Hussain",
        "original_name": "Ayesha Hussain",
        "popularity": 0.001,
        "profile_path": "/7bChdeG2k7GoAf8nG12p05Ssrbe.jpg",
        "credit_id": "668da6f8827c431542f49346",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 2846579,
        "known_for_department": "Crew",
        "name": "Matthew Bell",
        "original_name": "Matthew Bell",
        "popularity": 1.415,
        "profile_path": null,
        "credit_id": "668e9733d2c8b83ef70b65c0",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 8157,
        "known_for_department": "Sound",
        "name": "Doc Kane",
        "original_name": "Doc Kane",
        "popularity": 4.543,
        "profile_path": "/rJ12iE2gNd2TalhNXKbKH6Q3bKB.jpg",
        "credit_id": "668e9ee11f11861a2832c7c7",
        "department": "Sound",
        "job": "ADR Mixer"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1849452,
        "known_for_department": "Crew",
        "name": "Tony Christian",
        "original_name": "Tony Christian",
        "popularity": 2.728,
        "profile_path": "/vQNmZWh5msxjOYbSn5ZkPVajfgF.jpg",
        "credit_id": "66a0ea224194f9b3d7dd76f4",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 4857614,
        "known_for_department": "Acting",
        "name": "Daniel Medina Ramos",
        "original_name": "Daniel Medina Ramos",
        "popularity": 0.861,
        "profile_path": "/3ZmlKGTlBF09ZxmoOH9lB1xdsf2.jpg",
        "credit_id": "66a96892428ab0c03ca373ca",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 2817061,
        "known_for_department": "Writing",
        "name": "Herb Trimpe",
        "original_name": "Herb Trimpe",
        "popularity": 3.539,
        "profile_path": null,
        "credit_id": "66a1ec4fc4e63bdb74e0fcb6",
        "department": "Writing",
        "job": "Characters"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 141359,
        "known_for_department": "Writing",
        "name": "Roy Thomas",
        "original_name": "Roy Thomas",
        "popularity": 9.73,
        "profile_path": "/2ZzN71BDvknZKTkIYmwNCa2uQMQ.jpg",
        "credit_id": "66a1ec56b985e509a26e8553",
        "department": "Writing",
        "job": "Characters"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 2752069,
        "known_for_department": "Crew",
        "name": "Jonny James",
        "original_name": "Jonny James",
        "popularity": 1.134,
        "profile_path": "/yNLcisY7ThsxzIP0Lj54OPB9rw9.jpg",
        "credit_id": "66a1edee52d5b3412180f24e",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1195199,
        "known_for_department": "Writing",
        "name": "John Romita Sr.",
        "original_name": "John Romita Sr.",
        "popularity": 5.876,
        "profile_path": "/n7YrfwwgHB3PjncCgAySv9R8vvS.jpg",
        "credit_id": "66a1ec486aef695b11dd9cf7",
        "department": "Writing",
        "job": "Characters"
      },
      {
        "adult": false,
        "gender": 0,
        "id": 58910,
        "known_for_department": "Costume & Make-Up",
        "name": "Geoff Redknap",
        "original_name": "Geoff Redknap",
        "popularity": 2.499,
        "profile_path": "/7YkPrZLjVVOTQNXAgxgjzGRrzsP.jpg",
        "credit_id": "66a1ed1ae296d3a52418ea10",
        "department": "Costume & Make-Up",
        "job": "Key Makeup Artist"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1459856,
        "known_for_department": "Costume & Make-Up",
        "name": "Robb Crafer",
        "original_name": "Robb Crafer",
        "popularity": 0.746,
        "profile_path": null,
        "credit_id": "66a1ed53f410fb5dd314dc18",
        "department": "Costume & Make-Up",
        "job": "Other"
      },
      {
        "adult": false,
        "gender": 1,
        "id": 2769366,
        "known_for_department": "Crew",
        "name": "Christina Petrou",
        "original_name": "Christina Petrou",
        "popularity": 3.33,
        "profile_path": "/dC7JHx7Q9qKa4YqdCZVvqYTUTSP.jpg",
        "credit_id": "66a1eda18dd96825c6266313",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 173658,
        "known_for_department": "Writing",
        "name": "Len Wein",
        "original_name": "Len Wein",
        "popularity": 15.97,
        "profile_path": "/jA38DskVXNIryKgPgc9Tc3GyaGH.jpg",
        "credit_id": "66a1ec41d3e76bd5276fbb82",
        "department": "Writing",
        "job": "Characters"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 2280082,
        "known_for_department": "Crew",
        "name": "Alex Kyshkovych",
        "original_name": "Alex Kyshkovych",
        "popularity": 6.769,
        "profile_path": "/nyy5o659Z1LfLl9ckRT1FiNop4U.jpg",
        "credit_id": "66a1ed61f15568a11b024008",
        "department": "Crew",
        "job": "Stunt Double"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1891243,
        "known_for_department": "Crew",
        "name": "Erol Ismail",
        "original_name": "Erol Ismail",
        "popularity": 5.032,
        "profile_path": "/a8rZuQ3dZLgJGW5zWikNkdXBsz.jpg",
        "credit_id": "66a1edbbe85279d0b3cf85d1",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 0,
        "id": 58910,
        "known_for_department": "Costume & Make-Up",
        "name": "Geoff Redknap",
        "original_name": "Geoff Redknap",
        "popularity": 2.499,
        "profile_path": "/7YkPrZLjVVOTQNXAgxgjzGRrzsP.jpg",
        "credit_id": "66a1ed13657d3eb11da0cd35",
        "department": "Costume & Make-Up",
        "job": "Key Hair Stylist"
      },
      {
        "adult": false,
        "gender": 1,
        "id": 4115448,
        "known_for_department": "Crew",
        "name": "Jade Lye",
        "original_name": "Jade Lye",
        "popularity": 6.522,
        "profile_path": "/4r1zrh8Wf32W74fltUn37Uz2FfV.jpg",
        "credit_id": "66a96e621575dd985adab435",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 0,
        "id": 4848517,
        "known_for_department": "Crew",
        "name": "Henry Delaney",
        "original_name": "Henry Delaney",
        "popularity": 0.01,
        "profile_path": null,
        "credit_id": "66a1f27ee746bc4fe1c8346c",
        "department": "Crew",
        "job": "In Memory Of"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 2151837,
        "known_for_department": "Crew",
        "name": "James Cox",
        "original_name": "James Cox",
        "popularity": 2.488,
        "profile_path": "/efxG7FKuE1jzfcoJlcBD37T5syJ.jpg",
        "credit_id": "66a1eddf3c8e8b5b8c14d913",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 2423284,
        "known_for_department": "Crew",
        "name": "Billy Clements",
        "original_name": "Billy Clements",
        "popularity": 4.463,
        "profile_path": "/nipJ22DXJBsdM1teQodwop42U6S.jpg",
        "credit_id": "66a1f1afac556bd4f0023edc",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 2423287,
        "known_for_department": "Crew",
        "name": "Eduardo Gago Muñoz",
        "original_name": "Eduardo Gago Muñoz",
        "popularity": 3.358,
        "profile_path": "/r9DaaOfiACoUX7Ezs63K8DZrpHI.jpg",
        "credit_id": "66a971bd17ba3ae460933acc",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 0,
        "id": 4858600,
        "known_for_department": "Crew",
        "name": "Nilly Cetin",
        "original_name": "Nilly Cetin",
        "popularity": 1.05,
        "profile_path": "/vLKWIjSztXEHUOMFolVudij4jbs.jpg",
        "credit_id": "66a970d434ca74620f755604",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 0,
        "id": 4858628,
        "known_for_department": "Crew",
        "name": "Chloe Kibble",
        "original_name": "Chloe Kibble",
        "popularity": 0.86,
        "profile_path": "/6jgp3IJenhe9R1cdV25gfzlSDpy.jpg",
        "credit_id": "66a97562146f128153e3ac82",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 0,
        "id": 2151833,
        "known_for_department": "Crew",
        "name": "Curtis Rowland Small",
        "original_name": "Curtis Rowland Small",
        "popularity": 2.426,
        "profile_path": "/lgAOeihmiZ2CdKWpa35BxpBeSiK.jpg",
        "credit_id": "66a9772bb271fff9d2a37260",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 0,
        "id": 4858668,
        "known_for_department": "Crew",
        "name": "Jessica Walker",
        "original_name": "Jessica Walker",
        "popularity": 1.159,
        "profile_path": "/5fZ41rVpPKI5VpBFt2dBRcOaHtL.jpg",
        "credit_id": "66a979bf2bc64315b1b437ed",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 1,
        "id": 1327030,
        "known_for_department": "Sound",
        "name": "Lora Hirschberg",
        "original_name": "Lora Hirschberg",
        "popularity": 4.049,
        "profile_path": "/8IJl1itNV99LhKg24yeIGHjYaQd.jpg",
        "credit_id": "66a2fc1d073923ad4918f9ab",
        "department": "Sound",
        "job": "Sound Re-Recording Mixer"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1042699,
        "known_for_department": "Sound",
        "name": "Rob Simonsen",
        "original_name": "Rob Simonsen",
        "popularity": 2.24,
        "profile_path": "/oLz4I5M32k3ynlgMeph9LFsBRsP.jpg",
        "credit_id": "64adcf6d3e2ec8012ee5724d",
        "department": "Sound",
        "job": "Original Music Composer"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1117747,
        "known_for_department": "Production",
        "name": "Mitchell Bell",
        "original_name": "Mitchell Bell",
        "popularity": 3.303,
        "profile_path": "/vTgWJRc3ABqePIrOwsmr87aLik6.jpg",
        "credit_id": "64aea6f13e2ec8012ee5fde2",
        "department": "Production",
        "job": "Co-Producer"
      },
      {
        "adult": false,
        "gender": 1,
        "id": 3618256,
        "known_for_department": "Visual Effects",
        "name": "Lisa Marra",
        "original_name": "Lisa Marra",
        "popularity": 1.127,
        "profile_path": null,
        "credit_id": "66a44a982fb83d5e35068c74",
        "department": "Visual Effects",
        "job": "Visual Effects Producer"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 934844,
        "known_for_department": "Writing",
        "name": "Rob Liefeld",
        "original_name": "Rob Liefeld",
        "popularity": 10.538,
        "profile_path": "/2WF4E4afbS2nCUNV3ksTGdouyvf.jpg",
        "credit_id": "5be4ba26c3a36810d20360c5",
        "department": "Writing",
        "job": "Characters"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1222480,
        "known_for_department": "Writing",
        "name": "Fabian Nicieza",
        "original_name": "Fabian Nicieza",
        "popularity": 4.298,
        "profile_path": "/vV0VKVThe1o6fyS6SCRAlVNVdLX.jpg",
        "credit_id": "5be4ba01c3a36810d20360b3",
        "department": "Writing",
        "job": "Characters"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 3411282,
        "known_for_department": "Crew",
        "name": "Kevin Fortin",
        "original_name": "Kevin Fortin",
        "popularity": 3.319,
        "profile_path": "/bRBUOhX9Oc0A2nNARsP4jkoDzva.jpg",
        "credit_id": "66cf6102ed373c16d0e2f791",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 0,
        "id": 4909392,
        "known_for_department": "Crew",
        "name": "Hung Dante",
        "original_name": "Hung Dante",
        "popularity": 0.2,
        "profile_path": null,
        "credit_id": "66cffab94a89d30dac59b99e",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1379940,
        "known_for_department": "Crew",
        "name": "Joel Adrian",
        "original_name": "Joel Adrian",
        "popularity": 2.217,
        "profile_path": null,
        "credit_id": "66cffac400c806ae353f184b",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 1797832,
        "known_for_department": "Crew",
        "name": "Cali Nelle",
        "original_name": "Cali Nelle",
        "popularity": 1.998,
        "profile_path": "/9JsBGeqfSe0Hugz9IWdkUUGIhhL.jpg",
        "credit_id": "66cffa9e7cb5c954963f1857",
        "department": "Crew",
        "job": "Stunts"
      },
      {
        "adult": false,
        "gender": 2,
        "id": 10850,
        "known_for_department": "Production",
        "name": "Kevin Feige",
        "original_name": "Kevin Feige",
        "popularity": 19.607,
        "profile_path": "/w2VgeSlWhws5CmpxJMNBSCvELnx.jpg",
        "credit_id": "5e1163b7c740d900150a4656",
        "department": "Production",
        "job": "Producer"
      }
    ]
  };
  Map<String, dynamic> movieDetails = {
    "id": 533535,
    "page": 1,
    "results": [
      {
        "author": "shammahrashad",
        "author_details": {
          "name": "",
          "username": "shammahrashad",
          "avatar_path": null,
          "rating": 6.0
        },
        "content":
            "Theres not much of a plot and the villains weren't that great. It was a good laugh though and amazing cameos and fight scenes.",
        "created_at": "2024-07-25T21:26:26.038Z",
        "id": "66a2c3023f13b7231f1b94eb",
        "updated_at": "2024-07-26T17:17:34.336Z",
        "url": "https://www.themoviedb.org/review/66a2c3023f13b7231f1b94eb"
      },
      {
        "author": "r96sk",
        "author_details": {
          "name": "",
          "username": "r96sk",
          "avatar_path": "/mwR7rFHoDcobAx1i61I3skzMW3U.jpg",
          "rating": 9.0
        },
        "content":
            "Its story may not be the strongest, but the comedy makes <em>'Deadpool & Wolverine'</em> an excellent watch!\r\n\r\nThere are some top notch gags in there, particularly to do with the recent offscreen changes for Wade Wilson's alter ego. As you'd expect with Ryan Reynolds in this role, the jokes are plentiful and there is barely any time to react to one before another appears. That can sometimes not work as well as intended, e.g. <em>'Deadpool 2'</em>, but here the humour is executed perfectly.\r\n\r\nReynolds himself is quality, it is a quintessential Ryan Reynolds as Deadpool performance. It's real neat to see Hugh Jackman back as Wolverine, he does play second fiddle to the other titular character but still more than holds his own, as you'd expect. Emma Corrin, meanwhile, enters the MCU with a great showing.\r\n\r\nAs noted at the top, I do think the plot couldn't been superior - but not in a negative way. What is portrayed is still entertaining to watch, it's just not necessarily on the same level as the comedic elements. A fun watch, all the same. Do I like it more than the 2016 original? I think so, would only be minorly so though.",
        "created_at": "2024-07-25T23:00:25.482Z",
        "id": "66a2d90909905455146125df",
        "updated_at": "2024-07-25T23:00:25.730Z",
        "url": "https://www.themoviedb.org/review/66a2d90909905455146125df"
      },
      {
        "author": "Chris Sawin",
        "author_details": {
          "name": "Chris Sawin",
          "username": "ChrisSawin",
          "avatar_path": null,
          "rating": 8.0
        },
        "content":
            "_Deadpool & Wolverine_ is the best the MCU has been since Guardians of the Galaxy Vol. 3. It’s two hours of comic book-driven fan service and delivers entertaining surprises, nostalgic throwbacks, memorable action sequences, and worthwhile performances.\r\n\r\n**Full review:** https://bit.ly/WadeLogan",
        "created_at": "2024-07-26T21:57:36.118Z",
        "id": "66a41bd02029ba46995219c8",
        "updated_at": "2024-07-26T21:57:36.197Z",
        "url": "https://www.themoviedb.org/review/66a41bd02029ba46995219c8"
      },
      {
        "author": "Brent Marchant",
        "author_details": {
          "name": "Brent Marchant",
          "username": "Brent_Marchant",
          "avatar_path": null,
          "rating": 6.0
        },
        "content":
            "In moviemaking, sadly, there can be a problem with going to the well too many times, and this latest installment in one of filmdom’s better cinematic franchises verges on proving just that. This offering’s predecessors (2016, 2018) significantly distinguished themselves from the kind of fare typically found in the superhero genre with their outrageously bawdy humor, hilarious sight gags and relentlessly maverick attitude. This time out, however, director Shawn Levy’s latest effort is a decidedly hit or miss affair, with an often-incoherent script that feels like it was cobbled together from a collection of leftover parts, some of which work and some of which don’t. I suppose that’s not entirely surprising from a screenplay that was penned by four different writers, making me wonder how much consensus was in place in compiling the finished product. Moreover, this film appears to be intended to fold the Deadpool franchise into the X-Men franchise, an intriguing idea that, regrettably, is handled rather clumsily (as has often been the case with many other recent fusion offerings in the Marvel Universe). And, if all that weren’t bad enough, this release gives short shrift to the colorful cast of supporting players that made the Deadpool films so funny, original and enjoyable, relegating them to little more than cameos in favor of walk-ons by a host of other MCU characters (some of them remarkably obscure, I might add) in an attempt to help cement the franchise cross-pollination going on here. It makes for awkward storytelling at times, especially for viewers who might not be familiar with these lesser-known figures, some of which are drawn from Marvel source material unrelated to its big screen offerings. To the picture’s credit, it features yet another stellar turn by Ryan Reynolds as the off-color protagonist, as well as its share of hilarious bits (without a doubt the franchise’s historically strongest suit), including a number of unabashed, razor-sharp asides referencing off-screen developments related to the studios that produced these films and the actors who have appeared in them. These strengths notwithstanding, however, this is a production that has sadly watered down the elements that best made this franchise work in favor of an overarching programming agenda that simply doesn’t serve this film or the series particularly well. The creators would have served themselves and viewers better by sticking with what works and the basics of good storytelling than trying to force an issue for the sake of future productions that may or may not work over the long term. This has been a noticeable downfall in the quality of many of the most recent Marvel Universe releases, and I’d truly hate to see this franchise befall a similar fate.",
        "created_at": "2024-07-27T23:10:02.772Z",
        "id": "66a57e4af88446bc9819d138",
        "updated_at": "2024-07-27T23:10:02.861Z",
        "url": "https://www.themoviedb.org/review/66a57e4af88446bc9819d138"
      },
      {
        "author": "Sean",
        "author_details": {
          "name": "Sean",
          "username": "seaneoo",
          "avatar_path": null,
          "rating": 10.0
        },
        "content":
            "Such a fun watch, maybe one of the best experiences I've had in a theater. I couldn't have asked for a better ending to 24 year old franchise.",
        "created_at": "2024-07-28T15:45:25.879Z",
        "id": "66a66795e5b1b7118307ce15",
        "updated_at": "2024-07-29T16:32:10.126Z",
        "url": "https://www.themoviedb.org/review/66a66795e5b1b7118307ce15"
      },
      {
        "author": "CinemaSerf",
        "author_details": {
          "name": "CinemaSerf",
          "username": "Geronimo1967",
          "avatar_path": "/yz2HPme8NPLne0mM8tBnZ5ZWJzf.jpg",
          "rating": 7.0
        },
        "content":
            "Well the \"Deadpool\" concept is now well and truly immersed in the Marvel multi-verse and I really did fear for good old \"Dead\". More of the same? Well, no actually. Ryan Reynolds has reverted more to the occasionally quite vulgar humour of the first film (2016) and allowed this trequel to focus more on the personality of this irreverent, immortal, superhero as he tries to resurrect the recently departed \"Wolverine/Logan\" (Hugh Jackman) so he can save his timeline from erasure. To do that, and thwart the comically menacing \"Paradox\" (Matthew Macfadyen), he has to face down \"Cassandra Nova\" (Emma Corrin) - who happens to be the long estranged twin sister of \"Xavier\" who presides over the void. That's a \"Mad Max\" style desert style territory where all the undesirables have been put by \"Paradox\" and his organisation over the years. Initially, there's no love lost between our two heroes. The cocky man in red lycra does not impress his new, booze-soaked and guilt-ridden buddy, but quickly they manage to align their priorities and then - well yes, you can guess the rest. Indeed, there's nothing remotely unpredictable about any of this, but what it does do is shout loudly and proudly that it knows it. It's not trying to reinvent the wheel, it's succeeding in pointing out that all of these multi-verse films that simply adjust the space/time continuum to provide a new setting for the same old stories ad characters has to stop before we (the audience) bore further of their repetitive combat cycles and nondescript plot lines. Maybe Reynolds does over-egg the smuttiness a little but there are still plenty of wry comments about the industry, product placement and the plethora of films (and actors) that have preceded it delivering same old same old. It's not forgotten to entertain us too - there are loads of action scenes and there's an amiable chemistry between two actors who are clearly on the same, suitably sarcastic, page throughout a two hours that also features a some fun cameos from the likes of Messrs. Evans, Snipes, Cavill, Favreau and Tatum to keep it moving along with an effervescence of spirit. It's a big screen essential, there's a lot of effort gone into the production that won't work so well on the telly, and I enjoyed it.",
        "created_at": "2024-07-29T06:24:25.060Z",
        "id": "66a7359905adb834423a4076",
        "updated_at": "2024-07-29T06:24:25.295Z",
        "url": "https://www.themoviedb.org/review/66a7359905adb834423a4076"
      },
      {
        "author": "TheSceneSnobs",
        "author_details": {
          "name": "",
          "username": "TheSceneSnobs",
          "avatar_path": null,
          "rating": 8.0
        },
        "content":
            "Deadpool and Wolverine is a movie that I truly believe the Marvel Cinematic Universe (MCU) has needed for a while. After years of lackluster installments, this film is a breath of fresh air. Ryan Reynolds, Hugh Jackman, and director Shawn Levy approached this project with care and a deep understanding of what fans want. The film feels like it was crafted by fans for fans, particularly those who have been frustrated by the recent phases of the MCU.\r\n\r\nReynolds and Levy brought on a team of writers with a strong background in comedy and storytelling. This decision pays off, as the film’s humor and narrative are both sharp and engaging. For example, the meta vibe of Deadpool, familiar from the previous two films, is ramped up significantly. The movie spares no one, making jokes about everything from Hugh Jackman’s recent divorce to Ryan Reynolds' career. However, it’s the MCU that receives the most pointed and critical jokes, which will resonate with long-time fans.\r\n\r\nThe chemistry between Reynolds and Jackman is electric, bringing new life to both characters. Their dynamic is both hilarious and heartfelt, making for a compelling narrative. For instance, scenes where Deadpool and Wolverine banter while taking down enemies are filled with wit and energy, showcasing their unique bond. This camaraderie extends to the film’s supporting cast, with well-timed cameos and clever nods to previous Marvel movies.\r\n\r\nThe film's self-awareness and willingness to poke fun at its own franchise are refreshing. This level of meta-commentary sets the film apart from typical superhero fare.\r\n\r\nDespite its comedic approach, the film doesn’t skimp on emotional depth. The storyline is carried by genuine heart, particularly in how it addresses themes of redemption and friendship. The climax is especially impactful, ranking among the greats in the franchise.\r\n\r\nThis isn't just a good sequel; it's a game-changer for the MCU. The film successfully integrates Deadpool into the broader Marvel Cinematic Universe while maintaining his unique tone and style. It sets the stage for future installments, promising exciting developments ahead. The way the film navigates these transitions feels seamless, ensuring that Deadpool’s irreverent humor doesn’t clash with the MCU’s established tone.\r\n\r\nOverall, Deadpool and Wolverine is a standout entry in the MCU, offering a perfect blend of humor, action, and heart. Ryan Reynolds and Hugh Jackman deliver top-notch performances, supported by a smart script and deft direction from Shawn Levy. This film not only redeems past missteps in the franchise but also paves the way for a promising future. It’s a must-watch for any Marvel fan, filled with laughter, thrills, and touching moments that elevate it above many of its predecessors.",
        "created_at": "2024-07-30T16:14:59.429Z",
        "id": "66a91183037c3bc76b5c4625",
        "updated_at": "2024-07-30T16:14:59.502Z",
        "url": "https://www.themoviedb.org/review/66a91183037c3bc76b5c4625"
      },
      {
        "author": "GenerationofSwine",
        "author_details": {
          "name": "",
          "username": "GenerationofSwine",
          "avatar_path": "/xYhvrFNntgAowjRsf6mRg9JgITr.jpg",
          "rating": 10.0
        },
        "content":
            "It feels a bit rushed... but then it was rushed.  It feels a bit neutered, but it's now Disney and they did muzzle it.\r\n\r\nThe thing is though... it's not woke, which is why you have articles criticizing it for \"Not Being Gay Enough\" and in 2024, that very literally translates to: \"They focused on a story and characters rather than a political agenda and we're mad about it.\" Which, in turn, translates to \"Actually entertaining.\"\r\n\r\nIt's amazing how articles complaining about a movie not being Gay enough can guarantee you that the movie is going to be good.\r\n\r\nOnly.... it's meh.  I mean, when you compare it to most of the movies this year it's pretty epic.  When you compare it to most of the post 2016 movies this is one of the greatest things ever made... but when you compare it to the other Deadpool movies it's rushed.\r\n\r\nBut... who cares, it literally doesn't have a point other than entertaining you, and that is really all that matters and all that I ask for.\r\n\r\nIs it a cash grab? Yes, and I will GLADLY give them my money for another movie that just wants to entertain.  And if they make another movie that wants to entertain and not push an agenda, I will gladly give them MORE of my money... because at the end of the day, entertainment has been in a decade long drought brought to you by political lecturing and nerd domains have been intentionally attacking fans rather than making movies, like this, that make fans want to give them their money.\r\n\r\nSo when a movie like this comes along, it is a wonderful thing.",
        "created_at": "2024-08-01T01:21:06.505Z",
        "id": "66aae3029a5f43de29d2b57c",
        "updated_at": "2024-08-01T01:21:07.126Z",
        "url": "https://www.themoviedb.org/review/66aae3029a5f43de29d2b57c"
      },
      {
        "author": "JPV852",
        "author_details": {
          "name": "",
          "username": "JPV852",
          "avatar_path": "/xNLOqXXVJf9m7WngUMLIMFsjKgh.jpg",
          "rating": 7.0
        },
        "content":
            "Satisfying and 100% fan-service. Hugh Jackman still is awesome as Wolverine and gives it his all, along with Ryan Reynolds, both showing passion for the characters. That said, much like Deadpool 2, I'm not sure if I have much desire to revisit anytime soon. **3.5/5**",
        "created_at": "2024-08-05T21:20:26.799Z",
        "id": "66b1421a8daeecf9e29e50f4",
        "updated_at": "2024-08-05T21:20:27.339Z",
        "url": "https://www.themoviedb.org/review/66b1421a8daeecf9e29e50f4"
      },
      {
        "author": "Pringo",
        "author_details": {
          "name": "",
          "username": "Pringo",
          "avatar_path": "/yujjqlbbagHH4xd154UtIxkwIX6.jpg",
          "rating": 10.0
        },
        "content":
            "I just watched Deadpool & Wolverine, and wow, it was an absolute blast! Ryan Reynolds and Hugh Jackman have incredible chemistry that makes the whole movie work. Deadpool's irreverent humor and Wolverine's gruff seriousness balance each other perfectly. The film is packed with hilarious jokes, epic action sequences, and so many Easter eggs that comic book fans will be thrilled.\r\n\r\nThe opening sequence had me hooked right away, with a mix of intense fighting and Deadpool's signature humor. The constant fourth-wall breaks were spot-on and kept the laughs coming. It's a fantastic tribute to both characters and their histories, with plenty of nods to past films and comics.\r\n\r\nIf you're a fan of either character, this movie is a must-see. It's not just a fun ride; it's a love letter to the fans. The pacing is perfect, and the two hours flew by. Whether you're a casual viewer or a hardcore fan, Deadpool & Wolverine delivers on all fronts. Don't miss it!",
        "created_at": "2024-08-05T21:32:01.314Z",
        "id": "66b144d15ad429e84293f3dc",
        "updated_at": "2024-08-06T14:49:02.236Z",
        "url": "https://www.themoviedb.org/review/66b144d15ad429e84293f3dc"
      },
      {
        "author": "DonGable",
        "author_details": {
          "name": "",
          "username": "DonGable",
          "avatar_path": "/hItCZ2lSoltYNv9yv4mvkgLFeGK.jpg",
          "rating": 4.0
        },
        "content":
            "For devout Marvel fans only.\r\n\r\nHere is a test for franchise films: Remove the IP and characters to see if the story, character development, etc. stands on its own without using the IP as a crutch.\r\nIf you remove the IP in this case, you have absolutely nothing.\r\n\r\nIf you've seen a lot of previous Marvel films in this universe, you will be treated with an abundance of fan service. Admittedly, I have not watched a lot of these films. I have, however, watched the first two Deadpool entries. I enjoyed them at the time, especially the first one.\r\n\r\nIn this third entry, you will find a lot of cameos which are absolutely pointless, except for people to chug memberberries, as they do absolutely nothing with these characters. It doesn't even properly show the backstory of Wolverine.\r\nThis film is an almost non-stop barrage of bickering and snarky jokes, but it's never given any time at all to breathe. The few moments where it actually tries to convey emotion, it never truly lands, as all it wants to do is tell jokes. Did I laugh here and there? Sure. But I can count it on one hand.\r\n\r\nThe villain and plot quite forgettable, and you never truly feel that something's at stake, as the threat is mainly conveyed as a progress bar on a screen...\r\n\r\nEven though some people might marvel at Deadpool taking potshots at the MCU, Disney knows exactly what they're doing, and they will be laughing all the way to the bank. Corporate brand maintenance is all it is.",
        "created_at": "2024-08-07T07:01:33.227Z",
        "id": "66b31bcd89a22b11287b928c",
        "updated_at": "2024-08-07T20:33:12.650Z",
        "url": "https://www.themoviedb.org/review/66b31bcd89a22b11287b928c"
      },
      {
        "author": "aGoryLouie",
        "author_details": {
          "name": "aGoryLouie",
          "username": "IndecentLouie",
          "avatar_path": "/AdCaDuvPpn3STZLF0csAoFJm9bo.png",
          "rating": 8.0
        },
        "content": "the definition of fun",
        "created_at": "2024-08-09T16:46:35.153Z",
        "id": "66b647ebf0d18381e625ffaa",
        "updated_at": "2024-08-09T16:46:35.226Z",
        "url": "https://www.themoviedb.org/review/66b647ebf0d18381e625ffaa"
      },
      {
        "author": "davidrobitaille",
        "author_details": {
          "name": "",
          "username": "davidrobitaille",
          "avatar_path": "/b0fwlXRaUDpBNE2hw9Pz922BVjE.jpg",
          "rating": 10.0
        },
        "content":
            "I went to see Deadpool & Wolverine last evening and boy did it feel refreshing to see Ryan Reynolds making all of these funny jokes on screen as Deadpool. There were a lot of mentions of Marvel, jokes about production companies & about production crew/cast (extras, etc). As someone who's passionate about this industry and is very active in the business, this film is a big success in my opinion. I loved that we got to see Jon Favreau as Happy Hogan in the intro of the film, just sad we didn't get a little Tony Stark (RDJ) appearance, but hey, it's not his movie after all (RIP Iron Man).",
        "created_at": "2024-08-25T18:39:10.750Z",
        "id": "66cb7a4e4947801fb32d64ad",
        "updated_at": "2024-08-26T14:24:44.744Z",
        "url": "https://www.themoviedb.org/review/66cb7a4e4947801fb32d64ad"
      },
      {
        "author": "SkyRo85",
        "author_details": {
          "name": "SkyRo85",
          "username": "Skyro1085",
          "avatar_path": "/yqJaYypw3f3moagyIAXl6ShUcRQ.jpg",
          "rating": 9.0
        },
        "content":
            "Finally, the moment I have been eagerly waiting for has arrived - the new film featuring Deadpool and Wolverine! I am thrilled to share my thoughts on this without revealing any spoilers, so brace yourself for a fairly tame review to keep the surprise intact for everyone.\r\n\r\nMarvel is back in its element with this movie, as it takes a playful jab at itself. Deadpool boldly declares that the Multiverse is a mess and proposes putting an end to it - a refreshing take on the superhero genre.\r\n\r\nThe dance sequence is a hilarious throwback to the 90s, adding a touch of nostalgia and charm to the film. And yes, there is plenty of colorful language, including an abundance of the infamous F word - but then again, what else would you expect from Deadpool?\r\n\r\nPrepare to be amazed by some incredible cameos that will leave you jumping out of your seat with excitement, especially if you have a soft spot for certain characters from the past. This movie is an absolute thrill ride that pays homage to the Fox universe and its beloved characters.\r\n\r\nWithout giving too much away, there is a surprising appearance by a fan-favorite character who never made it to the superhero league, and the moment is truly jaw-dropping. The storyline may seem chaotic, but that's all part of the Deadpool charm.\r\n\r\nWhile the villain could have been utilized more effectively given their power, the relationship between Deadpool and Wolverine is beautifully portrayed. The film does a commendable job of explaining the backstory and the humor is on point, with Deadpool's witty jabs and references adding to the entertainment.\r\n\r\nIf you're a fan of Deadpool and his legacy, this movie is a must-watch that will blow your mind. Just be warned, there is a fair amount of profanity, so consider this if you're planning to bring along younger viewers. \r\n\r\nOverall, this movie was a blast and one of the most enjoyable Marvel experiences in recent memory. From the creative storytelling to the hilarious antics, it's a wild ride that you won't want to miss. And don't forget to stick around for the mid-credits and end-credits scenes for an extra dose of fun and closure to the film. Enjoy the laugh-filled ride!",
        "created_at": "2024-09-01T21:25:38.788Z",
        "id": "66d4dbd2b6c634c8e8b62d81",
        "updated_at": "2024-09-03T03:41:35.710Z",
        "url": "https://www.themoviedb.org/review/66d4dbd2b6c634c8e8b62d81"
      }
    ],
    "total_pages": 1,
    "total_results": 14
  };

  void _formatDate(int index) {
    timestamp = movieDetails['results'][index]['updated_at'];
    // Parse the timestamp to a DateTime object
    DateTime parsedDate = DateTime.parse(timestamp);

    // Format the date to "yyyy-MM-dd"
    formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double wSize = MediaQuery.of(context).size.width;
    double hSize = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Movie Image
            Container(
              width: wSize,
              height: wSize * 0.562,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500/yDHYTfA3R0jFYba16jBB1ef8oIt.jpg"))),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Movie Name
                  Row(
                    children: [
                      const Text(
                        "Deadpool & Wolverine",
                        style: AppTextStyles.titleStyle,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.boxBlackColor,
                        ),
                        child: Text(
                          "7.8",
                          style: AppTextStyles.hedgingTextStyle
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                  // Movie Date
                  SizedBox(
                    width: wSize - 25,
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "2024-07-24",
                          style: AppTextStyles.textStyle,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "• ",
                          style: AppTextStyles.textStyle,
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  index > 0
                                      ? const Text(
                                          " / ",
                                          style: AppTextStyles.textStyle,
                                        )
                                      : Container(),
                                  const Text(
                                    "Action",
                                    style: AppTextStyles.textStyle,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Movie overview
                  const Text(
                    "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
                    style: AppTextStyles.subTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Movie Play
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, '/Movie'),
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColors.submitButtonColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow_rounded,
                            size: 30,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Play",
                            style: AppTextStyles.hedgingTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Movie Dowunload
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, '/Movie'),
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColors.graySearchBarColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.download,
                            size: 30,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Download",
                            style: AppTextStyles.hedgingTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // List , Like and Send
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            myList = !myList;
                          });
                        },
                        child: Row(
                          children: [
                            myList
                                ? const Icon(
                                    Icons.bookmark_rounded,
                                    size: 30,
                                  )
                                : const Icon(
                                    Icons.bookmark_outline,
                                    size: 30,
                                  ),
                            const SizedBox(
                              width: 6,
                            ),
                            const Text(
                              "List",
                              style: AppTextStyles.textStyle,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            like = !like;
                          });
                        },
                        child: Row(
                          children: [
                            like
                                ? const Icon(
                                    Icons.thumb_up,
                                    size: 30,
                                  )
                                : const Icon(
                                    Icons.thumb_up_alt_outlined,
                                    size: 30,
                                  ),
                            const SizedBox(
                              width: 6,
                            ),
                            const Text(
                              "Like",
                              style: AppTextStyles.textStyle,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Row(
                          children: [
                            Icon(
                              Icons.send_rounded,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              "Send",
                              style: AppTextStyles.textStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Cast & Crew",
                    style: AppTextStyles.hedgingTextStyle,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  // Movie Credits
                  SizedBox(
                    height: 170,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: moveCastDetails['cast'].length,
                      itemBuilder: (context, index) {
                        final String nameOfCast =
                            moveCastDetails['cast'][index]['name'] ?? '';
                        final String departmentOfCast = moveCastDetails['cast']
                                [index]['known_for_department'] ??
                            '';
                        final String imageOfCast =
                            "https://image.tmdb.org/t/p/w500${moveCastDetails['cast'][index]['profile_path']}";
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Column(
                            children: [
                              ClipOval(
                                child: Image.network(
                                  imageOfCast,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return const Center(
                                        child:
                                            CircularProgressIndicator(), // Placeholder while loading
                                      );
                                    }
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.network(
                                      'https://i.pinimg.com/564x/f5/06/9c/f5069cb08bc57480f2c7127ac1aafd4d.jpg', // Placeholder image
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                departmentOfCast,
                                style: AppTextStyles.subTextStyle,
                              ),
                              SizedBox(
                                  width: 110,
                                  child: Text(
                                    nameOfCast,
                                    style: AppTextStyles.textStyle,
                                    textAlign: TextAlign.center,
                                  )),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    movieName,
                    style: AppTextStyles.hedgingTextStyle,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  // Movie Images
                  SizedBox(
                    height: (wSize - 124) * 0.562,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            width: wSize - 124,
                            height: (wSize - 124) * 0.562,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              image: const DecorationImage(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w500/uvlbA5Zt9Alib6D46g84iMjnAQU.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Reviews",
                    style: AppTextStyles.hedgingTextStyle,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          TextEditingController reviewsController =
                              TextEditingController();
                          int? selectedRating;

                          return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: AppColors.boxBlackColor,
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Share Your Review",
            style: AppTextStyles.titleStyle.copyWith(fontSize: 20),
          ),
          SizedBox(height: 6,width: wSize-30,),
          const Divider(color: AppColors.grayColor),
          const SizedBox(height: 16),
          Text(
            "Rating : ",
            style: AppTextStyles.textStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<int>(
            value: selectedRating,
            dropdownColor: AppColors.boxBlackColor,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.grayColor),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.white),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items: List.generate(10, (index) => index + 1)
                .map((rating) => DropdownMenuItem<int>(
                      value: rating,
                      child: Text(
                        rating.toString(),
                        style: AppTextStyles.textStyle,
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              selectedRating = value;
            },
            hint: const Text(
              "Select Rating",
              style: AppTextStyles.subTextStyle,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Review :",
            style: AppTextStyles.textStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: reviewsController,
            decoration: InputDecoration(
              hintText: 'Write your review here...',
              hintStyle: AppTextStyles.subTextStyle.copyWith(color: AppColors.grayColor),
              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.grayColor),
                borderRadius: BorderRadius.circular(6),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.white),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            maxLines: 4,
          ),
        ],
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text(
            'Cancel',
            style: AppTextStyles.textStyle,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.submitButtonColor,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            // Handle submission logic
            Navigator.of(context).pop(); // Close the dialog after submission
          },
          child: const Text(
            'Submit',
            style:  AppTextStyles.textStyle,
          ),
        ),
      ],
    );
                          // Dialog(
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(6),
                          //   ),
                          //   child: Container(
                          //     width: wSize-24,
                          //     height: hSize*0.4,
                          //     padding: const EdgeInsets.all(16),
                          //     child: Column(
                          //       mainAxisAlignment: MainAxisAlignment.start,
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       mainAxisSize: MainAxisSize.min,
                          //       children: [
                          //         const Text(
                          //           "Share Your Review",
                          //           style: AppTextStyles.titleStyle,
                          //         ),
                          //         const SizedBox(height: 6),
                          //         Divider(color: AppColors.white,),
                          //         const SizedBox(height: 10),
                          //         Row(
                          //           children: [
                          //             Text("Rating : ",style: AppTextStyles.textStyle,),
                          //           ],
                          //         ),
                          //         const SizedBox(height: 10),
                          //         Text("Review : ",style: AppTextStyles.textStyle,),
                          //         const SizedBox(height: 10),
                          //         TextField(
                          //           controller: reviewsController,
                          //           decoration: InputDecoration(
                          //             hintText: 'Your Review',
                          //             border: OutlineInputBorder(
                          //               borderRadius: BorderRadius.circular(6),
                          //             ),
                          //           ),
                          //           maxLines: 3,
                          //         ),
                          //         const Spacer(),
                          //         Row(
                          //           mainAxisAlignment: MainAxisAlignment.end,
                          //           children: [
                          //             TextButton(
                          //               onPressed: () {
                          //                 Navigator.of(context).pop(); // Close the dialog
                          //               },
                          //               child: Text(
                          //                 'Cancel',
                          //                 style: TextStyle(color: Colors.grey),
                          //               ),
                          //             ),
                          //             const SizedBox(width: 8),
                          //             ElevatedButton(
                          //               onPressed: () {
                          //                 Navigator.of(context)
                          //                     .pop(); // Close the dialog after submission
                          //               },
                          //               child: Text('Submit'),
                          //             ),
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // );
                        },
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      padding: const EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppColors.grayColor)),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Share your Reviews on $movieName.",
                            style: AppTextStyles.subTextStyle,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  // Movie Reviews
                  ListView.builder(
                    itemCount: movieDetails['results'].length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero, // remove top spase
                    itemBuilder: (context, index) {
                      _formatDate(index);
                      final review = movieDetails['results'][index]
                              ['author_details']['rating'] ??
                          0.0;
                      final authorName = movieDetails['results'][index]
                              ['author_details']['username'] ??
                          'Unknown';
                      final content =
                          movieDetails['results'][index]['content'] ?? '';
                      return ReviewsCard(
                          authorName: authorName,
                          formattedDate: formattedDate,
                          content: content,
                          review: review);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
