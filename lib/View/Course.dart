import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Model/TopCourse.dart';
import '../Services.dart';

class Course extends StatefulWidget {
  const Course({Key? key}) : super(key: key);

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    double a = size.height * 0.2;
    double b = size.width / 2 - 20;
    return Scaffold(body: Padding(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: size.height * 0.06,
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                      child: Text(
                        'Top Courses',
                        style:GoogleFonts.abel(color: Colors.black,fontSize: 30),
                      ),
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'All Courses>',
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                )),
          ),
          Container(
            width: size.width,
            height: size.height * 0.25,
            child: FutureBuilder(
              future: Api.topCourse(),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : ListView.builder(
                  itemCount: Api.topCourses!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    TopCourses c = Api.topCourses![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          height: a = size.height * 0.2,
                          width: b = size.width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(5)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 2,
                                    blurStyle: BlurStyle.outer,
                                    blurRadius: 10)
                              ]),
                          child: Column(
                            children: [
                              Container(
                                width: b,
                                height: a / 2,
                                child: Image(
                                    image: NetworkImage(c.thumbnail),
                                    fit: BoxFit.fill),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: b,
                                    color: Colors.white,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            top: 0,
                                            left: 5,
                                            right: 30,
                                            child: Text(c.title)),
                                        Positioned(
                                            bottom: 2,
                                            right: 2,
                                            child: Text(
                                              '(${c.price})',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10),
                                            ))
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: size.height * 0.06,
              width: size.width,
              child: Text(
                'Categories',
                style: GoogleFonts.abel(color: Colors.black,fontSize: 30),
              ),
            ),
          ),
          Expanded(
              child: FutureBuilder(
                  future: Api.categorie(),
                  builder: (context, snapshot) =>
                  snapshot.connectionState ==
                      ConnectionState.waiting
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : SingleChildScrollView(
                    child: Wrap(
                      children: Api.categories!
                          .map((e) =>
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: b,
                              height: a,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5,
                                        blurStyle: BlurStyle.normal,
                                        spreadRadius: 2)
                                  ]),
                              child: Column(children: [
                                Container(
                                  height: a / 1.6,
                                  width: b,
                                  child: e.thumbnail == null
                                      ? Center(
                                    child:
                                    CircularProgressIndicator(),
                                  )
                                      : Image(
                                      image: NetworkImage(
                                          e.thumbnail),
                                      fit: BoxFit.fill),
                                ),
                                Expanded(
                                    child: Container(
                                      width: b,
                                      color: Api.clr(),
                                      child: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e.name,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight:
                                                  FontWeight.w900,
                                                  color: Colors.white),
                                            ),
                                            Spacer(),
                                            Text(
                                              '${e.numberOfCourses} Courses',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                  FontWeight.w200,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                    ))
                              ]),
                            ),
                          ))
                          .toList(),
                    ),
                  )))
        ],
      ),
    ),);
  }
}
