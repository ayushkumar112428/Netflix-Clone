import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';

class DisplayMessage extends StatefulWidget {
  String msgType;
  String customMsg;
  Widget? customWidgetForContent;
  bool isFormError;
  bool isMsgDisplayed;
  bool? allowUserToDismissMsg;
  EdgeInsets? margin;

  DisplayMessage(
      {super.key,
      required this.msgType,
      required this.customMsg,
      required this.isFormError,
      this.margin,
      required this.isMsgDisplayed,
      this.allowUserToDismissMsg,
      this.customWidgetForContent});

  @override
  State<DisplayMessage> createState() => _DisplayMessageState();
}

class _DisplayMessageState extends State<DisplayMessage> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: widget.isMsgDisplayed,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: widget.isFormError == true
              ? EdgeInsets.zero
              : const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
          margin: widget.margin ?? EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            color: widget.isFormError == true
                ? Colors.transparent
                : widget.msgType == "error"
                    ? AppColors.errorColor
                    : widget.msgType == "success"
                        ? AppColors.green
                        : AppColors.blue,
          ),
          child: widget.msgType == "error"
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/displayMessageIcon/error_icon.png",
                      color: widget.isFormError == true
                          ? AppColors.errorColor
                          : AppColors.white,
                      width: 24,
                      height: 28,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 4,
                          bottom: 4,
                        ),
                        child: widget.customWidgetForContent ??
                            Text(widget.customMsg,
                                style: widget.isFormError == true
                                    ? const TextStyle(
                                        fontSize: 12,
                                        fontFamily: "primary-font-family",
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.errorColor)
                                    : const TextStyle(
                                        fontSize: 12,
                                        fontFamily: "primary-font-family",
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white)),
                      ),
                    ),
                    widget.isFormError == true
                        ? Container()
                        : widget.allowUserToDismissMsg ?? false
                            ? GestureDetector(
                                child: Image.asset(
                                  "assets/displayMessageIcon/cancel_icon_white.png",
                                  width: 22,
                                  height: 22,
                                  color: AppColors.white,
                                ),
                                onTap: () {
                                  setState(() {
                                    widget.isMsgDisplayed = false;
                                  });
                                },
                              )
                            : Container(),
                  ],
                )
              : widget.msgType == "success"
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/displayMessageIcon/success_icon.png",
                          color: widget.isFormError == true
                              ? AppColors.green
                              : AppColors.white,
                          width: 24,
                          height: 28,
                        ),
                        const SizedBox(
                          width: 8,
                        ),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 4,
                              bottom: 4,
                            ),
                            child: widget.customWidgetForContent ??
                                Text(widget.customMsg,
                                    style: widget.isFormError == true
                                        ? const TextStyle(
                                            fontSize: 12,
                                            fontFamily: "primary-font-family",
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.green,
                                          )
                                        : const TextStyle(
                                            fontSize: 12,
                                            fontFamily: "primary-font-family",
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.white,
                                          )),
                          ),
                        ),

                        // Spacer(),
                        widget.isFormError == true
                            ? Container()
                            : widget.allowUserToDismissMsg ?? false
                                ? GestureDetector(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 4),
                                      child: Image.asset(
                                        "assets/displayMessageIcon/cancel_icon_white.png",
                                        width: 13,
                                        height: 13,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        widget.isMsgDisplayed = false;
                                      });
                                    },
                                  )
                                : Container(),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/displayMessageIcon/warning_icon.png",
                          color: widget.isFormError == true
                              ? AppColors.blue
                              : AppColors.white,
                          width: 18,
                          height: 22,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4, bottom: 4),
                            child: Text(widget.customMsg,
                                style: widget.isFormError == true
                                    ? const TextStyle(
                                        fontSize: 12,
                                        fontFamily: "primary-font-family",
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.blue)
                                    : const TextStyle(
                                        fontSize: 12,
                                        fontFamily: "primary-font-family",
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white)),
                          ),
                        ),
                        widget.isFormError == true
                            ? Container()
                            : widget.allowUserToDismissMsg ?? false
                                ? GestureDetector(
                                    child: Image.asset(
                                      "assets/displayMessageIcon/cancel_icon_white.png",
                                      width: 13,
                                      height: 13,
                                      color: AppColors.white,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        widget.isMsgDisplayed = false;
                                      });
                                    },
                                  )
                                : Container(),
                      ],
                    ),
        ));
  }
}
