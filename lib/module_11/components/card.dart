import 'package:flutter/material.dart';
import 'package:flutter_home_work/module_11/utils.dart';

class SpaseCard extends StatelessWidget {
  final int id;
  final String image;
  final String title;
  const SpaseCard(
      {Key? key, required this.id, required this.image, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SizedBox(
          height: 150,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Hero(
                      tag: id,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15),
                          ),
                          color: Colors.grey,
                          image: DecorationImage(
                            image: getAssetImage(image),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -20,
                      right: 20,
                      child: Hero(
                        tag: '$id-button',
                        child: Container(
                          color: Colors.redAccent,
                          padding: const EdgeInsets.all(10),
                          child: const Icon(Icons.play_arrow),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Hero(
                    tag: '$id-title',
                    child: ListTile(
                      title: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
