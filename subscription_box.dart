import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/subscription/payment_method.dart';

class SubscriptionBox extends StatelessWidget {
  final String packagename;
  final String description;
  final String price;
  final String timeperiod;
  final Color color;
  const SubscriptionBox({
    required this.packagename,
    required this.description,
    required this.price,
    required this.timeperiod,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.white,
                  width: 3.0,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(topLeft :Radius.circular(15),topRight: Radius.circular(15) ),
                      color: color,
                    ),
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,height: MediaQuery.of(context).size.height * 0.040,
                    child: Text(packagename,style:  GoogleFonts.inter(textStyle: Theme.of(context).textTheme.labelLarge,),),),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text(description,textAlign: TextAlign.center,
                          style:  GoogleFonts.inter(textStyle: Theme.of(context).textTheme.bodySmall,)
                          
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.035,),
                      
                       InkWell(
                        onTap: (){
       Navigator.push(
            context, MaterialPageRoute(builder: (_) => const PaymentMetodScreen()));
    },
                         child: Row(
                                           crossAxisAlignment: CrossAxisAlignment.baseline,
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           textBaseline: TextBaseline.alphabetic,
                                           children: [
                                             Text(
                                               price,textAlign: TextAlign.center,
                         style:  GoogleFonts.inter(textStyle: Theme.of(context).textTheme.labelLarge,)
                                             ),
                                             const SizedBox(
                                               width: 10,
                                             ),
                                             Text(
                                               timeperiod,
                            style:  GoogleFonts.inter(textStyle: Theme.of(context).textTheme.bodySmall,)
                                             ),
                                           ],
                                         ),
                       ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

