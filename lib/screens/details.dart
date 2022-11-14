
import 'package:carousel_slider/carousel_slider.dart';
import 'package:explore/service/country_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../model/country_model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage(
      {super.key, required this.index, required this.countryName});

  final int index;
  final String? countryName;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Future<List<Country>>? countries;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    countries = CountryRepositoryService().getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkNotifier.value ? Color(0xff000F24) : Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:  darkNotifier.value ? Color(0xff000F24) : Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            CupertinoIcons.arrow_left,
            color: darkNotifier.value ? Colors.white : Colors.black,
          ),
        ),
        title: FutureBuilder<List<Country>>(
          future: countries,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container();
            }
            if (snapshot.hasData) {
              if (snapshot.data == null) {
                return const Text("Empty List");
              }
              // if(snapshot.data[widget.index])
              return Text(
                "${snapshot.data?[widget.index].name?.common}",
                style: TextStyle(
                    fontFamily: "Axiforma",
                    fontWeight: FontWeight.w800,
                    color:  darkNotifier.value ? Colors.white : Colors.black,
                    fontSize: 25),
              );
            } else {
              return Text("error");
            }
          },
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          // child: Text("${widget.index}"),
          child: FutureBuilder<List<Country>>(
            future: countries,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: const CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                if (snapshot.data == null) {
                  return const Text("Empty List");
                }
                // if(snapshot.data[widget.index])
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      CarouselSlider(
                        items: [
                          Image.network(
                            "${snapshot.data?[widget.index].flags?.png}",
                          ),
                          Image.network(
                              "${snapshot.data?[widget.index].coatOfArms?.png}")
                        ],
                        options: CarouselOptions(
                          pageSnapping: true,
                          height: 200,
                        ),
                      ),
                      SizedBox(height: 24),
                      DetailTextRow(
                        field: "Population",
                        location:
                        "${snapshot.data?[widget.index].population}",
                      ),
                      DetailTextRow(
                          field: "Region",
                          location: "${snapshot.data?[widget.index].region}"),
                      DetailTextRow(
                          field: "Capital",
                          location:
                          "${snapshot.data?[widget.index].capital == null ? "" : snapshot.data?[widget.index].capital[0]}"),
                      DetailTextRow(field: "Motto", location: 'null'),
                      SizedBox(height: 24),
                      DetailTextRow(
                          field: "Official Language",
                          location:
                          "${snapshot.data?[widget.index].languages!.ara}"),
                      DetailTextRow(
                          field: "Ethic group",
                          location:
                          "null"),
                      DetailTextRow(
                          field: "Religion",
                          location:
                          "null"),
                      DetailTextRow(
                          field: "Government",
                          location:
                          "null"),
                      SizedBox(height: 24),
                      DetailTextRow(
                          field: "Independence",
                          location: "${snapshot.data?[widget.index].independent}"),
                      DetailTextRow(
                          field: "Area",
                          location: "${snapshot.data?[widget.index].area} km2"),
                      DetailTextRow(
                          field: "Currency",
                          location: "${snapshot.data?[widget.index]}"),
                      DetailTextRow(
                          field: "GDP",
                          location: "null"),
                      SizedBox(height: 24),
                      DetailTextRow(
                          field: "Time zone",
                          location: "${snapshot.data?[widget.index].timezones}"),
                      DetailTextRow(
                          field: "Date format",
                          location: "${snapshot.data?[widget.index]}"),
                      DetailTextRow(
                          field: "Dialing code",
                          location: "${snapshot.data?[widget.index]}"),
                      DetailTextRow(
                          field: "Driving side",
                          location: "${snapshot.data?[widget.index].car}"),
                    ],
                  ),
                );
              } else {
                return Text("error");
              }
            },
          ),
        ),
      ),
    );
  }
}

class DetailTextRow extends StatelessWidget {
  const DetailTextRow({
    Key? key,
    required this.field,
    required this.location,
  }) : super(key: key);

  final String field;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$field:",
          style: const TextStyle(
              fontFamily: "Axiforma",
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          location,
          style: const TextStyle(
              fontFamily: "Axiforma",
              fontSize: 16,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
