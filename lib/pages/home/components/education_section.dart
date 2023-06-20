import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/education.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';

final List<Education> educationList = [
  Education(
    name: "Expert Big Data Engineer",
    description:
        "This is a specialized master degree progrm aimed at providing students"
        " with advanced knowledge and skills in Big Data projects. It tacles"
        " every single aspects of Data Projects; Identifying the problem, "
        "Designing as Big Data project/program that prvides a solution to the"
        "problem, building the project from start to finish, and more.",
    linkName:
        "www.utt.fr/formations/mastere-specialise/expert-big-data-engineer",
    period: "2023 - PRESENT",
  ),
  Education(
    name: "Manager de Solution Digitale et Data",
    description:
        "This is a professional master degree program that provides students"
        "with professional skills in project management from communication "
        "with the client to produce Specification, software development, "
        "team management, project management, testing deployment and many others",
    linkName: "https://www.3il-ingenieurs.fr/nos-programmes-experts-bac5/programme-expert-bac5-manager-de-solutions-digitales-et-data-ms2d/#:~:text=Le%20Manager%20de%20solutions%20digitales,soci%C3%A9t%C3%A9%20dans%20laquelle%20il%20travaille",
    period: "2020 - 2022",
  ),
  Education(
    name: "Bachelor of Science in Computer Science",
    description:
        "This is a bachelor degree program that is aimed at introducing"
            " the student to all the different key notions if computer science. Here"
            "we are introduced to algorithms, date structures, databases, networking"
            "compilation, mathematics for IT, programming, and so much more."
            "It was basically a preparation to a specialization in any field of your choice.",
    linkName: "",
    period: "2016 - 2020",
  ),
];

class EducationSection extends StatelessWidget {
  const EducationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth),
      tablet: _buildUi(kTabletMaxWidth),
      mobile: _buildUi(getMobileMaxWidth(context)),
    );
  }

  Widget _buildUi(double width) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "EDUCATION",
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 30.0,
              height: 1.3,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Wrap(
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 400.0),
                child: const Text(
                  "Started off with the basics, then went through software project development and management. Now going for a Big Data specialisation",
                  style: TextStyle(
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40.0,
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                children: educationList
                    .map(
                      (education) => SizedBox(
                        width: constraints.maxWidth / 2.0 - 20.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              education.name,
                              style: GoogleFonts.oswald(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              education.period,
                              style: GoogleFonts.oswald(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15.0,
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              education.description,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: kCaptionColor,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  if (education.linkName != ""){
                                    //TODO: open link in a new tab
                                  }
                                },
                                child: Text(
                                  education.linkName == "" ? "No existing website" : "View website",

                                  style: const TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40.0,
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          )
        ],
      ),
    );
  }
}
