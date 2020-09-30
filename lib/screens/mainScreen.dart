import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_findjob/widgets/job_carrousel.dart';
import 'package:ui_findjob/widgets/job_list_vertical.dart';
import 'package:ui_findjob/models/company.dart';
import 'package:ui_findjob/models/jobs.dart';

class MainScreen extends StatelessWidget {
  List<Job> forYouJobs = [
    Job(
      role: "Ingeniero de sistemas",
      location: "Cali",
      isFavorite: true,
      com: Company(
          name: "Ecopetrol",
          urlLogo:
              "https://www.ecopetrol.com.co/wps/wcm/connect/9a0251c3-8875-4522-95c0-027e17cb40cf/Cooperemos_Color_Positivo.png?MOD=AJPERES&CACHEID=ROOTWORKSPACE-9a0251c3-8875-4522-95c0-027e17cb40cf-n864Oke"),
    ),
    Job(
        role: "Ingeniero de minas",
        location: "Bogota",
        isFavorite: true,
        com: Company(
            name: "Terpel",
            urlLogo:
                "https://bogota.gov.co/sites/default/files/2020-03/terpel-bogota-solidaria-en-casa-donacion_0.jpg")),
    Job(
        role: "Medico",
        location: "Medellin",
        com: Company(
            name: "Sanitas",
            urlLogo:
                "https://www.epssanitas.com/usuarios/documents/9441058/88879717/logo_eps_sanitas.png/e5a3cd11-6ee3-4e5d-baec-2ad5c4253db0?version=1.0&t=1584375934151&imagePreview=1")),
    Job(
        role: "Abogado",
        location: "Barranquilla",
        com: Company(
            name: "DelaEspriella Layer",
            urlLogo:
                "https://lawyersenterprise.com/wp-content/uploads/2019/11/favicon.jpg")),
  ];

  List<Job> recentJobs = [
    Job(
      role: "Ingeniero de sistemas",
      location: "Cali",
      isFavorite: true,
      com: Company(
          name: "Ecopetrol",
          urlLogo:
              "https://www.ecopetrol.com.co/wps/wcm/connect/9a0251c3-8875-4522-95c0-027e17cb40cf/Cooperemos_Color_Positivo.png?MOD=AJPERES&CACHEID=ROOTWORKSPACE-9a0251c3-8875-4522-95c0-027e17cb40cf-n864Oke"),
    ),
    Job(
        role: "Ingeniero de minas",
        location: "Bogota",
        isFavorite: true,
        com: Company(
            name: "Terpel",
            urlLogo:
                "https://bogota.gov.co/sites/default/files/2020-03/terpel-bogota-solidaria-en-casa-donacion_0.jpg")),
    Job(
        role: "Medico",
        location: "Medellin",
        com: Company(
            name: "Sanitas",
            urlLogo:
                "https://www.epssanitas.com/usuarios/documents/9441058/88879717/logo_eps_sanitas.png/e5a3cd11-6ee3-4e5d-baec-2ad5c4253db0?version=1.0&t=1584375934151&imagePreview=1")),
    Job(
        role: "Abogado",
        location: "Barranquilla",
        com: Company(
            name: "DelaEspriella Layer",
            urlLogo:
                "https://lawyersenterprise.com/wp-content/uploads/2019/11/favicon.jpg")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          _customAppBar(),
          _textHeader(context),
          _forYou(context),
          _recentJobs(context),
        ],
      )),
    );
  }

  Widget _customAppBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              iconSize: 30.0,
              icon: SvgPicture.asset('assets/icons/slider.svg'),
              onPressed: () {}),
          Row(
            children: [
              IconButton(
                  iconSize: 30.0,
                  icon: SvgPicture.asset('assets/icons/search.svg'),
                  onPressed: () {}),
              IconButton(
                  iconSize: 30.0,
                  icon: SvgPicture.asset('assets/icons/settings.svg'),
                  onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _textHeader(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hola', style: Theme.of(context).textTheme.bodyText1),
          Text('Encuentra tu proximo trabajo',
              style: Theme.of(context).textTheme.headline1),
        ],
      ),
    );
  }

  Widget _forYou(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Column(
            children: [
              Text(
                'For you',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
        JobCarousel(forYouJobs),
      ],
    );
  }

  Widget _recentJobs(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Recent',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'Mas',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: JobList(
            this.recentJobs,
          ),
        ),
      ],
    );
  }
}
