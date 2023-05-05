import 'package:chatgpt_movierater_app/models/deletemovie.dart';
import 'package:chatgpt_movierater_app/screens/updatescreen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

late User loggedInUser;


class MovieScreenList extends StatefulWidget {
  static String id = '/movielist';

  MovieScreenList({Key? key}) : super(key: key);

  @override
  State<MovieScreenList> createState() => _MovieScreenListState();
}

class _MovieScreenListState extends State<MovieScreenList> {
  final _auth = FirebaseAuth.instance;

  get databaseReference => null;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    try {
      final userr = await _auth.currentUser!;
      loggedInUser = userr;
    } catch (e) {
      print(e);
    }
  }
  Future<User> getData() async {
    final user =  await databaseReference
        .collection("users")
        .doc(loggedInUser.uid);

    return user;
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
              style: TextStyle(fontSize: 30, color: Colors.orange),
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


              // Future<List<DocumentSnapshot>> getPostsToday() async {
              // final usersnap = FirebaseFirestore.instance.collection('movies');
              // final QuerySnapshot = await Future.wait([
              //   usersnap.where('user' , isEqualTo : loggedInUser.email.toString()).get(),
              //
              // ]);
              // return  <DocumentSnapshot>[
              //   QuerySnapshot[0].documents,
              //   ]
              // }

              var docId = snapss.id;



              return ListTile(
                // leading: Text(data['title']),

                  subtitle: Text('average rating is ' + snap[index]['rating'].toString(),style: TextStyle(color: Colors.lightBlueAccent,fontSize: 18), ),
                  title: Container(
                    height:50,
                    // alignment: AlignmentDirectional.centerStart,
                    padding: EdgeInsets.only(top: 10),
                    child:
                    // Text(data['title'] + ' ' + data['rating'].toString() + ' rating',style: TextStyle(color: Colors.lightBlueAccent,fontSize: 24),),

                    Material(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(10.0),
                      child: TextButton(
                        child : Text(snap[index]['title'] ,style: TextStyle(color: Colors.white,fontSize: 20),),
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => UpdateMovie(movieItem: snapss,docId:docId),
                          ));
                        },
                      ),
                    ),
                  ),
                  trailing: DeleteMovie(movieItem: snapss,docId:docId)
              );
            });
      },
    );
  }
}
