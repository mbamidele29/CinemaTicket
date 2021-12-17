import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieGallery extends StatelessWidget {
  final List<String> gallery;
  const MovieGallery(this.gallery, { Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return gallery.length>0 ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            'Gallery',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 24,
              letterSpacing: 1.5
            ),
          ),
        ),
        SizedBox(height: 4,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: gallery.map((item) => _galleryItem(context, item)).toList()
          ),
        ),
      ],
    ) : SizedBox.shrink();
  }

  Widget _galleryItem(BuildContext context, String image){
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: MediaQuery.of(context).size.width-60,
        height: 200,
        margin: EdgeInsets.only(right: 2, left: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: CachedNetworkImageProvider(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}