import 'package:chatgpt_movierater_app/models/deletemovie.dart';
import 'package:chatgpt_movierater_app/screens/MovieItemScreen.dart';
import 'package:chatgpt_movierater_app/updatescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'movie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

late String loggedInUser;

// class MoviesList extends StatelessWidget {
//
//   final _firestore  = FirebaseFirestore.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<MovieData>(
//       builder: (context, movieData, child) {
//         return ListView.builder(
//           itemBuilder: (context, index) {
//             final movie = _firestore.collection('movies')[index];
//             return MovieTile(
//                 movietitle: movie.title,
//                 // moviedescription: movie.description,
//                 movierating: movie.rating,
//                 movieyear: movie.year,
//                 // checkboxCallback: (bool checkboxState) {
//                 //   // MovieData.updateTask((movie));
//                 // },
//                 // longCallBack: () {
//                 //   movieData.deleteMovie(movie);
//                 // }
//                 );
//           },
//           itemCount: movieData.movieCount,
//         );
//       },
//     );
//   }
// }
//
// class MovieTile extends StatelessWidget {
//   final String movietitle;
//   // final String moviedescription;
//   final double movierating;
//   final int  movieyear;
//   // final Function checkboxCallback;
//   // final VoidCallback longCallBack;
//
//   MovieTile(
//       {
//         // required this.moviedescription,
//         required this.movierating,
//         required this.movietitle,
//         required this.movieyear,
//         // required this.checkboxCallback,
//         // required this.longCallBack
//       });
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       // padding: EdgeInsets.only(top:20),
//       children:<Widget>[
//         Column(
//
//         // crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(top: 20),
//               // height: 850,
//               // width: 100,
//               child: MoviesListData()
//           ),
//
//           Text(movietitle,
//           style: TextStyle(
//             fontSize: 20,
//           ),
//           ),
//           Text('$movierating',
//             style: TextStyle(
//               fontSize: 20,
//             ),),
//           Text('$movieyear',
//             style: TextStyle(
//               fontSize: 20,
//               color: Colors.orange,
//
//             ),),
//         ],
//       ),
//     ]
//     );
//   }
// }

class MovieScreenList extends StatefulWidget {
  static String id = '/movielist';

  MovieScreenList({Key? key}) : super(key: key);

  @override
  State<MovieScreenList> createState() => _MovieScreenListState();
}

class _MovieScreenListState extends State<MovieScreenList> {
  final _auth = FirebaseFirestore.instance;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    try {
      final userr = _auth.collection('movies').id;
      loggedInUser = userr as String;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              'Movie List',
              style: TextStyle(fontSize: 30, color: Colors.red),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
          ),
          // Expanded(
          //   child:
          Expanded(
            child: Container(
              // height: 540,
              // width: 200,
              // padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: MoviesListData(),
            ),
          ),
          // ),
        ],
      ),
    );
  }
}

class MoviesListData extends StatefulWidget {
  @override
  _MoviesListDataState createState() => _MoviesListDataState();
}

class _MoviesListDataState extends State<MoviesListData> {
  final Stream<QuerySnapshot> _moviesStream =
      FirebaseFirestore.instance.collection('movies').snapshots();
  // var uid = ( FirebaseAuth.instance.currentUser!).uid;
  // Firestore.instance.collection('movies').where('uid', isEqualTo: uid).snapshots()
  // var collections = FirebaseFirestore.instance.collection('movies').where('title', isEqualTo: '');.where('user', isEqualTo:loggedInUser )

  // counterr () async{
  //   var allDocs = await collections.get();
  //   var DocId = allDocs.docs.first.id;
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _moviesStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        // QuerySnapshot<Object?>? querySnapshot = snapshot.data;
        // List<QueryDocumentSnapshot> documents = querySnapshot!.docs;
        // if (snapshot.hasData){
        final snap = snapshot.data!.docs;

        return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            primary: false,
            itemCount: snap.length,

            itemBuilder: (context, index) {
              final snapss = snap[index];
              var docId = snapss.id;

              return Container(
                child: ListTile(


                  // leading: Text(data['title']),
                    subtitle: Text('rating  '  + snap[index]['rating'].toString(),style: TextStyle(color: Colors.lightBlueAccent,fontSize: 18), ),
                    title: Container(
                      height: 50,

                      // alignment: AlignmentDirectional.centerStart,
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child:
                      // Text(data['title'] + ' ' + data['rating'].toString() + ' rating',style: TextStyle(color: Colors.lightBlueAccent,fontSize: 24),),

                      Material(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(30.0),
                        child: TextButton(
                          // backgroundColor: Colors.white,
                          // heroTag: null,
                          // label:
                          child : Text(snap[index]['title'] ,style: TextStyle(color: Colors.white,fontSize: 20),),
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => UpdateMovie(movieItem: snapss,docId:docId),
                            ));

                          },
                          // icon: FaIcon(
                          //   FontAwesomeIcons.star,
                          //   color: Colors.lightBlueAccent,
                          // ),
                        ),
                      ),
                    ),

                    // subtitle:
                    // subtitle: Text(data['rating'].toString()),
                    trailing: DeleteMovie(movieItem: snapss,docId:docId)

                )
              );


            });
        // }
        return Card(

          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {

              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return ListTile(


                // leading: Text(data['title']),
                subtitle: Text('rating  '  + data['rating'].toString(),style: TextStyle(color: Colors.lightBlueAccent,fontSize: 18), ),
                title: Container(
                  height: 50,

                  // alignment: AlignmentDirectional.centerStart,
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child:
                  // Text(data['title'] + ' ' + data['rating'].toString() + ' rating',style: TextStyle(color: Colors.lightBlueAccent,fontSize: 24),),

                Material(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(30.0),
                  child: TextButton(
                    // backgroundColor: Colors.white,
                    // heroTag: null,
                    // label:
                    child : Text(data['title'] ,style: TextStyle(color: Colors.white,fontSize: 20),),
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => UpdateMovie(movieItem: data,)));

                    },
                    // icon: FaIcon(
                    //   FontAwesomeIcons.star,
                    //   color: Colors.lightBlueAccent,
                    // ),
                  ),
                ),
                ),

                  // subtitle:
                // subtitle: Text(data['rating'].toString()),
                trailing: DeleteMovie()

              );
            }).toList(),
          ),
        );
      },
    );
  }
}
