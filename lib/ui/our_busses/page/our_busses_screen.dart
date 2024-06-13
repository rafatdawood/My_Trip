import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogozat/ui/our_busses/manager/our_busses_cubit.dart';

class OurBussesScreen extends StatefulWidget {
  const OurBussesScreen({super.key});

  @override
  State<OurBussesScreen> createState() => _OurBussesScreenState();
}

class _OurBussesScreenState extends State<OurBussesScreen> {
  final cubit = OurBussesCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.getData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<OurBussesCubit, OurBussesState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  child: DefaultTabController(
        length: cubit.bussesMap['data'].length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Our Busses'),
            centerTitle: true,
            bottom: const TabBar(
              tabAlignment: TabAlignment.start,
              labelColor: Colors.blue,
              indicatorColor: Colors.blue,
              isScrollable: true,
              tabs: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('First prime'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Business prime'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('First class'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Business class'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Comfort class'),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            firstPrimePage(0),
            businessPrimePage(1),
            firstClassPage(2),
            businessClassPage(3),
            comfortClassPage(4)
          ]),
        ),
      ),
),
    );
  }

  Widget firstPrimePage(int num) {
    return ListView(
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: cubit.bussesMap['data'][num]['icons'].length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(12),
              width: 50,
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 30,
                      child: FaIcon(
                        cubit.bussesMap['data'][num]['icons'][index]['icon'],
                        color: Colors.blue[900],
                      )),
                  Expanded(
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            cubit.bussesMap['data'][num]['icons'][index]['title'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 13),
                          ))),
                ],
              ),
            );
          },
        ),
        Container(
          height: 250,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: CarouselSlider.builder(
              itemCount: cubit.bussesMap['data'][num]['images'].length,
              itemBuilder: (context, index, realIndex) {
                final image = cubit.bussesMap['data'][num]['images'][index];
                return buildImage(image, index);
              },
              options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 2)
              )),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }

  Widget businessPrimePage(int num) {
    return ListView(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cubit.bussesMap['data'][num]['icons'].length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(12),
              width: 50,
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 30,
                      child: FaIcon(
                        cubit.bussesMap['data'][num]['icons'][index]['icon'],
                        color: Colors.blue[900],
                      )),
                  Expanded(
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            cubit.bussesMap['data'][num]['icons'][index]['title'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 13),
                          ))),
                ],
              ),
            );
          },
        ),
        Container(
          height: 250,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: CarouselSlider.builder(
              itemCount: cubit.bussesMap['data'][num]['images'].length,
              itemBuilder: (context, index, realIndex) {
                final image = cubit.bussesMap['data'][num]['images'][index];
                return buildImage(image, index);
              },
              options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 2)
              )),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }

  Widget firstClassPage(int num) {
    return ListView(
      children: [
        GridView.builder(
          shrinkWrap: true,
          itemCount: cubit.bussesMap['data'][num]['icons'].length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(12),
              width: 50,
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 30,
                      child: FaIcon(
                        cubit.bussesMap['data'][num]['icons'][index]['icon'],
                        color: Colors.blue[900],
                      )),
                  Expanded(
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            cubit.bussesMap['data'][num]['icons'][index]['title'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 13),
                          ))),
                ],
              ),
            );
          },
        ),
        Container(
          height: 250,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: CarouselSlider.builder(
              itemCount: cubit.bussesMap['data'][num]['images'].length,
              itemBuilder: (context, index, realIndex) {
                final image = cubit.bussesMap['data'][num]['images'][index];
                return buildImage(image, index);
              },
              options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 2)
              )),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }

  Widget businessClassPage(int num) {
    return ListView(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cubit.bussesMap['data'][num]['icons'].length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(12),
              width: 50,
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 30,
                      child: FaIcon(
                        cubit.bussesMap['data'][num]['icons'][index]['icon'],
                        color: Colors.blue[900],
                      )),
                  Expanded(
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            cubit.bussesMap['data'][num]['icons'][index]['title'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 13),
                          ))),
                ],
              ),
            );
          },
        ),
        Container(
          height: 250,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: CarouselSlider.builder(
              itemCount: cubit.bussesMap['data'][num]['images'].length,
              itemBuilder: (context, index, realIndex) {
                final image = cubit.bussesMap['data'][num]['images'][index];
                return buildImage(image, index);
              },
              options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 2)
              )),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }

  Widget comfortClassPage(int num) {
    return ListView(
      children: [
        GridView.builder(
          itemCount: cubit.bussesMap['data'][num]['icons'].length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(12),
              width: 50,
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 30,
                      child: FaIcon(
                        cubit.bussesMap['data'][num]['icons'][index]['icon'],
                        color: Colors.blue[900],
                      )),
                  Expanded(
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            cubit.bussesMap['data'][num]['icons'][index]['title'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 13),
                          ))),
                ],
              ),
            );
          },
        ),
        Container(
          height: 250,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: CarouselSlider.builder(
              itemCount: cubit.bussesMap['data'][num]['images'].length,
              itemBuilder: (context, index, realIndex) {
                final image = cubit.bussesMap['data'][num]['images'][index];
                return buildImage(image, index);
              },
              options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 2)
              )),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }

  Widget buildImage(image, int index) => Image.asset(image, fit: BoxFit.fill);
}
