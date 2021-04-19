import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/models/activity_model.dart';
import 'package:flutter_travel_ui/models/hotel_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HotelScreen extends StatefulWidget {
  final Hotel hotel;

  const HotelScreen({Key key, this.hotel}) : super(key: key);

  @override
  _HotelScreenState createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  Widget _buildRatingStars(double rating) {
    double stars = rating;
    return Padding(
      padding: EdgeInsets.only(bottom: 0.0, top: 5.0),
      child: Row(
        children: [
          Icon(
            Icons.star_border_outlined,
            color: Colors.cyanAccent.shade700,
            size: 26.0,
          ),
          Text("${(stars).toString()}",style: TextStyle(fontSize: 16),),
        ],
      ),
    );
  }

  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.height,
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.hotel.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Image(
                      image: AssetImage(widget.hotel.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    IconButton(
                      icon: _isFavorite
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 0),
                            blurRadius: 40,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        widget.hotel.name,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 0),
                            blurRadius: 28.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.locationArrow,
                            size: 12,
                            color: Colors.white70,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.hotel.address,
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 42.0,
                      ),
                    ],
                  ),
                  child:  _buildRatingStars(widget.hotel.rate),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    height:320.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Hotel Description",
                                style: TextStyle(
                                    fontSize: 24.0, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width) * 2 / 3,
                                child: Text(
                                  widget.hotel.description,
                                  maxLines: 6,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15.0,
                    right: 35.0,
                    child: Text(
                      "\$${widget.hotel.price}",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
