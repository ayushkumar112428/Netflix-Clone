import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';
import 'package:netflixclone/widget/icon_text_ontap_column.dart';
import 'package:netflixclone/widget/image_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double wSize = MediaQuery.of(context).size.width;
    double homePageImageHeight = wSize*3/2;
    return Scaffold(
      body: ListView(
        children: [
          // AppBar
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
          // center Image
          SizedBox(
            width: wSize,
            height: homePageImageHeight,
            child: Stack(
              children: [
                // image
                SizedBox(
                  width: wSize,
                  height: homePageImageHeight,
                  child: Image.network("https://image.tmdb.org/t/p/w500/b33nnKl1GSFbao4l3fZDDqsMx0F.jpg",height: homePageImageHeight,width: wSize,fit: BoxFit.fill,),
                ),
                // chang image onTap
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('left')),
                        );
                      },
                      child: SizedBox(
                        width: wSize*0.5,
                        height: homePageImageHeight,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('right')),
                        );
                      },
                      child: SizedBox(
                        width: wSize*0.5,
                        height: homePageImageHeight,
                      ),
                    ),
                  ],
                ),
                // Top to Bottom Shadow
                Container(
                  width: wSize,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: AppColors().homeImageTopToBottom,
                  ),
                ),
                // Bottom to Top Shadow
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
                // top row movie, TV Shows, Categories
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Movie",style: AppTextStyles.textButtonTextStyle,),
                      Text("TV Shows",style: AppTextStyles.textButtonTextStyle,),
                      Text("Categories",style: AppTextStyles.textButtonTextStyle,),
                    ],
                  ),
                ),
                // bottom row my list, play and info
                Positioned(
                  bottom: 10,
                  child: SizedBox(
                    width: wSize,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconTextOnTapColumn(img: "assets/icons/add_icon.png",title: "My List",onTap: (){},),
                          Container(
                            width: 120,
                            height: 45,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/icons/play_icon.png",height: 28,width: 28,fit: BoxFit.fill,),
                                Text("Play",style: AppTextStyles.hedgingTextStyle.copyWith(color: Colors.black),)
                              ],
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
          // bottom column
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Popular Movie",style: AppTextStyles.hedgingTextStyle,),
                const SizedBox(height: 3,),
                SizedBox(
                  height: 250 * 0.7,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return const ImageCard(img: "https://image.tmdb.org/t/p/w500/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg");
                    },
                  ),
                ),
                const SizedBox(height: 10,),
                const Text("Popular TV Series",style: AppTextStyles.hedgingTextStyle,),
                const SizedBox(height: 3,),
                SizedBox(
                  height: 250 * 0.7,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return const ImageCard(img: "https://image.tmdb.org/t/p/w500/3ovFaFeojLFIl5ClqhtgYMDS8sE.jpg");
                    },
                  ),
                ),
                const SizedBox(height: 10,),
                const Text("Top Rated Movie",style: AppTextStyles.hedgingTextStyle,),
                const SizedBox(height: 3,),
                SizedBox(
                  height: 250 * 0.7,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return const ImageCard(img: "https://image.tmdb.org/t/p/w500/e5ZqqPlhKstzB4geibpZh38w7Pq.jpg");
                    },
                  ),
                ),
                const SizedBox(height: 10,),
                const Text("Upcoming Movie",style: AppTextStyles.hedgingTextStyle,),
                const Text("Trending Movie & TV Shows",style: AppTextStyles.hedgingTextStyle,),
                const Text("Airing Today TV Series",style: AppTextStyles.hedgingTextStyle,),
                const Text("Top Rated TV Series",style: AppTextStyles.hedgingTextStyle,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
