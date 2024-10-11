import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflixclone/api/url.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';
import 'package:netflixclone/models/episode_list_model.dart';

class EpisodePart extends StatefulWidget {
  final num id;
  final String name;
  final EpisodeDataModel episodeData;
  final List<Episode> episodeListData;
  const EpisodePart(
      {super.key,
      required this.id,
      required this.name,
      required this.episodeData,
      required this.episodeListData,});

  @override
  State<EpisodePart> createState() => _EpisodePartState();
}

class _EpisodePartState extends State<EpisodePart> {
  int count = 5;
  // timestamp
  late String formattedDate;
  String _formatDate(String timestamp) {
    // Parse the timestamp to a DateTime object
    DateTime parsedDate = DateTime.parse(timestamp);
    // Format the date to "yyyy-MM-dd"
    formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
    return formattedDate.toString();
  }
  @override
  Widget build(BuildContext context) {
    double wSize = MediaQuery.of(context).size.width - 24;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.episodeData.name!,
          style: AppTextStyles.hedgingTextStyle,
        ),
        const SizedBox(height: 3,),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: count,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                height: (wSize) * 0.562 * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: wSize * 0.5,
                        height: (wSize) * 0.562 * 0.5,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                            image: NetworkImage(
                                "$imageUrl${widget.episodeListData[index].stillPath}"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ep: ${index+1} : ${widget.episodeListData[index].name}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.textStyle,
                              ),
                              Text(
                                widget.episodeListData[index].overview != '' ?widget.episodeListData[index].overview!
                                : widget.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.subTextStyle,
                              ),
                              Text(
                                _formatDate(widget.episodeListData[index].airDate!),
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.subTextStyle,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        if (count < (widget.episodeListData.length))
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                setState(() {
                  // Increase the displayed item count by 10 more each time
                  count += 10;
                });
              },
              child: const Text(
                'Show More...',
                style: AppTextStyles.textStyle,
              ),
            ),
          ),
      ],
    );
  }
}
