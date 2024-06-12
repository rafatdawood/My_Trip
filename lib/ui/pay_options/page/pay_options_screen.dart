import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hogozat/ui/main/page/main.dart';
import 'package:hogozat/ui/pay_options/manager/pay_options_cubit.dart';

class PayOptionsScreen extends StatefulWidget {
  const PayOptionsScreen({
    super.key,
    required this.totalPrice,
    required this.tripsData,
  });

  final int totalPrice;
  final List tripsData;

  @override
  State<PayOptionsScreen> createState() => _PayOptionsScreenState();
}

class _PayOptionsScreenState extends State<PayOptionsScreen> {
  final cubit = PayOptionsCubit();

  @override
  void initState() {
    super.initState();
    cubit.getData(widget.tripsData, widget.totalPrice,);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(title: Text('Select Payment Method'), centerTitle: true),
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                        color: const Color(0xfff0f3ff),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blue)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Number of trips',
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              '${cubit.tripsData.length}',
                              style: TextStyle(
                                  color: Colors.blue[600],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Number of seats',
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              '${cubit.seats()}',
                              style: TextStyle(
                                  color: Colors.blue[600],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                        Divider(color: Colors.blue),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total price',
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              '${cubit.totalPrice} EGP',
                              style: TextStyle(
                                  color: Colors.blue[600],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: const Color(0xfff0f3ff),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    alignment: Alignment.center,
                    height: 100,
                    width: double.infinity,
                    child: RadioListTile(
                      value: 1,
                      groupValue: cubit.value,
                      enableFeedback: false,
                      secondary: Icon(
                        Icons.credit_card,
                        color: Colors.blue[900],
                      ),
                      onChanged: (value) {
                        setState(() {
                          cubit.value = value!;
                        });
                      },
                      title: Text('Credit Card',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: const Color(0xfff0f3ff),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    alignment: Alignment.center,
                    height: 200,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RadioListTile(
                          value: 2,
                          groupValue: cubit.value,
                          enableFeedback: false,
                          secondary: Icon(
                            Icons.wallet,
                            color: Colors.blue[900],
                          ),
                          onChanged: (value) {
                            setState(() {
                              value = value!;
                            });
                          },
                          title: Text('Smart Wallet',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: '01234567890',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: const Color(0xfff0f3ff),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    alignment: Alignment.center,
                    height: 150,
                    width: double.infinity,
                    child: RadioListTile(
                      value: 3,
                      groupValue: cubit.value,
                      enableFeedback: false,
                      subtitle: Text(
                          'Reservation will be revoked if payment is not completed within 3 hours',
                          style: TextStyle(
                              color: Color(0xffb4b4b8),
                              fontWeight: FontWeight.bold)),
                      secondary: Icon(
                        Icons.location_on_outlined,
                        color: Colors.blue[900],
                      ),
                      onChanged: (value) {
                        setState(() {
                          cubit.value = value!;
                        });
                      },
                      title: Text('From our Stations',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: const Color(0xfff0f3ff),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    alignment: Alignment.center,
                    height: 150,
                    width: double.infinity,
                    child: RadioListTile(
                      value: 4,
                      groupValue: cubit.value,
                      enableFeedback: false,
                      subtitle: Text(
                          'Reservation will be revoked if payment is not completed within 3 hours',
                          style: TextStyle(
                              color: Color(0xffb4b4b8),
                              fontWeight: FontWeight.bold)),
                      secondary: Container(
                          width: 60,
                          height: 60,
                          child: Image(image: AssetImage('assets/fawry.png'))),
                      onChanged: (value) {
                        setState(() {
                          cubit.value = value!;
                        });
                      },
                      title: Text('Fawry',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: const Color(0xfff0f3ff),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    alignment: Alignment.center,
                    height: 150,
                    width: double.infinity,
                    child: RadioListTile(
                      value: 5,
                      groupValue: cubit.value,
                      enableFeedback: false,
                      subtitle: Text(
                          'Reservation will be revoked if payment is not completed within 3 hours',
                          style: TextStyle(
                              color: Color(0xffb4b4b8),
                              fontWeight: FontWeight.bold)),
                      secondary: Container(
                          width: 60,
                          height: 60,
                          child: Image(image: AssetImage('assets/aman.png'))),
                      onChanged: (value) {
                        setState(() {
                          cubit.value = value!;
                        });
                      },
                      title: Text('Aman',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: BlocListener<PayOptionsCubit, PayOptionsState>(
                      listener: (context, state) => finishPayMethod(state),
                      child: ElevatedButton(
                          onPressed: () => cubit.selectPayMethod(),
                          child: Text(
                            'Done',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          style: ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(vertical: 15)),
                              backgroundColor:
                              MaterialStatePropertyAll(Colors.blue))),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  finishPayMethod(PayOptionsState state) {
    if (state is PaymentMethodFailureState) {
      Fluttertoast.showToast(msg: state.massage);
    } else if (state is PaymentMethodSuccessState) {
      Fluttertoast.showToast(msg: state.massage);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen(),));
    }
  }
}
