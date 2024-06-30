import "package:flutter/material.dart";
import "package:sports_app/data/models/get_countries_mpdel.dart";
import "package:sports_app/data/repositories/get_countries_rep.dart";

class MyCountry extends StatefulWidget {
  const MyCountry({super.key});

  @override
  State<MyCountry> createState() => _MyCountryState();
}

class _MyCountryState extends State<MyCountry> {
  final GetCountriesRep repo = GetCountriesRep();

  List<GetCountryModel> countriesmodels = [];
  @override
  initState() {
    fitchData();
    super.initState();
  }

  void fitchData() async {
    try {
      setState(() {
        state == 1;
      });
    } catch (e) {}
    countriesmodels = await repo.getcountries();
    setState(() {
      state = 2;
    });
  }

  void _runfilter(String enteredKeyword) {
    List<GetCountryModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = countriesmodels;
    } else {
      results = countriesmodels
          .where((user) => user.countryName
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      countriesmodels = results;
    });
  }

  int state = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  onChanged: (value) => _runfilter(value),
                  decoration: const InputDecoration(
                      labelText: 'Search', suffixIcon: Icon(Icons.search)),
                  onTap: () {
                    fitchData();
                  },
                ),
                if (state == 0)
                  if (state == 1) CircularProgressIndicator(),
                if (state == 2)
                  const SizedBox(
                    height: 20,
                  ),
                SizedBox(
                  height: 600,
                  child: ListView.builder(
                      itemCount: countriesmodels.length,
                      itemBuilder: (context, index) {
                        print(countriesmodels.length);
                        print(countriesmodels[index].countryLogo);
                        print("here");

                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              countriesmodels[index].countryLogo,
                            ),
                          ),
                          title: Text(countriesmodels[index].countryName,
                              style: const TextStyle(
                                  fontSize: 24, color: Colors.black)),
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
