import 'package:flutter/material.dart';
import 'package:flutter_home_work/exercise_1.dart';

class ExerciseThree extends StatefulWidget {
  const ExerciseThree({Key? key}) : super(key: key);

  @override
  State<ExerciseThree> createState() => _ExerciseThreeState();
}

List<Widget> _data = List<Widget>.generate(
  200,
  (i) => Card(
    color: const Color.fromARGB(255, 227, 14, 14).withOpacity(i / 1000),
    child: ListTile(
      title: Text('Item $i'),
    ),
  ),
);

final List<Map> myProducts =
    List.generate(100000, (index) => {"id": index, "name": "Product $index"})
        .toList();

class _ExerciseThreeState extends State<ExerciseThree>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // GridView.builder(
          //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //         maxCrossAxisExtent: 200,
          //         childAspectRatio: 3 / 2,
          //         crossAxisSpacing: 20,
          //         mainAxisSpacing: 20),
          //     itemCount: myProducts.length,
          //     itemBuilder: (BuildContext ctx, index) {
          //       return Container(
          //         alignment: Alignment.center,
          //         decoration: BoxDecoration(
          //             color: Colors.amber,
          //             borderRadius: BorderRadius.circular(15)),
          //         child: Text(myProducts[index]["name"]),
          //       );
          //     }),
          SafeArea(
        child: LayoutBuilder(
          builder: ((BuildContext context, BoxConstraints constraints) {
            double width = constraints.constrainWidth();
            return width > 600
                ? ListView.builder(
                    itemCount: 200,
                    itemBuilder: (context, index) {
                      return Card(
                        color: const Color.fromARGB(255, 227, 14, 14)
                            .withOpacity(index / 199),
                        child: ListTile(
                          title: Text('Item $index'),
                        ),
                      );
                    },
                  )
                : SizedBox(
                  height: 200,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 200,
                      itemBuilder: (context, index) {
                        return Card(
                          color: const Color.fromARGB(255, 227, 14, 14)
                              .withOpacity(index / 199),
                          child: ListTile(
                            title: Text('Item $index'),
                          ),
                        );
                      },
                    ),
                );
          }),
        ),
      ),
    );
  }
}
