import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String cvvCode = '';
  String cardHolderName = 'your name';
  String expiryDate = '';
  bool isCvvFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: buildPaymentUi());
  }

  buildPaymentUi() {
    return Center(
      child: Container(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.grey.shade200,
                child: Center(
                  child: CreditCardWidget(
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    bankName: "Telda",
                    cvvCode: cvvCode,
                    obscureCardNumber: false,
                    obscureCardCvv: false,
                    isHolderNameVisible: true,
                    isSwipeGestureEnabled: true,
                    showBackView: isCvvFocused,
                    //true when you want to show cvv(back) view
                    cardBgColor: Colors.black,
                    labelCardHolder: cardHolderName,
                    onCreditCardWidgetChange: (CreditCardBrand
                        brand) {}, // Callback for anytime credit card brand is changed
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                child: cardForm(),
              ),
            )
          ],
        ),
      ),
    );
  }

  buildCardDetails() {}

  cardText(double cardNum) {
    return Row(
      children: [
        Text(cardNum.toString()),
      ],
    );
  }

  cardForm() {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Card Details",
                style: GoogleFonts.poppins(
                  fontSize: size.width * 0.040,
                  fontWeight: FontWeight.w600,
                ),
              )),
        ),
        CreditCardForm(
          formKey: formKey,
          obscureCvv: true,
          obscureNumber: true,
          cardNumber: cardNumber,
          cvvCode: cvvCode,
          isHolderNameVisible: true,
          isCardNumberVisible: true,
          isExpiryDateVisible: true,
          cardHolderName: "Telda",
          expiryDate: expiryDate,
          inputConfiguration: const InputConfiguration(
            cardNumberDecoration: InputDecoration(
              labelText: 'Number',
              hintText: 'XXXX XXXX XXXX XXXX',
            ),
            expiryDateDecoration: InputDecoration(
              labelText: 'Expired Date',
              hintText: 'XX/XX',
            ),
            cvvCodeDecoration: InputDecoration(
              labelText: 'CVV',
              hintText: 'XXXX',
            ),
            cardHolderDecoration:
                InputDecoration(labelText: 'your name', hintText: 'your name'),
          ),
          onCreditCardModelChange: onCreditCardModelChange,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
          child: _buildCheckoutButton(),
        )
        // Add other widgets or actions as needed
      ],
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  Widget _buildCheckoutButton() {
    Color color = Colors.grey;
    if (cardNumber.isNotEmpty &&
        expiryDate.isNotEmpty &&
        cardHolderName.isNotEmpty &&
        cvvCode.isNotEmpty) {
      color = Colors.deepPurpleAccent;
    } else {
      color = Colors.grey;
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.055,
      child: ElevatedButton(
        onPressed: () {
          if (cardNumber.isNotEmpty &&
              expiryDate.isNotEmpty &&
              cardHolderName.isNotEmpty &&
              cvvCode.isNotEmpty) {
            Navigator.pushNamed(context, '/LocationScreen');
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
            child: Text(
          "CHECKOUT",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        )),
      ),
    );
  }
}
