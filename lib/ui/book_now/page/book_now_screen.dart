import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hogozat/ui/book_now/manager/book_now_cubit.dart';
import 'package:hogozat/ui/departure_available_trips/page/departure_available_trips_screen.dart';

class BookNowScreen extends StatefulWidget {
  const BookNowScreen({super.key});

  @override
  State<BookNowScreen> createState() => _BookNowScreenState();
}

class _BookNowScreenState extends State<BookNowScreen> {
  final cubit = BookNowCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => cubit,
        child: BlocListener<BookNowCubit, BookNowState>(
          listener: (context, state) => logic(state),
          child: Scaffold(
            body: ListView(
              children: [
                BlocBuilder<BookNowCubit, BookNowState>(
                  builder: (context, state) {
                    return AnimationLimiter(
                      child: Column(
                        children: AnimationConfiguration.toStaggeredList(
                          duration: const Duration(milliseconds: 375),
                          childAnimationBuilder: (widget) => SlideAnimation(
                            horizontalOffset: 50.0,
                            child: FadeInAnimation(
                              child: widget,
                            ),
                          ),
                          children: [
                            Container(
                              height: 250,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/cover.jpg'),fit: BoxFit.fill)),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () => chooseFrom(),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 20),
                                      decoration: BoxDecoration(
                                        color: const Color(0xfff0f3ff),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("From",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                cubit.fromController == ''
                                                    ? "Choose trip start location"
                                                    : cubit.fromController,
                                                style: cubit.fromController ==
                                                        ''
                                                    ? TextStyle(
                                                        color:
                                                            Color(0xffb4b4b8))
                                                    : TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 17),
                                              ),
                                              Icon(
                                                  Icons
                                                      .keyboard_arrow_down_sharp,
                                                  color: Color(0xffb4b4b8)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  InkWell(
                                    onTap: () => chooseTo(),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 20),
                                      decoration: BoxDecoration(
                                        color: const Color(0xfff0f3ff),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("To",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                cubit.toController == ''
                                                    ? "Choose trip start location"
                                                    : cubit.toController,
                                                style: cubit.toController == ''
                                                    ? TextStyle(
                                                        color:
                                                            Color(0xffb4b4b8))
                                                    : TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 17),
                                              ),
                                              Icon(
                                                  Icons
                                                      .keyboard_arrow_down_sharp,
                                                  color: Color(0xffb4b4b8)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  InkWell(
                                    onTap: () => selectGoDate(),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 20),
                                      decoration: BoxDecoration(
                                        color: const Color(0xfff0f3ff),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Departure Date",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                cubit.goDateController == ''
                                                    ? 'Choose departure date'
                                                    : cubit.goDateController,
                                                style: cubit.goDateController ==
                                                        ''
                                                    ? TextStyle(
                                                        color:
                                                            Color(0xffb4b4b8))
                                                    : TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 17),
                                              ),
                                              Icon(Icons.date_range_outlined,
                                                  color: Color(0xffb4b4b8)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  addReturnFiled(),
                                  InkWell(
                                    overlayColor: MaterialStatePropertyAll(
                                        Colors.transparent),
                                    onTap: () => cubit.addReturnField(),
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20),
                                      child: Text(
                                        cubit.addReturnDate
                                            ? "Clear return date -"
                                            : "Choose return date +",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () =>
                                            cubit.navToSearchScreen(
                                                from: cubit.fromController,
                                                to: cubit.toController,
                                                goDate: cubit.goDateController,
                                                returnDate:
                                                    cubit.returnDateController),
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.blue)),
                                        child: const Text("Search",
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ))
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            const Text(
                              "Book a Private Bus",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              height: 250,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/private.jpg'),fit: BoxFit.fill)),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                      'If you have a group of friends, colleagues or traveling with your family, group booking can be made easier and more economical than buying an individual ticket. If your group members are 10 or more passengers.'                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.blue)),
                                      child: const Text("Book a Private Bus",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Future chooseFrom() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          height: 750,
          child: ListView.builder(
            itemCount: cubit.cities['data'].length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () => cubit.changeState(index),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 2000),
                      decoration: BoxDecoration(
                          color: const Color(0xfff0f3ff),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                cubit.cities['data'][index]['governorate'],
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const Icon(Icons.keyboard_arrow_down_sharp,
                                  color: Color(0xffb4b4b8)),
                            ],
                          ),
                          selectCitiesFrom(index),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Future chooseTo() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          height: 750,
          child: ListView.builder(
            itemCount: cubit.cities['data'].length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      cubit.test = !cubit.test;
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 2000),
                      decoration: BoxDecoration(
                          color: const Color(0xfff0f3ff),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                cubit.cities['data'][index]['governorate'],
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const Icon(Icons.keyboard_arrow_down_sharp,
                                  color: Color(0xffb4b4b8)),
                            ],
                          ),
                          selectCitiesTo(index),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        );
      },
    );
  }

  selectGoDate() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          padding: EdgeInsets.symmetric(vertical: 20),
          height: 400,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: CupertinoDatePicker(
                  initialDateTime: cubit.goDateTime,
                  onDateTimeChanged: (value) {
                    cubit.goDateTime = value;
                  },
                  mode: CupertinoDatePickerMode.date,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => setGoDate(),
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                  child:
                      const Text("Set", style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  selectReturnDate() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          padding: EdgeInsets.symmetric(vertical: 20),
          height: 400,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: CupertinoDatePicker(
                  initialDateTime: cubit.goDateTime,
                  onDateTimeChanged: (value) {
                    cubit.returnDateTime = value;
                  },
                  mode: CupertinoDatePickerMode.date,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => setReturnDate(),
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                  child:
                      const Text("Set", style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  setGoDate() {
    cubit.setGoDate();
    Navigator.pop(context);
  }

  setReturnDate() {
    cubit.setReturnDate();
    Navigator.pop(context);
  }

  Widget addReturnFiled() {
    if (cubit.addReturnDate) {
      return InkWell(
        onTap: () => selectReturnDate(),
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: const Color(0xfff0f3ff),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Return Date",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cubit.returnDateController == ''
                        ? 'Choose departure date'
                        : cubit.returnDateController,
                    style: cubit.returnDateController == ''
                        ? TextStyle(color: Color(0xffb4b4b8))
                        : TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                  ),
                  Icon(Icons.date_range_outlined, color: Color(0xffb4b4b8)),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget selectCitiesTo(int x) {
    if (cubit.test) {
      return Container(
        height: 200,
        child: ListView.builder(
          itemCount: cubit.cities['data'][x]['station'].length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => selectTo(x, index),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(cubit.cities['data'][x]['station'][index]),
              ),
            );
          },
        ),
      );
    } else {
      return SizedBox();
    }
  }

  Widget selectCitiesFrom(int x) {
    if (cubit.test) {
      return Container(
        height: 200,
        child: ListView.builder(
          itemCount: cubit.cities['data'][x]['station'].length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => selectFrom(x, index),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(cubit.cities['data'][x]['station'][index]),
              ),
            );
          },
        ),
      );
    } else {
      return SizedBox();
    }
  }

  selectTo(int x, int index) {
    cubit.selectTo(x, index);
    Navigator.pop(context);
  }

  selectFrom(int x, int index) {
    cubit.selectFrom(x, index);
    Navigator.pop(context);
  }

  logic(state) {
    if (state is BookNowFailureState) {
      Fluttertoast.showToast(msg: state.errorMessage);
    } else if (state is BookNowSuccessState) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DepartureAvailableTripsScreen(
            from: cubit.fromController,
            to: cubit.toController,
            goDate: cubit.goDateController,
            returnDate: cubit.returnDateController,
          ),
        ),
      );
    }
  }
}
