
import 'individual_graph.dart';

class barData{
  final sunAmount;
  final monAmount;
  final tueAmount;
  final wedAmount;
  final thuAmount;
  final friAmount;
  final satAmount;


  barData({
    required this.sunAmount,
    required this.tueAmount,
    required this.monAmount,
    required this.wedAmount,
    required this.thuAmount,
    required this.friAmount,
    required this.satAmount,
  });

  List<IndividualBar> bar_Data= [];


  void intializeBarData () {
    bar_Data = [

    //sun
      IndividualBar(x:0, y:sunAmount),
      //mon
      IndividualBar(x:0, y:monAmount),
      //tue
      IndividualBar(x:0, y:tueAmount),
      //wednesday
      IndividualBar(x:0, y:wedAmount),
      //thu
      IndividualBar(x:0, y:thuAmount),
      //fri
      IndividualBar(x:0, y:friAmount),
      //sat
      IndividualBar(x:0, y:satAmount),



    ];

  }

}