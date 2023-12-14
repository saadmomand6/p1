import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../data/response/status.dart';
import '../../../../view_models/contact_view_model.dart';
import '../jolttact_card.dart';
import '../jolttact_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List obj = JoltTactHelper.chatList;
  ContactViewModel cvm = ContactViewModel();

  @override
  void initState() {
    super.initState();
    cvm.getContactsApiModel();
  }

  TextEditingController searchedtext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Search",
          style: GoogleFonts.inter(
            textStyle: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.normal,
                fontSize: MediaQuery.of(context).size.width * 0.065,
                fontWeight: FontWeight.w600),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                      top: 120.0, right: 30, left: 30, bottom: 0),
                  child: TextFormField(
                    controller: searchedtext,
                    obscureText: false,
                    cursorColor: Colors.red,
                    style: GoogleFonts.inter(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: Theme.of(context).textTheme.labelLarge,
                      filled: true,
                      fillColor: Colors.transparent,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.white)),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  )),
              Container(
                child: obj.isEmpty
                    ? Expanded(
                        child: ListView.builder(
                            padding: const EdgeInsets.only(
                                top: 20, right: 30, left: 30),
                            itemCount: 7,
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey.shade700,
                                highlightColor: Colors.grey.shade100,
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Container(
                                        height: 10,
                                        width: 89,
                                        color: Colors.white,
                                      ),
                                      subtitle: Container(
                                        height: 10,
                                        width: 89,
                                        color: Colors.white,
                                      ),
                                      leading: Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }))
                    : ChangeNotifierProvider<ContactViewModel>.value(
                        value: cvm,
                        child: Consumer<ContactViewModel>(
                            builder: (context, value, _) {
                          switch (value.jolttactslist.status) {
                            case Status.LOADING:
                              return const Center(
                                  child: CircularProgressIndicator(
                                color: Color.fromARGB(255, 197, 155, 206),
                              ));
                            case Status.ERROR:
                              return Text(
                                  value.jolttactslist.message.toString());
                            case Status.COMPLETED:
                              return Expanded(
                                child: AnimationLimiter(
                                  child: ListView.builder(
                                    itemCount: value.jolttactslist.data!
                                        .success!.data!.length,
                                    padding: const EdgeInsets.only(
                                        top: 20, right: 30, left: 30),
                                    itemBuilder: (context, index) {
                                      String name = value.jolttactslist.data!
                                          .success!.data![index].name;
                                      if (searchedtext.text.isEmpty) {
                                        return AnimationConfiguration
                                            .staggeredList(
                                          position: index,
                                          duration: const Duration(
                                              milliseconds: 1000),
                                          child: SlideAnimation(
                                            verticalOffset: 50.0,
                                            child: FadeInAnimation(
                                              child: JolttactCard(
                                                name: value.jolttactslist.data!
                                                    .success!.data![index].name,
                                                // imageurl: joltItem.imageurl.toString(),
                                                time: value
                                                    .jolttactslist
                                                    .data!
                                                    .success!
                                                    .data![index]
                                                    .createdAt,
                                                //nojolt: joltItem.nojolt,
                                                contactid: value
                                                    .jolttactslist
                                                    .data!
                                                    .success!
                                                    .data![index]
                                                    .id,
                                                email: 'email',
                                                numberofjolt: 3,
                                                contactnumber: '000000',
                                                isconnected: value
                                                    .jolttactslist
                                                    .data!
                                                    .success!
                                                    .data![index].isConnected,
                                              ),
                                            ),
                                          ),
                                        );
                                      } else if (name.toLowerCase().contains(
                                          searchedtext.text.toLowerCase())) {
                                        return AnimationConfiguration
                                            .staggeredList(
                                          position: index,
                                          duration: const Duration(
                                              milliseconds: 1000),
                                          child: SlideAnimation(
                                            verticalOffset: 50.0,
                                            child: FadeInAnimation(
                                              child: JolttactCard(
                                                name: value.jolttactslist.data!
                                                    .success!.data![index].name,
                                                //imageurl: joltItem.imageurl.toString(),
                                                time: value
                                                    .jolttactslist
                                                    .data!
                                                    .success!
                                                    .data![index]
                                                    .createdAt,
                                                //nojolt: joltItem.nojolt,
                                                contactid: value
                                                    .jolttactslist
                                                    .data!
                                                    .success!
                                                    .data![index]
                                                    .id,
                                                email: 'email',
                                                numberofjolt: 3,
                                                contactnumber: '000000',
                                                isconnected: value
                                                    .jolttactslist
                                                    .data!
                                                    .success!
                                                    .data![index].isConnected,
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return const Center();
                                      }
                                    },
                                  ),
                                ),
                              );
                            default:
                          }
                          return Container();
                        }),
                      ),
              ),
            ],
          )),
    );
  }
}
