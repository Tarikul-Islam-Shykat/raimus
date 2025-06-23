import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prettyrini/core/const/image_path.dart';
import 'package:prettyrini/core/global_widegts/app_text_widget.dart';
import 'package:prettyrini/core/local/local_service.dart';
import 'package:prettyrini/route/route.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'), // Your ImagePath.bg
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                devToSpace(),
                // Profile Header with Image and User Tag
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
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
                            Icons.arrow_back,
                            size: 18,
                            color: Color(0xFF6C757D),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                      ),

                      // Centered title
                      Expanded(
                        child: Center(
                          child: Text(
                            'Profile',
                            style: GoogleFonts.inter(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 32.w),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 32.w),
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            child: ClipOval(
                              child: Image.asset(
                                ImagePath.profilePic,
                                width: 110,
                                height: 110,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Text(
                              'User',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      // User Name
                      const Text(
                        'Alma Lawson',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 8),
                      // User Email
                      Text(
                        'alma.lawson@example.com',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),

                      const SizedBox(height: 8),
                      // User Address
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '6391 Elgin St. Celina, Delaware 10299',
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // Menu Items
                _buildMenuOption(
                  icon: Icons.calendar_today_outlined,
                  title: 'My Appointments',
                  onTap: () {},
                ),

                _buildMenuOption(
                  icon: Icons.edit_outlined,
                  title: 'Edit Profile',
                  onTap: () {},
                ),

                _buildMenuOption(
                  icon: Icons.lock_outline,
                  title: 'Change Password',
                  onTap: () {},
                ),

                _buildMenuOption(
                  icon: Icons.logout_outlined,
                  title: 'Logout',
                  onTap: () async {
                    var local = LocalService();
                    await local.clearUserData();
                    Get.toNamed(AppRoute.loginScreen);
                  },
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.35),
          borderRadius: BorderRadius.circular(20)),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(12),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey.withOpacity(0.1),
      //       spreadRadius: 1,
      //       blurRadius: 3,
      //       offset: const Offset(0, 1),
      //     ),
      //   ],
      // ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black87),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: CircleAvatar(
          radius: 12,
          backgroundColor: Colors.black,
          child: Icon(Icons.arrow_forward_ios, size: 12, color: Colors.white),
        ),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
    );
  }
}

/*
// Example usage:
void navigateToProfile() {
  Get.to(() => const ProfileScreen());
}
*/
