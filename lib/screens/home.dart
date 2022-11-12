import 'package:explore/service/country_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';import '../model/country_model.dart';


import 'details.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String searchParams = "";
  TextEditingController searchController = TextEditingController();

  late Future<List<Country>> countryList;
  var isDone = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() {
    countryList = CountryRepositoryService().getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Explore.',
            style: TextStyle(
                fontSize: 24, fontFamily: 'tectonica', color: Colors.black),
          ),
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                CupertinoIcons.sun_max,
                color: Colors.black,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        body: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                      controller: searchController,
                      onChanged: (value) {
                        setState(() {
                          searchParams = searchController.text;
                        });
                      },
                      readOnly: false,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: 'Search Country',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)))),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, spreadRadius: 1.5)
                              ]),
                          child: Row(
                            children: [Icon(Icons.language), Text(' EN')],
                          ),
                        ),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, spreadRadius: 1.5)
                              ]),
                          child: Row(
                            children: [Icon(Icons.filter_alt), Text(' Filter')],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Flexible(
                    child: FutureBuilder<List<Country>>(
                        future: countryList,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          if (snapshot.hasData) {
                            if (snapshot.data == null) {
                              return const Text("Empty List");
                            }
                            return Column(
                              children: [
                                const SizedBox(
                                  height: 16,
                                ),
                                Flexible(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot.data?.length,
                                      itemBuilder: (context, index) {
                                        if (snapshot.data?[index].name?.common!
                                                .toLowerCase()
                                                .contains(searchController.text
                                                    .toLowerCase()) ==
                                            true) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 26),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailsPage(
                                                              index: index,
                                                              countryName:
                                                                  snapshot
                                                                      .data?[
                                                                          index]
                                                                      .name
                                                                      ?.common!,
                                                            )));
                                              },
                                              child: Row(
                                                children: [
                                                  ClipRRect(
                                                    clipBehavior: Clip.hardEdge,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Image.network(
                                                      "${snapshot.data?[index].flags?.png}",
                                                      height: 40,
                                                      width: 40,
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 16,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "${snapshot.data?[index].name?.common}",
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                "Axiforma",
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontSize: 14),
                                                      ),
                                                      Text(
                                                        "${snapshot.data?[index].capital == null ? "" : snapshot.data?[index].capital[0]}",
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                "Axiforma",
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Container();
                                        }
                                      }),
                                ),
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return const Text("error");
                        }),
                  ),
                ],
              ),
            )));
  }
}
