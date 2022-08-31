import 'package:flutter/material.dart';
import 'package:flutter_home_work/module_11/utils.dart';

class SpaseCard extends StatelessWidget {
  final Map<String, dynamic> space;
  const SpaseCard({Key? key, required this.space}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed('/details', arguments: {'space': space});
        },
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
                      tag: space['id'],
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15),
                          ),
                          color: Colors.grey,
                          image: DecorationImage(
                            image: getAssetImage(space['image']),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -20,
                      right: 20,
                      child: Hero(
                        tag: '${space['id']}-button',
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
                  child: ListTile(
                    title: Hero(
                      tag: '${space['id']}-title',
                      child: Material(
                        child: Text(
                          space['title'],
                          overflow: TextOverflow.ellipsis,
                        ),
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
  }
}
