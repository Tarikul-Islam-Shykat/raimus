import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prettyrini/feature/broker_list/ui/broker_list.dart';

class BrokerPageScreen extends StatelessWidget {
  const BrokerPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'), // Your ImagePath.bg
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h), // Your devToSpace()

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  // Empty space for balance
                  SizedBox(width: 32.w),

                  // Centered title
                  Expanded(
                    child: Center(
                      child: Text(
                        'Broker List',
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  // Add button
                  Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.35),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: IconButton(
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 18,
                        color: Color(0xFF6C757D),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // Broker Cards
            const BrokerListCard(),
            const BrokerListCard(
              brokerName: "Century 21 Real Estate",
              location: "Phoenix, Arizona 85001",
              totalAgents: 85,
              totalListings: 120,
            ),
            const BrokerListCard(
              brokerName: "Coldwell Banker",
              location: "Tucson, Arizona 85701",
              totalAgents: 65,
              totalListings: 95,
            ),
          ],
        ),
      ),
    );
  }
}
