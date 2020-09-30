import 'package:flutter/material.dart';
import 'package:ui_findjob/models/jobs.dart';
import 'package:ui_findjob/models/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

class CompactItemJob extends StatefulWidget {
  Job job;
  bool themeDark;
  CompactItemJob(this.job, {this.themeDark = false});

  @override
  _CompactItemJobState createState() => _CompactItemJobState();
}

class _CompactItemJobState extends State<CompactItemJob> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: InkWell(
        onTap: () => openBottomSheet(),
        child: Container(
          decoration: _boxDecoration(),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _companyLogo(),
                  _infoJobText(context),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FavIcon(
                  job: this.widget.job,
                  themeDark: this.widget.themeDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _companyLogo() {
    return Container(
      width: 100,
      height: 80,
      padding: const EdgeInsets.all(20.0),
      child: (Image.network(
        this.widget.job.com.urlLogo,
        fit: BoxFit.fill,
      )),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black26, offset: Offset(2.0, 2.0))
        ]);
  }

  Widget _infoJobText(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          this.widget.job.com.name,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          this.widget.job.role,
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(
          height: 3,
        ),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: Theme.of(context).primaryColor,
              size: 15,
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              this.widget.job.location,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }

  void openBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return OpenBottomSheet(
            job: this.widget.job,
            themeDark: this.widget.themeDark,
          );
        });
  }
}

class OpenBottomSheet extends StatefulWidget {
  final Job job;
  final bool themeDark;

  const OpenBottomSheet({Key key, @required this.job, @required this.themeDark})
      : super(key: key);
  @override
  _OpenBottomSheetState createState() => _OpenBottomSheetState();
}

class _OpenBottomSheetState extends State<OpenBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(top: 25 * SizeConfig.heightMultiplier),
        child: Container(
          height: 90 * SizeConfig.heightMultiplier,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 3 * SizeConfig.heightMultiplier,
                    horizontal: 4 * SizeConfig.widthMultiplier),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 5 * SizeConfig.imageSizeMultiplier,
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        print("object");
                      },
                      child: Icon(
                        Icons.file_upload,
                        color: Colors.black,
                        size: 6 * SizeConfig.imageSizeMultiplier,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Image.network(
                      this.widget.job.com.urlLogo,
                      height: 15 * SizeConfig.imageSizeMultiplier,
                      width: 15 * SizeConfig.imageSizeMultiplier,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2 * SizeConfig.heightMultiplier,
              ),
              Center(
                child: Text(
                  this.widget.job.role,
                  style: GoogleFonts.nunitoSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 4 * SizeConfig.textMultiplier),
                ),
              ),
              SizedBox(
                height: 1 * SizeConfig.heightMultiplier,
              ),
              Center(
                child: Text(
                  this.widget.job.location,
                  style: GoogleFonts.nunitoSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 1.7 * SizeConfig.textMultiplier),
                ),
              ),
              SizedBox(
                height: 2 * SizeConfig.heightMultiplier,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 7 * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 3 * SizeConfig.widthMultiplier),
                      child: Center(
                        child: Text(
                          "Description",
                          style: GoogleFonts.nunitoSans(
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              fontSize: 2 * SizeConfig.textMultiplier),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 7 * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 3 * SizeConfig.widthMultiplier),
                      child: Center(
                        child: Text(
                          "Company",
                          style: GoogleFonts.nunitoSans(
                              color: Colors.black45,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              fontSize: 2 * SizeConfig.textMultiplier),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 7 * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 3 * SizeConfig.widthMultiplier),
                      child: Center(
                        child: Text(
                          "Reviews",
                          style: GoogleFonts.nunitoSans(
                              color: Colors.black45,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              fontSize: 2 * SizeConfig.textMultiplier),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2 * SizeConfig.heightMultiplier,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 4 * SizeConfig.widthMultiplier),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Minimum Qualifications",
                      style: GoogleFonts.nunitoSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                          fontSize: 2 * SizeConfig.textMultiplier),
                    ),
                    SizedBox(
                      height: 2 * SizeConfig.heightMultiplier,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 3.0,
                            backgroundColor: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 2 * SizeConfig.widthMultiplier,
                        ),
                        Text(
                          "Bachelor's degree in design or\nequivalent practical experience",
                          style: GoogleFonts.nunitoSans(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              fontSize: 1.7 * SizeConfig.textMultiplier),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1 * SizeConfig.heightMultiplier,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 3.0,
                            backgroundColor: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 2 * SizeConfig.widthMultiplier,
                        ),
                        Text(
                          "Experience designing across\nmultiple platforms",
                          style: GoogleFonts.nunitoSans(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              fontSize: 1.7 * SizeConfig.textMultiplier),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                height: 10 * SizeConfig.heightMultiplier,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey[200],
                      offset: Offset(-3, -3),
                      blurRadius: 10.0)
                ]),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 4 * SizeConfig.widthMultiplier),
                  child: Row(
                    children: [
                      Container(
                        height: 7.5 * SizeConfig.heightMultiplier,
                        width: 15 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Theme.of(context).accentColor,
                                width: 3.0)),
                        child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FavIcon(
                              job: this.widget.job,
                              themeDark: this.widget.themeDark,
                            )),
                      ),
                      SizedBox(
                        width: 2 * SizeConfig.widthMultiplier,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => print("Aplicar"),
                          child: Container(
                            height: 7.5 * SizeConfig.heightMultiplier,
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Center(
                              child: Text(
                                "Aplicar Ahora",
                                style: GoogleFonts.nunitoSans(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                    fontSize: 2 * SizeConfig.textMultiplier),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavIcon extends StatefulWidget {
  final Job job;
  final bool themeDark;

  const FavIcon({
    Key key,
    @required this.job,
    @required this.themeDark,
  }) : super(key: key);
  @override
  _FavIconState createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        this.widget.job.isFavorite ? Icons.favorite : Icons.favorite,
        color: this.widget.job.isFavorite
            ? this.widget.themeDark ? Colors.pink : Colors.red
            : this.widget.themeDark ? Colors.grey : Colors.grey,
      ),
      onTap: () {
        setState(() {
          this.widget.job.isFavorite = !this.widget.job.isFavorite;
        });
      },
    );
  }
}
