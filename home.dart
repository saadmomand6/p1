import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joltconnection/data/response/status.dart';
import 'package:provider/provider.dart';
import '../../components/button.dart';
import '../../main.dart';
import '../../view_models/contact_view_model.dart';
import 'components/createjolt/create_mass_jolt.dart';
import 'components/jolttact_card.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'components/search/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List nameslist = [];
  late TabController tabController;
  int currentTabIndex = 0;

  List<Contact>? contacts;

  ContactViewModel cvm = ContactViewModel();

  String? selectedContactId;

  @override
  void initState() {
    super.initState();
    cvm.getContactsApiModel();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {
        currentTabIndex = tabController.index;
      });
    });
    //getdndpermission();
    Timer(const Duration(seconds: 5), () {
      getphonedata();
    });
  }

  // Future<bool?> getdndpermission()async{
  //   await PermissionHandler.openDoNotDisturbSetting();
  // }
  void getphonedata() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    //final synccontactviewmodel = Provider.of<ContactViewModel>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(186, 31, 22, 39),
          title: Padding(
            padding: const EdgeInsets.only(top: 15, left: 20),
            child: Text(
              "Home",
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontSize: MediaQuery.of(context).size.width * 0.065,
                    fontWeight: FontWeight.w600),
              ),
            )
                .animate()
                .fadeIn(duration: 500.ms)
                .scale(delay: 500.ms)
                .move(delay: 300.ms, duration: 600.ms),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 0),
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  size: MediaQuery.of(context).size.width * 0.065,
                ),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                          builder: (context) => const SearchScreen()));
                },
              ),
            ),
            Builder(
              builder: (BuildContext context) {
                if (currentTabIndex == 1) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15, left: 0),
                    child: IconButton(
                      icon: Icon(
                        Icons.sync,
                        size: MediaQuery.of(context).size.width * 0.065,
                      ),
                      onPressed: () {
                        List<Map<String, String>> contactsList = [];
                        for (var contact in contacts!) {
                          contactsList.add({
                            "name":
                                '${contact.name.first} ${contact.name.middle} ${contact.name.last}',
                            "phone": contact.phones.first.number,
                          });
                        }
                        Map<String, dynamic> data = {"contacts": contactsList};
                        cvm.syncContactsApiModel(data, context);
                      },
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
          bottom: TabBar(
              controller: tabController,
              indicatorColor: const Color.fromARGB(255, 197, 155, 206),
              tabs: [
                Tab(
                    child: Text("Jolt-tacts",
                            style: GoogleFonts.inter(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ))
                        .animate()
                        .fadeIn(duration: 500.ms)
                        .scale(delay: 500.ms)
                        .move(delay: 300.ms, duration: 600.ms)),
                Tab(
                    child: Text("Contacts",
                            style: GoogleFonts.inter(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ))
                        .animate()
                        .fadeIn(duration: 500.ms)
                        .scale(delay: 500.ms)
                        .move(delay: 300.ms, duration: 600.ms)),
              ]),
        ),
        body: TabBarView(controller: tabController, children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background.png"),
                  fit: BoxFit.cover),
            ),
            child: ChangeNotifierProvider<ContactViewModel>.value(
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
                      return Text(value.jolttactslist.message.toString());
                    case Status.COMPLETED:
                      return Column(
                        children: [
                          Expanded(
                            child: AnimationLimiter(
                              child: ListView.builder(
                                  itemCount: value.jolttactslist.data!
                                      .success!.data!.length,
                                  itemBuilder: (context, index) {
                                    selectedContactId = value.jolttactslist
                                        .data!.success!.data![index].id;
                                    return AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 1200),
                                      child: SlideAnimation(
                                        verticalOffset: 50.0,
                                        child: FadeInAnimation(
                                          child: JolttactCard(
                                            name: value.jolttactslist.data!
                                                .success!.data![index].name,
                                            // imageurl:
                                            //     joltItem.imageurl.toString(),
                                            time: value
                                                .jolttactslist
                                                .data!
                                                .success!
                                                .data![index]
                                                .createdAt,
                                            //nojolt: joltItem.nojolt,
                                            selectednames: nameslist,
                                            contactid: value.jolttactslist
                                                .data!.success!.data![index].id,
                                            email: 'email',
                                            numberofjolt: 3,
                                            contactnumber: value.jolttactslist
                                                .data!.success!.data![index].phone.toString(),
                                            isconnected: value
                                                    .jolttactslist
                                                    .data!
                                                    .success!
                                                    .data![index].isConnected,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          if (Provider.of<MassJoltdata>(context).multiplejolt >
                              0)
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                  child: Mainbutton(
                                      buttontext: "Sent Mass Jolt",
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    CreateMassJoltScreen(
                                                      recievernames: nameslist,
                                                    )));
                                      }),
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            )
                        ],
                      );
                    default:
                  }
                  return Container();
                },
              ),
            ),
          ),
          Container(
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background.png"),
                    fit: BoxFit.cover),
              ),
              child: (contacts == null)
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : AnimationLimiter(
                      child: ListView.builder(
                          itemCount: contacts!.length,
                          itemBuilder: (context, index) {
                            Uint8List? photo = contacts![index].photo;
                            String numb = contacts![index].phones.first.number;
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 1000),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    child: Container(
                                      color: Colors.grey.withOpacity(0.2),
                                      child: ListTile(
                                          leading: (photo == null)
                                              ? const CircleAvatar(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 176, 154, 180),
                                                  radius: 30,
                                                  child: Icon(
                                                    Icons.person,
                                                    size: 40,
                                                  ),
                                                )
                                              : CircleAvatar(
                                                  backgroundImage:
                                                      MemoryImage(photo),
                                                  radius: 30,
                                                  backgroundColor: Colors.grey,
                                                ),
                                          title: Text(
                                            "${contacts![index].name.first} ${contacts![index].name.middle} ${contacts![index].name.last}",
                                            style: GoogleFonts.inter(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge,
                                            ),
                                          ),
                                          subtitle: Text(
                                            numb.toString(),
                                            style: GoogleFonts.inter(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ),
                                          trailing: InkWell(
                                            onTap: () {
                                              //invitesms(numb);
                                              Map<String, dynamic> data = {
                                                "contactId": selectedContactId,
                                              };
                                              cvm.sendInviteApiModel(
                                                  data, context);
                                            },
                                            child: Image(
                                              image: const AssetImage(
                                                  "assets/inviteuser.png"),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.025,
                                            ),
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )),
        ]),
      ),
    );
  }
}
