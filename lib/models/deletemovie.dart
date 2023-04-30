import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DeleteMovie extends StatelessWidget {




  Map ? movieItem;
  late DocumentReference _reference;
  DeleteMovie({this.movieItem}){
    _reference = FirebaseFirestore.instance
        .collection('movies').doc('user.uid');


  }


  @override
  Widget build(BuildContext context) {
    return
      IconButton(
        splashColor : Colors.lightBlueAccent,

        color: Colors.red,
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            // title:  Text(movieItem!['title']),
            content: const Text('are you sure to delete the movie'),
            actions: <Widget>[
              TextButton(
                child: const Text('Approve'),
                onPressed: () {
                  _reference.delete();
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        icon:FaIcon(Icons.delete),
      );
  }
}



// class DialogExample extends StatelessWidget {
//   const DialogExample({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: () => showDialog<String>(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//           title: const Text('AlertDialog Title'),
//           content: const Text('AlertDialog description'),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Approve'),
//               onPressed: () {
//                 _reference.delete();
//               },
//             ),
//             TextButton(
//               child: const Text('Cancel'),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//       child: const Text('Show Dialog'),
//     );
//   }
// }

