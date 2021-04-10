import 'package:flutter/material.dart';

class ExamplesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.all(32),
        children: [
          buildBackgroundCard(),
          Center(child: buildIconCard()),
          Center(child: buildBurger()),
        ],
      );

  Widget buildBurger() {
    final urlBurger =
        'https://images.unsplash.com/photo-1586190848861-99aa4a171e90?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80';

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(12),
        color: Color(0xFF010101),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(urlBurger,
                width: 200, height: 200, fit: BoxFit.cover),
            Text(
              'Beef Burger',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Onion with cheese',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '\$24.00',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIconCard() => Card(
        color: Color(0xFF40358a),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        child: Container(
          width: 160,
          height: 160,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.access_time, color: Color(0xFF00dcff), size: 48),
              const SizedBox(height: 16),
              Text(
                'Active',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '2 Times a day',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      );

  Widget buildBackgroundCard() {
    final urlBackgroundImage =
        'https://images.unsplash.com/photo-1570544820979-6eb25385944d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80';

    return Container(
      padding: EdgeInsets.all(24),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(urlBackgroundImage),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.25),
            BlendMode.darken,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cottage',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '70-150\$',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
