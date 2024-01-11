import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/constant.dart';

class SessionPaymentPage extends StatefulWidget {
  static const routeName = "/session-payment";
  const SessionPaymentPage({super.key});

  @override
  State<SessionPaymentPage> createState() => _SessionPaymentPageState();
}

class _SessionPaymentPageState extends State<SessionPaymentPage> {
  int sessionCounts = 0;
  PaymentMethods? paymentMethod = PaymentMethods.mandiriVA;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16)),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text("Pembayaran",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: ShapeDecoration(
                  color: theme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Jumlah Sesi",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 12),
                      Container(
                          width: double.infinity,
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Colors.white,
                              ),
                            ),
                          )),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Container(
                            decoration: ShapeDecoration(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (sessionCounts != 0)
                                            sessionCounts--;
                                        });
                                      },
                                      icon: const Icon(Icons.remove,
                                          color: Colors.white)),
                                  const SizedBox(width: 11),
                                  Text("$sessionCounts",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                  const SizedBox(width: 11),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          sessionCounts++;
                                        });
                                      },
                                      icon: const Icon(Icons.add,
                                          color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text("sesi*",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Total',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '*1 sesi= 30 menit',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Rp. xx.xxx',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                  decoration: ShapeDecoration(
                    color: theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Metode Pembayaran",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(height: 12),
                            Container(
                                width: double.infinity,
                                decoration: const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 2,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                            const SizedBox(height: 16),
                            Text("Transfer Virtual Account",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(height: 12),
                            ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Container(
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignOutside,
                                          color: Color(0xFFAAC0CD),
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Image.asset(
                                        "assets/images/dummy-beasiswa-icon.png",
                                        fit: BoxFit.fill,
                                      ),
                                    )),
                                title: Text("Mandiri Virtual Account",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700)),
                                trailing: Radio<PaymentMethods>(
                                  fillColor: const MaterialStatePropertyAll(
                                      Colors.white),
                                  value: PaymentMethods.mandiriVA,
                                  groupValue: paymentMethod,
                                  onChanged: (PaymentMethods? value) {
                                    setState(() => paymentMethod = value);
                                  },
                                )),
                            const SizedBox(height: 8),
                            Container(
                                width: double.infinity,
                                decoration: const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                            const SizedBox(height: 8),
                            ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Container(
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignOutside,
                                          color: Color(0xFFAAC0CD),
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Image.asset(
                                        "assets/images/dummy-beasiswa-icon.png",
                                        fit: BoxFit.fill,
                                      ),
                                    )),
                                title: Text("BRI Virtual Account",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700)),
                                trailing: Radio<PaymentMethods>(
                                  fillColor: const MaterialStatePropertyAll(
                                      Colors.white),
                                  value: PaymentMethods.briVA,
                                  groupValue: paymentMethod,
                                  onChanged: (PaymentMethods? value) {
                                    setState(() => paymentMethod = value);
                                  },
                                )),
                            const SizedBox(height: 8),
                            Container(
                                width: double.infinity,
                                decoration: const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                            const SizedBox(height: 8),
                            ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Container(
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignOutside,
                                          color: Color(0xFFAAC0CD),
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Image.asset(
                                        "assets/images/dummy-beasiswa-icon.png",
                                        fit: BoxFit.fill,
                                      ),
                                    )),
                                title: Text("BCA Virtual Account",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700)),
                                trailing: Radio<PaymentMethods>(
                                  fillColor: const MaterialStatePropertyAll(
                                      Colors.white),
                                  value: PaymentMethods.bcaVA,
                                  groupValue: paymentMethod,
                                  onChanged: (PaymentMethods? value) {
                                    setState(() => paymentMethod = value);
                                  },
                                )),
                            Container(
                                width: double.infinity,
                                decoration: const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                            const SizedBox(height: 12),
                            Text("E-Money",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(height: 12),
                            ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Container(
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignOutside,
                                          color: Color(0xFFAAC0CD),
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Image.asset(
                                        "assets/images/dummy-beasiswa-icon.png",
                                        fit: BoxFit.fill,
                                      ),
                                    )),
                                title: Text("Gopay",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700)),
                                trailing: Radio<PaymentMethods>(
                                  fillColor: const MaterialStatePropertyAll(
                                      Colors.white),
                                  value: PaymentMethods.gopay,
                                  groupValue: paymentMethod,
                                  onChanged: (PaymentMethods? value) {
                                    setState(() => paymentMethod = value);
                                  },
                                )),
                            const SizedBox(height: 8),
                            Container(
                                width: double.infinity,
                                decoration: const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                            const SizedBox(height: 8),
                            ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Container(
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignOutside,
                                          color: Color(0xFFAAC0CD),
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Image.asset(
                                        "assets/images/dummy-beasiswa-icon.png",
                                        fit: BoxFit.fill,
                                      ),
                                    )),
                                title: Text("OVO",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700)),
                                trailing: Radio<PaymentMethods>(
                                  fillColor: const MaterialStatePropertyAll(
                                      Colors.white),
                                  value: PaymentMethods.ovo,
                                  groupValue: paymentMethod,
                                  onChanged: (PaymentMethods? value) {
                                    setState(() => paymentMethod = value);
                                  },
                                )),
                            const SizedBox(height: 8),
                            Container(
                                width: double.infinity,
                                decoration: const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ]))),
              const SizedBox(height: 16),
              SizedBox(
                height: 46,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: theme.primaryColor,
                  ),
                  onPressed: () {},
                  child: Text("Bayar",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
