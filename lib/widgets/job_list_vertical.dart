import 'package:flutter/material.dart';
import 'package:ui_findjob/widgets/comp_item_job.dart';
import 'package:ui_findjob/models/jobs.dart';

class JobList extends StatelessWidget {
  List<Job> jobs;
  JobList(this.jobs);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: this.jobs.length,
      itemBuilder: (context, index) => CompactItemJob(this.jobs[index]),
    );
  }
}
