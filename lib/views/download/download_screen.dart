import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';
import 'package:netflixclone/widget/image_card.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {

  List<Map<String,dynamic>> downloadData = [
    {
      'img': "https://image.tmdb.org/t/p/w500/e5ZqqPlhKstzB4geibpZh38w7Pq.jpg",
      'title': "The Convert",
      'subTitle': '''The Convert is a 2023 historical drama film directed by Lee Tamahori, and starring Guy Pearce, Tioreore Ngatai-Melbourne and Te Kohe Tuhaka. The script for the film was written by Tamahori and Shane Danielsen from a story by Michael Bennett based on the 2011 novel Wulf by Hamish Clayton. It is an international co-production between New Zealand, Australia and the United Kingdom.''',
      'date': "July 12, 2024",
    },
    {
      'img': "https://image.tmdb.org/t/p/w500/b33nnKl1GSFbao4l3fZDDqsMx0F.jpg",
      'title': "ALIEN Romulus",
      'subTitle': "While scavenging the deep ends of a derelict space station, a group of young space colonists come face to face with the most terrifying life form in the universe.",
      'date': "August 16, 2024",
    },
    {
      'img': "https://image.tmdb.org/t/p/w500/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
      'title': "Deadpool and Wolverine",
      'subTitle': "Deadpool is offered a place in the Marvel Cinematic Universe by the Time Variance Authority, but instead recruits a variant of Wolverine to save his universe from extinction.",
      'date': "July 26, 2024",
    },
    {
      'img': "https://image.tmdb.org/t/p/w500/3ovFaFeojLFIl5ClqhtgYMDS8sE.jpg",
      'title': "The Mousetrap",
      'subTitle': '''Takes place in a newly established bed and breakfast, Monkswell Manor, outside London during a blizzard. There has been a murder nearby and the murderer is still free to carry out their further plans. As the guests arrive, everyone fits the murderer's description and has a secret.''',
      'date': "August 6, 2024",
    },
  ];

  bool downloadOnOff = false;
  Color downloadIconColor = AppColors.grayColor;
  Color downloadTextColor = AppColors.grayColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Download",style: AppTextStyles.titleStyle,),
        backgroundColor: AppColors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 7),
        child: ListView.builder(
            itemCount: downloadData.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: AppColors.black,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImageCard(img: downloadData[index]['img']),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: SizedBox(
                          height: 250 * 0.55,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(downloadData[index]['title'],style: AppTextStyles.textStyle,),
                              Text(downloadData[index]['subTitle'],maxLines: 3,overflow: TextOverflow.ellipsis,style: AppTextStyles.subTextStyle,),
                              Text(downloadData[index]['date'],style: AppTextStyles.subTextStyle,),
                              const SizedBox(height: 5,),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    downloadOnOff = !downloadOnOff;
                                    if(downloadOnOff){
                                      downloadIconColor = AppColors.blueText;
                                      downloadTextColor = AppColors.white;
                                    }else{
                                      downloadIconColor = AppColors.grayText;
                                      downloadTextColor = AppColors.grayText;
                                    }
                                  });
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.download_for_offline_outlined,color: downloadIconColor,size: 24,),
                                    const SizedBox(width: 6,),
                                    Text("155.20kb / 2.5GB",style: AppTextStyles.textStyle.copyWith(color: downloadTextColor,fontSize: 14),),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
