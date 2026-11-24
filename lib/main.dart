import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const StaffAttendanceApp());
}

class StaffAttendanceApp extends StatelessWidget {
  const StaffAttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Staff Attendance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
        primaryColor: const Color(0xFF00E5FF),
        fontFamily: GoogleFonts.inter().fontFamily,
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isPunchedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'STAFF PORTAL',
          style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 1.5),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: isPunchedIn 
                        ? Colors.redAccent.withOpacity(0.3) 
                        : const Color(0xFF00E5FF).withOpacity(0.3),
                    blurRadius: 50,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A1A1A),
                  shape: const CircleBorder(),
                  side: BorderSide(
                    color: isPunchedIn ? Colors.redAccent : const Color(0xFF00E5FF),
                    width: 2,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    isPunchedIn = !isPunchedIn;
                  });
                },
                child: Text(
                  isPunchedIn ? 'PUNCH\nOUT' : 'PUNCH\nIN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isPunchedIn ? Colors.redAccent : const Color(0xFF00E5FF),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Awaiting Location Data...',
              style: TextStyle(color: Colors.white54, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}