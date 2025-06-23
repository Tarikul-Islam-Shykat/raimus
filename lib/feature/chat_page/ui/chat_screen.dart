import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prettyrini/core/const/image_path.dart';
import 'package:prettyrini/core/global_widegts/app_text_widget.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePath.bg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            devToSpace(),

            // Header
            Center(
              child: Text(
                'Message',
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),

            SizedBox(height: 20.h),

            // Messages list
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: [
                  _buildMessageItem(
                    name: 'Marco Bellini',
                    message: 'Greetings from the kitchen! Today\'s...',
                    time: '2:55 PM',
                    date: '1/13/2025',
                    avatarPath: ImagePath.u1,
                    onTap: () {
                      // Navigate to chat with Marco
                    },
                  ),
                  _buildMessageItem(
                    name: 'Luca Romano',
                    message: 'Greetings from the kitchen! Today\'s...',
                    time: '2:55 PM',
                    date: '1/13/2025',
                    avatarPath: ImagePath.u2,
                    onTap: () {
                      // Navigate to chat with Luca
                    },
                  ),
                  _buildMessageItem(
                    name: 'Sofia Martinez',
                    message: 'Welcome to our restaurant! Our spec...',
                    time: '2:55 PM',
                    date: '1/13/2025',
                    avatarPath: ImagePath.u3,
                    onTap: () {
                      // Navigate to chat with Sofia
                    },
                  ),
                  _buildMessageItem(
                    name: 'Hiroshi Tanaka',
                    message: 'Konnichiwa! Today, we are featuring...',
                    time: '2:55 PM',
                    date: '1/13/2025',
                    avatarPath: ImagePath.u4,
                    onTap: () {
                      // Navigate to chat with Hiroshi
                    },
                  ),
                  _buildMessageItem(
                    name: 'Isabella Costa',
                    message: 'Buongiorno! Our menu showcases a...',
                    time: '2:55 PM',
                    date: '1/13/2025',
                    avatarPath: ImagePath.u5,
                    onTap: () {
                      // Navigate to chat with Isabella
                    },
                  ),
                  _buildMessageItem(
                    name: 'Alejandro Rodriguez',
                    message: '¡Hola! Join us for a fiesta of flavors w...',
                    time: '2:55 PM',
                    date: '1/13/2025',
                    avatarPath: ImagePath.u6,
                    onTap: () {
                      // Navigate to chat with Alejandro
                    },
                  ),
                  _buildMessageItem(
                    name: 'Mei Chen',
                    message: 'Ni hao! Experience the taste of Chin...',
                    time: '2:55 PM',
                    date: '1/13/2025',
                    avatarPath: ImagePath.u7,
                    onTap: () {
                      // Navigate to chat with Mei
                    },
                  ),
                  _buildMessageItem(
                    name: 'Patrick O\'Malley',
                    message: 'Top morning to you! Indulge in...',
                    time: '2:55 PM',
                    date: '1/13/2025',
                    avatarPath: ImagePath.u8,
                    onTap: () {
                      // Navigate to chat with Patrick
                    },
                    isLast: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageItem({
    required String name,
    required String message,
    required String time,
    required String date,
    required String avatarPath,
    required VoidCallback onTap,
    bool isLast = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: isLast ? 0 : 12.h),
        padding: EdgeInsets.all(12.w),
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.circular(12.r),
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.black.withOpacity(0.05),
        //       blurRadius: 8,
        //       offset: const Offset(0, 2),
        //     ),
        //   ],
        // ),
        child: Row(
          children: [
            // Avatar
            ClipRRect(
              borderRadius: BorderRadius.circular(25.r),
              child: Image.asset(
                avatarPath,
                width: 50.w,
                height: 50.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12.w),

            // Message content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and time row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        date,
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),

                  // Message preview and time row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          message,
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        time,
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Alternative version with online status indicators
class MessageScreenWithStatus extends StatelessWidget {
  const MessageScreenWithStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePath.bg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            devToSpace(),

            // Header
            Center(
              child: Text(
                'Message',
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),

            SizedBox(height: 20.h),

            // Messages list
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: [
                  _buildMessageItemWithStatus(
                    name: 'Marco Bellini',
                    message: 'Greetings from the kitchen! Today\'s...',
                    time: '2:55 PM',
                    date: '1/13/2025',
                    avatarPath: ImagePath.u1,
                    isOnline: true,
                    hasUnread: true,
                    onTap: () {},
                  ),
                  _buildMessageItemWithStatus(
                    name: 'Luca Romano',
                    message: 'Greetings from the kitchen! Today\'s...',
                    time: '2:55 PM',
                    date: '1/13/2025',
                    avatarPath: ImagePath.u2,
                    isOnline: false,
                    hasUnread: false,
                    onTap: () {},
                  ),
                  _buildMessageItemWithStatus(
                    name: 'Sofia Martinez',
                    message: 'Welcome to our restaurant! Our spec...',
                    time: '2:55 PM',
                    date: '1/13/2025',
                    avatarPath: ImagePath.u3,
                    isOnline: true,
                    hasUnread: true,
                    onTap: () {},
                  ),
                  _buildMessageItemWithStatus(
                    name: 'Hiroshi Tanaka',
                    message: 'Konnichiwa! Today, we are featuring...',
                    time: '2:55 PM',
                    date: '1/13/2025',
                    avatarPath: ImagePath.u4,
                    isOnline: false,
                    hasUnread: false,
                    onTap: () {},
                  ),
                  _buildMessageItemWithStatus(
                    name: 'Isabella Costa',
                    message: 'Buongiorno! Our menu showcases a...',
                    time: '2:55 PM',
                    date: '1/13/2025',
                    avatarPath: ImagePath.u5,
                    isOnline: true,
                    hasUnread: false,
                    onTap: () {},
                  ),
                  _buildMessageItemWithStatus(
                    name: 'Alejandro Rodriguez',
                    message: '¡Hola! Join us for a fiesta of flavors w...',
                    time: '2:55 PM',
                    date: '1/13/2025',
                    avatarPath: ImagePath.u6,
                    isOnline: false,
                    hasUnread: true,
                    onTap: () {},
                  ),
                  _buildMessageItemWithStatus(
                    name: 'Mei Chen',
                    message: 'Ni hao! Experience the taste of Chin...',
                    time: '2:55 PM',
                    date: '1/13/2025',
                    avatarPath: ImagePath.u7,
                    isOnline: true,
                    hasUnread: false,
                    onTap: () {},
                  ),
                  _buildMessageItemWithStatus(
                    name: 'Patrick O\'Malley',
                    message: 'Top morning to you! Indulge in...',
                    time: '2:55 PM',
                    date: '1/13/2025',
                    avatarPath: ImagePath.u8,
                    isOnline: false,
                    hasUnread: false,
                    onTap: () {},
                    isLast: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageItemWithStatus({
    required String name,
    required String message,
    required String time,
    required String date,
    required String avatarPath,
    required bool isOnline,
    required bool hasUnread,
    required VoidCallback onTap,
    bool isLast = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: isLast ? 0 : 12.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Avatar with online status
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.r),
                  child: Image.asset(
                    avatarPath,
                    width: 50.w,
                    height: 50.h,
                    fit: BoxFit.cover,
                  ),
                ),
                if (isOnline)
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 12.w),

            // Message content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and time row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight:
                              hasUnread ? FontWeight.w700 : FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        date,
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),

                  // Message preview and time row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          message,
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight:
                                hasUnread ? FontWeight.w500 : FontWeight.w400,
                            color:
                                hasUnread ? Colors.black87 : Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Row(
                        children: [
                          Text(
                            time,
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[600],
                            ),
                          ),
                          if (hasUnread) ...[
                            SizedBox(width: 6.w),
                            Container(
                              width: 8.w,
                              height: 8.h,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
