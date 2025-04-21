import 'package:flutter/material.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';


Widget buildTabButton(String text, bool isSelected, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: isSelected ? 50 : 40,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFD2922A) : Colors.transparent,
        borderRadius: isSelected
            ? const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        )
            : BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? Color(0xFFD2922A) : Colors.grey,
          width: isSelected ? 0.0 : 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontFamily: 'JosefinSans',
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildRateColumn(String karat, String rate) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        karat,
        style: TextStyle(
          color: Colors.white.withOpacity(0.8),
          fontSize: 14,
        ),
      ),
      Text(
        rate,
        style: const TextStyle(
          fontFamily: 'JosefinSans',
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

Widget buildBottomButtons() {
  return Row(
    children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            // try a darker or custom color for better contrast
            borderRadius: BorderRadius.circular(1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: const Text(
                  'TODAY SALES',
                  style: TextStyle(
                    fontFamily: 'JosefinSans',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildMetalColumn('Gold', '250'),
                    buildMetalColumn('Platinum', '150'),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildMetalColumn('Silver', '600'),
                    CircleAvatar(
                      backgroundColor: Colors.grey[500],
                      child:
                      const Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            // try a darker or custom color for better contrast
            borderRadius: BorderRadius.circular(1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: const Text(
                  'CURRENT STOCK',
                  style: TextStyle(
                    fontFamily: 'JosefinSans',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildMetalColumn('Gold', '2560'),
                    buildMetalColumn('Platinum', '3980'),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildMetalColumn('Silver', '2890'),
                    CircleAvatar(
                      backgroundColor: Colors.grey[500],
                      child:
                      const Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget buildMetalColumn(String label, String value) {
  return Column(
    children: [
      Text(label, style: const TextStyle( fontFamily: 'JosefinSans',fontWeight: FontWeight.w400)),
      Row(
        children: [
          Text(value, style: const TextStyle( fontFamily: 'JosefinSans',fontSize:20,fontWeight: FontWeight.w900)),
          const Text('g', style: TextStyle( fontFamily: 'JosefinSans',fontSize:13,fontWeight: FontWeight.w500)),
        ],
      ),
    ],
  );
}

Widget buildTotalSalesButton() {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: brandGoldColor,
              width: 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'TOTAL SALES',
                      style: TextStyle(
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: LinearProgressIndicator(
                          value: 0.5,
                          backgroundColor: brandGoldColor,
                          valueColor:
                          AlwaysStoppedAnimation<Color>(brandGoldColor),
                          minHeight: 10,
                        ),
                      ),
                    ),
                    Text(
                      '20',
                      style: TextStyle(
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: brandPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 50,
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: brandGoldColor,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'ESTIMATES',
                        style: TextStyle(
                          fontFamily: 'JosefinSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        // Take remaining space
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: LinearProgressIndicator(
                            value: 0.5,
                            backgroundColor: Colors.white,
                            valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.white),
                            minHeight: 10,
                          ),
                        ),
                      ),
                      const Text(
                        '35',
                        style: TextStyle(
                          fontFamily: 'JosefinSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget buildWardButtons() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: const [
            Text('CASH INWARD',
                style: TextStyle(
                    fontFamily: 'JosefinSans',
                    fontWeight: FontWeight.w900,fontSize: 18, color: brandPrimaryColor)),
            Text('₹ 5,29,746', style: TextStyle( fontFamily: 'JosefinSans',fontSize:25,fontWeight: FontWeight.w900)),
          ],
        ),
        Column(
          children: const [
            Text('CASH OUTWARD',
                style: TextStyle( fontFamily: 'JosefinSans',
                    fontWeight: FontWeight.w900, fontSize:18,color: brandPrimaryColor)),
            Text('₹ 29,746', style: TextStyle( fontFamily: 'JosefinSans',fontSize:25,fontWeight: FontWeight.w900)),
          ],
        ),
      ],
    ),
  );
}

Widget buildApprovedButtons() {
  return Row(
    children: [
      Expanded(
        child: buildApprovalCard(
          title: 'PENDING APPROVAL',
          subtitle: 'Credit | Stock Transfer\nDiscount | Melting',
          badgeCount: 3,
        ),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: buildApprovalCard(
          title: 'NEW ORDER REPORTS',
          subtitle: 'Assign | Cancel\nDeliver | Check Status',
          badgeCount: 5,
        ),
      ),
    ],
  );
}

Widget buildApprovalCard({
  required String title,
  required String subtitle,
  required int badgeCount,
}) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        padding: const EdgeInsets.only(
            top: 20, left: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
          color: brandGreySoftColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'JosefinSans',
                  fontWeight: FontWeight.bold,
                  color: secondaryColor,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Center(
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'JosefinSans',
                  color: secondaryColor,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        right: 15,
        top: -10,
        child: CircleAvatar(
          radius: 15,
          backgroundColor: brandPrimaryColor,
          child: Text(
            '$badgeCount',
            style: const TextStyle(
              fontFamily: 'JosefinSans',
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      ),
    ],
  );
}



