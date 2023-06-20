import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/mobile_apps_model.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';

class IosAppAd extends StatefulWidget {
  const IosAppAd({Key? key}) : super(key: key);

  @override
  State<IosAppAd> createState() => _IosAppAdState();
}

class _IosAppAdState extends State<IosAppAd> with TickerProviderStateMixin{
  final ValueNotifier<int> appIndexValue = ValueNotifier<int>(0);
  late AnimationController _controller;
  late Animation<double> _animation;
  int index = 0;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = _controller.drive(TweenSequence([
      TweenSequenceItem(tween: ConstantTween(0.0), weight: 1.0),
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 1.0),
    ]));
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth),
      tablet: _buildUi(kTabletMaxWidth),
      mobile: _buildUi(getMobileMaxWidth(context)),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ValueListenableBuilder(
            valueListenable: _animation,
            builder: (context, ind, widget) {
              return Flex(
                direction:
                constraints.maxWidth > 720 ? Axis.horizontal : Axis.vertical,
                children: [
                  // Disable expanded on smaller screen to avoid Render errors by setting flex to 0
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    child: Image.asset(
                      apps[index].assetImage,
                      // Set width for image on smaller screen
                      width: constraints.maxWidth > 720.0 ? null : 350.0,
                    ),
                  ),
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          apps[index].header,
                          style: GoogleFonts.oswald(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          apps[index].name.toUpperCase(),
                          style: GoogleFonts.oswald(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            height: 1.3,
                            fontSize: 35.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          apps[index].description,
                          style: const TextStyle(
                            color: kCaptionColor,
                            height: 1.5,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                height: 48.0,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 28.0,
                                ),
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Center(
                                    child: Text(
                                      "EXPLORE MORE",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: kPrimaryColor,
                                  ),
                                ),
                                height: 48.0,
                                padding:
                                const EdgeInsets.symmetric(horizontal: 28.0),
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      index+1 == apps.length ? index = 0 : index++;
                                    });
                                  },
                                  child: const Center(
                                    child: Text(
                                      "NEXT APP",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              );
            }
          );
        },
      ),
    );
  }
}
