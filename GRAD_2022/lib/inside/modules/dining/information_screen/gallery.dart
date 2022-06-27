import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared/variables.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('GALLERY'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
     body: Center(
       child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Image(
              image: NetworkImage(
                diningimage.toString(),
              ),
            ),
          ],
        ),
     ),
    );
  }
}
