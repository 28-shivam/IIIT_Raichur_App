import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [Colors.blue.shade200, Colors.purple.shade200],
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Profile",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.notifications),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/profile_image.png'),
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Keshvi Agarwal",
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "CS23B1032",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  profileDetail("DEPARTMENT", "Computer Science Engineering"),
                  profileDetail("SEMESTER", "4"),
                  profileDetail("CURRENT CGPA", "7"),
                  profileDetail("ACADEMIC YEAR", "2023 - 2027"),
                ],
              ),
            ),
            SizedBox(height: 16),
            buildCard('About', true, [
              buildInfoTile('Date of Birth', '1st Jan 2000'),
              buildInfoTile('Gender', 'Female'),
            ]),
            SizedBox(height: 16),
            buildCard('Contact Details', true, [
              buildInfoTile('Contact No', '123456790'),
              buildInfoTile('Email', 'abc123@gmail.com'),
              buildInfoTile('Address', '12, abc street, defgh, ijklm - 123456.'),
            ]),
            SizedBox(height: 16),
            buildCard('Current / Ongoing Courses', false, [
              Row(
                children: [
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade900,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.school,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'B.Tech IT',
                          style: TextStyle(
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              Text('Information Technology', style: TextStyle(color: Colors.grey[700])),
              SizedBox(height: 4),
              Text('Department of Engineering', style: TextStyle(color: Colors.grey[700])),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16, color: Colors.blueAccent),
                  SizedBox(width: 4),
                  Text('Sep 2020 - June 2024'),
                ],
              ),
              SizedBox(height: 4),
              Text('2024 Passout Batch | 210520201234'),
            ]),
            SizedBox(height: 16),
            buildSectionWithAddOption('Projects'),
            buildSectionWithAddOption('Certifications'),
            buildSectionWithAddOption('Patents'),
            buildSectionWithAddOption('Extra Curricular Activities'),
          ],
        ),
      ),
    );
  }

  Widget profileDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        "$title : $value",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
      ),
    );
  }

  Widget buildCard(String title, bool editable, List<Widget> children) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionTitle(title, editable),
            SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title, bool editable) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        if (editable)
          Text('Edit', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget buildInfoTile(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }

  Widget buildSectionWithAddOption(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Icon(Icons.add, color: Colors.blue),
                SizedBox(width: 8),
                Text('Add new', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        Text('You have not added any yet!', style: TextStyle(color: Colors.grey)),
        SizedBox(height: 16),
      ],
    );
  }
}