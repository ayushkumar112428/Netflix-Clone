import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';
import 'package:netflixclone/widget/icon_text_ontap_column.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double wSize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24,right: 24,bottom: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/netflix/netflixN.png"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/cast_icon.png",height: 40,width: 40,fit: BoxFit.fill,),
                    const SizedBox(width: 10,),
                    Image.asset("assets/icons/user_icon.png",height: 36,width: 36,fit: BoxFit.fill,),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: wSize,
            height: 520,
            child: Stack(
              children: [
                SizedBox(
                  width: wSize,
                  height: 520,
                  child: Image.asset("assets/5TeXzr6Qu00UBGSO7dhIUPtmk8E.jpg",height: 500,width: wSize,fit: BoxFit.fill,),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('left')),
                        );
                      },
                      child: SizedBox(
                        width: wSize*0.5,
                        height: 520,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('right')),
                        );
                      },
                      child: SizedBox(
                        width: wSize*0.5,
                        height: 520,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: wSize,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: AppColors().homeImageTopToBottom,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: wSize,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: AppColors().homeImageBottomToTop,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Movie",style: AppTextStyles.normalText,),
                      Text("Tv Show",style: AppTextStyles.normalText,),
                      Text("Categories",style: AppTextStyles.normalText,),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: SizedBox(
                    width: wSize,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconTextOnTapColumn(img: "assets/icons/add_icon.png",title: "My List",onTap: (){},),
                          Container(
                            width: 120,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          IconTextOnTapColumn(img: "assets/icons/info_icon.png",title: "Info",onTap: (){},),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
