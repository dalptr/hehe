import 'package:flutter/material.dart';
import 'my_appbar.dart';
import 'product_page.dart';
import 'my_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Final Exam',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size size;

  String _selectedCategory = 'Burges';

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Hey!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const Text('Let\'s get your order',
                style: TextStyle(color: Colors.grey, fontSize: 16)),
            const SizedBox(height: 20),
            const Material(
              elevation: 8,
              shadowColor: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search our delicious burges',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _categoryChild('Burges', 'assets/images/burge.png'),
                _categoryChild('Pizza', 'assets/images/pizza.png'),
                _categoryChild('Cakes', 'assets/images/cake.png'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Popular',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('View all >',
                    style: TextStyle(fontSize: 16, color: Colors.red[700])),
              ],
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const ProductPage())),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.red[700],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Chipotle Cheesy Chicken',
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text('\$20.95',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Text('Chicken Burger',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey)),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                  Center(
                      child: Image(
                          image: const AssetImage('assets/images/burge2.png'),
                          width: size.width / 2,
                          height: size.width / 2,
                          fit: BoxFit.cover)),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const Navigation(),
    );
  }

  Widget _categoryChild(String title, String image) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedCategory = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: title == _selectedCategory ? Colors.red[700] : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Image.asset(image,
                  width: size.width / 3 - 63, height: size.width / 3 - 63),
            ),
            const SizedBox(height: 15),
            Text(title,
                style: TextStyle(
                    color: title == _selectedCategory
                        ? Colors.white
                        : Colors.black)),
            const SizedBox(height: 15),
            Icon(Icons.arrow_circle_right,
                color: title == _selectedCategory ? Colors.white : Colors.black)
          ],
        ),
      ),
    );
  }
}
