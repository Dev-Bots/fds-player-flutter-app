import 'dart:convert';
import 'dart:io';

import 'package:dev_player_fds/Bloc/EventBloc/event_bloc.dart';
import 'package:dev_player_fds/Bloc/bloc.dart';
import 'package:dev_player_fds/Data/repository/repository.dart';
import 'package:dev_player_fds/Presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dev_player_fds/Data/provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Data/repository/repository.dart';
import 'package:http/http.dart' as http;

import 'package:dev_player_fds/Data/models/Account/Account.dart';
import 'package:dev_player_fds/Presentation/widgets/profile/button_widget.dart';
import 'package:dev_player_fds/Presentation/widgets/profile/profile_widget.dart';
import 'package:dev_player_fds/Presentation/widgets/profile/textfield_widget.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class EventDetails extends StatelessWidget {
  EventDetails({Key? key, required this.eventId}) : super(key: key);

  final int eventId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 20,
        // leading: BackButton(),

        // actions: const [
        //   Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: NotificationButton(),
        //   )
        // ],
        title: CustomTitle('Football Drafting System'),
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => EventBloc()..add(GetEvent(eventId: eventId)),
          ),
          BlocProvider(
            create: (context) => AccountBloc()..add(GetMyLocalAccount()),
          ),
        ],
        child: SafeArea(child: BlocBuilder<AccountBloc, AccountState>(
          builder: (context, state) {
            if (state is AccountLocalLoaded) {
              final userID = state.user.accountID;

              return BlocConsumer<EventBloc, EventState>(
                  listener: (context, state) {
                if (state is AppliedForEvent) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('You have applied for this event.'),
                  ));
                }
              }, builder: (context, state) {
                if (state is EventLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is EventLoaded) {
                  bool hasApplied() {
                    final list = state.event.applicants;

                    if (list.contains(userID)) {
                      return true;
                    } else {
                      return false;
                    }
                  }

                  print(hasApplied());

                  return Column(
                    children: <Widget>[
                      // Container(
                      //     height: 100,
                      //     child: SizedBox(
                      //       height: 10,
                      //     )),

                      Expanded(
                        child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ListTile(
                                          leading: Icon(Icons.date_range),
                                          title: Text('Starting Date'),
                                          subtitle: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: Text(
                                                '//${state.event.startingDate}',
                                                style: TextStyle(fontSize: 20)),
                                          )),
                                      // Divider(),
                                      // ListTile(
                                      //     leading: Icon(Icons.description),
                                      //     title: Text('Description'),
                                      //     subtitle: Container(
                                      //         padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      //         child: Text(
                                      //             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                      //             style: TextStyle(fontSize: 15)))),
                                      Divider(),
                                      ListTile(
                                          leading: Icon(Icons.date_range),
                                          title: Text('Application Deadline'),
                                          subtitle: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: Text(
                                                '${state.event.applicationDeadline}',
                                                style: TextStyle(fontSize: 20)),
                                          )),
                                      Divider(),
                                      ListTile(
                                          leading: Icon(Icons.location_on),
                                          title: Text('Location'),
                                          subtitle: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: Text(
                                                '${state.event.location}',
                                                style: TextStyle(fontSize: 20)),
                                          )),

                                      Divider(),
                                      ListTile(
                                          leading: Icon(
                                              Icons.social_distance_rounded),
                                          title: Text('Required Position'),
                                          subtitle: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: Text(
                                                '${state.event.requiredPositions}',
                                                style: TextStyle(fontSize: 20)),
                                          )),

                                      Divider(),
                                      ListTile(
                                          leading: Icon(Icons
                                              .format_list_numbered_rtl_outlined),
                                          title: Text('Age Limit'),
                                          subtitle: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: Text(
                                                '${state.event.ageLimit}',
                                                style: TextStyle(fontSize: 20)),
                                          )),

                                      Divider(),
                                      ListTile(
                                          leading:
                                              Icon(Icons.cast_for_education),
                                          title: Text('Education Level'),
                                          subtitle: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: Text(
                                                '${state.event.educationLevel}',
                                                style: TextStyle(fontSize: 20)),
                                          )),

                                      Divider(),
                                      ListTile(
                                          leading: Icon(Icons.man),
                                          title: Text('Gender'),
                                          subtitle: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: Text('${state.event.gender}',
                                                style: TextStyle(fontSize: 20)),
                                          )),

                                      Divider(),
                                      ListTile(
                                          leading: Icon(Icons.description),
                                          title: Text('Description'),
                                          subtitle: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: Text(
                                                '${state.event.description}',
                                                style: TextStyle(fontSize: 20)),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ));
                            }),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width *
                            1, // <-- Your width
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // shape: StadiumBorder(),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(0),
                            ),
                            primary: Colors.black,
                            onPrimary: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 32, vertical: 12),
                          ),
                          child: Text('Apply'),
                          onPressed: () {
                            if (hasApplied()) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                          'You have already applied for this event.'),
                                    );
                                  });
                            } else {
                              BlocProvider.of<EventBloc>(context).add(
                                  ApplyForEvent(eventId: state.event.eventId));
                              Navigator.pushNamed(
                                context,
                                '/home',
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: Text('Failed to load details. Please try again.'),
                  );
                }
              });
            } else {
              return Center(
                child: Text('Failed to load details. Please try again!'),
              );
            }
          },
        )),
      ),
    );
  }
}  
            
          
        
      
    
  


             
              
                  // alignment: Alignment.bottomCenter,
                 
                  // child: StickyFooterScrollView(
                        
                  //       ListView(
                  //         shrinkWrap: true,
                  //         padding: EdgeInsets.symmetric(
                  //             horizontal:
                  //                 MediaQuery.of(context).size.width * 0.02),
                  //         physics: BouncingScrollPhysics(),
                  //         children: [
                  //           // Divider(),
                            
                  //         ],
                  //       ),
                      

                  //     footer:                     Positioned(
                  //     child: ButtonWidget(
                  //       text: 'Apply',
                  //       onClicked: () {
                  //         // UserPreferences.setUser(user);
                  //         Navigator.of(context).pop();
                  //       },
                  //     ),
                  //     bottom: 0,
                  //   ),
                  //   ),
                    

                  
                
              
//             );
//           },
//         ),
//       ),
//     );
//   }
// }


