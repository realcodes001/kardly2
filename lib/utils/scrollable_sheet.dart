import 'package:flutter/material.dart';
import 'package:kardly/provider/account_provider.dart';
import 'package:kardly/constants/colors.dart' as color;
import 'package:provider/provider.dart';
import 'package:kardly/components/modal_dropdown.dart';
import 'package:kardly/utils/institution_modal.dart';

void showDraggableScrollableModal(BuildContext context) {
  final provider = Provider.of<AccountProvider>(context, listen: false);
  provider.loadAccount(); // Load the saved account when the modal opens

  showGeneralDialog(
    context: context,
    barrierLabel: "Modal",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 600),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.pop(context),
          child: DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.3,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Consumer<AccountProvider>(
                builder: (context, provider, child) {
                  return Material(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 226, 226, 226),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    size: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Withdraw',
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'BricolageGrotesque Bold',
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: const [
                              Text(
                                'Wallet Balance',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'BricolageGrotesque Light',
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '\$786.00',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'BricolageGrotesque Regular',
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Text(
                            'Amount',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'BricolageGrotesque Regular',
                              color: color.AppColor.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: 'How much do you want to withdraw?',
                              hintStyle: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Account',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'BricolageGrotesque Regular',
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          GestureDetector(
                            onTap: () async {},
                            child: Container(
                              height: 60,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 225, 225, 225),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    provider.selectedAccount ??
                                        'No accounts available',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: provider.selectedAccount != null
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
                                  ),
                                  provider.selectedAccount != null
                                      ? GestureDetector(
                                          onTap: () async {
                                            String? selected =
                                                await showModalBottomSheet<
                                                    String>(
                                              context: context,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                ),
                                              ),
                                              builder: (context) {
                                                return CustomModalDropdown(
                                                  items:
                                                      provider.savedAccountName !=
                                                              null
                                                          ? [
                                                              provider
                                                                  .savedAccountName!
                                                            ]
                                                          : [],
                                                  selectedValue:
                                                      provider.selectedAccount,
                                                );
                                              },
                                            );
                                            if (selected != null) {
                                              provider.selectAccount(selected);
                                            }
                                          },
                                          child: const Icon(
                                              Icons.arrow_drop_down,
                                              size: 12),
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            showInstitutionsSheet(context);
                                          },
                                          child: Container(
                                            width: 80,
                                            padding: EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                              color: color
                                                  .AppColor.secondary_color,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Add Bank',
                                                  style: TextStyle(
                                                    fontSize: 9,
                                                    color: color.AppColor
                                                        .mainBtn_color2,
                                                    fontFamily:
                                                        'BricolageGrotesque Light',
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 2,
                                                ),
                                                Icon(
                                                  Icons.add,
                                                  size: 9,
                                                  color: color
                                                      .AppColor.mainBtn_color2,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text('Withdraw'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      );
    },
  );
}
