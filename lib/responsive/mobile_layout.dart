import 'package:btm/responsive/wallet_info.dart';
import 'package:btm/utils/colors.dart';
import 'package:btm/utils/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glass_kit/glass_kit.dart';

import '../blockchain_utils/eth_utils.dart';
import '../constants.dart';

class MobileScreenLayout extends ConsumerWidget {
  MobileScreenLayout({Key? key}) : super(key: key);
  final TextEditingController _depositController = TextEditingController();
  final TextEditingController _withdrawController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.abc),
      ),
      backgroundColor: mobileBackgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Flexible(
              //   child: Container(),
              //   flex: 6,
              // ),
              SizedBox(
                height: 20,
              ),
              if (!isKeyBoard)
                WalletInfo(
                  // child: GlassContainer(
                  //   height: 200,
                  //   width: double.infinity,
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(vertical: 30),
                  //     child: Row(
                  //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           //Logo and tag
                  //           children: [
                  //             Padding(
                  //               padding: const EdgeInsets.all(10.0),
                  //               child: ClipRRect(
                  //                 borderRadius: BorderRadius.circular(6),
                  //                 child: Image.asset(
                  //                   'assets/images/blocktm.png',
                  //                   height: 56,
                  //                 ),
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(10.0),
                  //               child: Text(
                  //                 "Blocktm",
                  //                 style: TextStyle(
                  //                     fontSize: 18,
                  //                     fontWeight: FontWeight.bold,
                  //                     letterSpacing: 2),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         SizedBox(
                  //           width: 50,
                  //         ),
                  //         Column(
                  //           children: [
                  //             Row(
                  //               crossAxisAlignment: CrossAxisAlignment.end,
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Padding(
                  //                   padding: const EdgeInsets.all(10.0),
                  //                   child: Text("Balance: 3",
                  //                       style: TextStyle(
                  //                           fontSize: 18,
                  //                           fontWeight: FontWeight.bold,
                  //                           letterSpacing: 2)),
                  //                 ),
                  //               ],
                  //             ),
                  //             Row(
                  //               crossAxisAlignment: CrossAxisAlignment.end,
                  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //               children: [
                  //                 Padding(
                  //                   padding: const EdgeInsets.all(10.0),
                  //                   child: Text("ROI: 100",
                  //                       style: TextStyle(
                  //                           fontSize: 18,
                  //                           fontWeight: FontWeight.bold,
                  //                           letterSpacing: 2)),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  //   blur: 20,
                  //   borderWidth: 1,
                  //   borderColor: Color.fromARGB(255, 61, 59, 59),
                  //   borderRadius: BorderRadius.circular(6),
                  //   borderGradient: LinearGradient(
                  //     colors: [
                  //       Color(0xff97d2ed).withOpacity(0.6),
                  //       Color(0xfd8cede).withOpacity(0.6)
                  //     ],
                  //   ),
                  //   elevation: 2,
                  //   gradient: LinearGradient(
                  //     colors: [
                  //       Color(0xff97d2ed).withOpacity(0.6),
                  //       Color(0xfd8cede).withOpacity(0.6)
                  //     ],
                  //   ),
                  // ),
                ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Text(
                    'Activity',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.add),
                      Text('Last Deposit: '),
                      Text('20'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.add),
                      Text('Last Withdraw: '),
                      WalletInfo()
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  // Deposit

                  TextFieldInput(
                    textEditingController: _depositController,
                    hintText: 'Enter amount',
                    textInputType: TextInputType.number,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        // late final WidgetRef ref = context as WidgetRef;
                        BigInt amount =
                            BigInt.from(int.parse(_depositController.text));
                        print("Amount : $amount");
                        await ref.read(ethereumUtilsProvider).writeToContract(
                          Constants.addDepositAmount,
                          [amount],
                        );
                        _depositController.clear();
                      },
                      child: Container(
                        width: 80,
                        height: 30,
                        color: Colors.blue[400],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Center(
                            child: Text("Deposit"),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  // text with draw
                  TextFieldInput(
                    textEditingController: _withdrawController,
                    hintText: 'Enter amount',
                    textInputType: TextInputType.number,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        // late final WidgetRef ref = context as WidgetRef;
                        BigInt amount =
                            BigInt.from(int.parse(_withdrawController.text));
                        await ref.read(ethereumUtilsProvider).writeToContract(
                            Constants.withdrawAmount, [amount]);
                        print("Widthdrawn amount: $amount");
                        _withdrawController.clear();
                      },
                      child: Container(
                        width: 80,
                        height: 30,
                        color: Colors.blue[400],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Center(
                            child: Text("Withdraw"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }  
}