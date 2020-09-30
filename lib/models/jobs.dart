import './company.dart';

class Job {
  String location;
  String role;
  Company com;
  bool isFavorite;
  List<String> requisitos;

  Job(
      {this.location,
      this.com,
      this.role,
      this.isFavorite = false,
      this.requisitos});
}
