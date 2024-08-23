import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';
import 'package:netflixclone/widget/image_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: ListView(
          children: [
            // Search Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.graySearchBarColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 10),
                        Image.asset("assets/icons/search_icon_field.png",width: 20,height: 20,fit: BoxFit.fill,),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            cursorColor: AppColors.white,
                            cursorHeight: 18,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: AppTextStyles.textStyle.copyWith(color: AppColors.grayColor,letterSpacing: 1.1),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.only(bottom: 7),
                            ),
                            onChanged: (value) {
                              setState(() {}); // Update UI when text changes
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Image.asset("assets/icons/cancel_icon.png",width: 20,height: 20,fit: BoxFit.fill,),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Cancel',
                    style: AppTextStyles.textStyle,
                  ),
                ),
                const SizedBox(width: 24),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Movie & TV",style: AppTextStyles.hedgingTextStyle,),
            const SizedBox(height: 10),
            SizedBox(
              height: 250 * 0.7,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return ImageCard(img: "https://image.tmdb.org/t/p/w500/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg");
                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
