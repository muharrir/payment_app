import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:payment_apps/theme.dart';

void main() {
  runApp(PaymentApps());
}

class PaymentApps extends StatefulWidget {
  @override
  _PaymentAppsState createState() => _PaymentAppsState();
}

class _PaymentAppsState extends State<PaymentApps> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Widget option(
      int index,
      String title,
      String subTitle,
      String price,
    ) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          margin: EdgeInsets.only(
            left: 32,
            right: 32,
            bottom: 20,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selectedIndex == index
                  ? Color(0xff007DFF)
                  : Color(0xff4D5B7C),
            ),
          ),
          child: Row(
            children: [
              selectedIndex == index
                  ? Image.asset(
                      'assets/icon_filled_check.png',
                      width: 18,
                    )
                  : Image.asset(
                      'assets/icon_blank_check.png',
                      width: 18,
                    ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: whiteTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: whiteTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                  )
                ],
              ),
              Spacer(),
              Text(
                price,
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget header() {
      return Column(
        children: [
          Center(
            child: Image.asset(
              'assets/icon_logo.png',
              width: 267,
              height: 200,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Upgrade to ',
                style: whiteTextStyle.copyWith(
                  fontSize: 26,
                  fontWeight: bold,
                ),
              ),
              Text(
                'Pro',
                style: blueTextStyle.copyWith(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Go unlock all features and\nbuild your own business bigger',
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50,
          ),
        ],
      );
    }

    Widget checkoutButton() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: 32,
          right: 32,
          bottom: 55,
        ),
        height: 47,
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Color(0xff007DFF),
            shadowColor: Color(0xff007DFF),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(71),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Checkout Now',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff04112F),
        body: ListView(
          children: [
            Column(
              children: [
                header(),
                option(0, 'Monthly', 'Good for starting up', '\$20'),
                option(1, 'Quarterly', 'Focusing on building', '\$55'),
                option(2, 'Yearly', 'Steady company', '\$220'),
                selectedIndex == -1 ? SizedBox() : checkoutButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
