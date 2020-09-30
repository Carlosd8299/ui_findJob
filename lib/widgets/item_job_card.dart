import 'package:flutter/material.dart';
import 'package:ui_findjob/models/jobs.dart';

class ItemJob extends StatefulWidget {
  bool themeDark;
  Job job;
  ItemJob(this.job, {this.themeDark = false});

  @override
  _ItemJobState createState() => _ItemJobState();
}

class _ItemJobState extends State<ItemJob> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, bottom: 20, top: 20),
      child: Container(
        decoration: _boxDecoration(context),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _companyLogo(),
                  SizedBox(
                    height: 15,
                  ),
                  _favIcon(),
                ],
              ),
              _infoJob(context),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration(context) {
    return BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              offset: Offset(4.0, 4.0),
              blurRadius: 10.0,
              color: Colors.black.withOpacity(0.8))
        ],
        borderRadius: BorderRadius.circular(10),
        color: this.widget.themeDark
            ? Theme.of(context).primaryColor
            : Colors.white);
  }

  Widget _companyLogo() {
    return Container(
      child: ClipRRect(
        child: Image.network(
          this.widget.job.com.urlLogo,
          width: 60,
        ),
      ),
    );
  }

  Widget _favIcon() {
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

  Widget _infoJob(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          this.widget.job.com.name,
          style: TextStyle(
              fontSize: 15,
              color: this.widget.themeDark ? Colors.white : Colors.grey),
        ),
        Text(
          this.widget.job.role,
          style: this.widget.themeDark
              ? Theme.of(context).textTheme.headline3
              : Theme.of(context).textTheme.headline4,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: Theme.of(context).accentColor,
              size: 15,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              this.widget.job.location,
              style: TextStyle(
                  fontSize: 15,
                  color: this.widget.themeDark ? Colors.white : Colors.black),
            )
          ],
        ),
      ],
    );
  }
}
