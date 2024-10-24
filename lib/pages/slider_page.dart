import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderPage extends StatelessWidget {
  SliderPage({super.key});
  final List<String> bannerImages = [
    "https://media.istockphoto.com/id/1203599963/photo/food-background-with-assortment-of-fresh-organic-fruits-and-vegetables.jpg?s=1024x1024&w=is&k=20&c=jP13-jp5171GgDlLggNEigA_tbMikN6NbBtdHToFixg=",
    "https://media.istockphoto.com/id/1316968335/photo/shopping-cart-full-of-food-on-yellow-background-grocery-and-food-store-concept.jpg?s=1024x1024&w=is&k=20&c=eDIXkTpOPEeJz6NWm6XC4YtyTX2LoxCbBASEQzQh_mI=",
    "https://media.istockphoto.com/id/1203599936/photo/food-background-with-assortment-of-fresh-organic-fruits-and-vegetables.jpg?s=1024x1024&w=is&k=20&c=G0z2GCqnbn5WN_8L6QRgZugAkPEDsIaJZLdOONE1oE0=",
  ];



  @override
  Widget build(BuildContext context) {
    return _buildBanner();
  }

  // Method to build the banner/slider
  Widget _buildBanner() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true, // Automatically scrolls through items
        enlargeCenterPage: true, // Enlarges the center image
        aspectRatio: 16 / 9, // Aspect ratio for each image
        autoPlayInterval: Duration(seconds: 3),
        viewportFraction: 1.0,// Duration between slides
      ),
      items: bannerImages.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover, // Ensures the image covers the container
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
