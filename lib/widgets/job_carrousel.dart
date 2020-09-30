import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ui_findjob/widgets/item_job_card.dart';
import 'package:ui_findjob/models/jobs.dart';

class JobCarousel extends StatelessWidget {
  List<Job> jobs;

  JobCarousel(this.jobs);
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: this
          .jobs
          .map((e) => ItemJob(
                e,
                themeDark: jobs.indexOf(e) == 0,
              ))
          .toList(),
      options: CarouselOptions(
          height: 230,
          enableInfiniteScroll: false,
          autoPlay: false,
          reverse: false,
          viewportFraction: 0.86),
    );
  }
}
