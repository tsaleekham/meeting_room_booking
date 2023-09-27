import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final ImageProvider backgroundImage;
  final String title;

  const MyAppBar({
    super.key,
    required this.backgroundImage,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Colors.black,
              image: DecorationImage(
                image: backgroundImage,
                fit: BoxFit.fitWidth,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(
                    75,
                    0,
                    0,
                    0,
                  ),
                  blurRadius: 4,
                  offset: Offset(4, 8),
                )
              ]),
        ),
        SizedBox(
          height: 150,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 22,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).popUntil(
                          (route) => route.isFirst,
                        );
                      },
                      child: const SafeArea(
                        child: Text(
                          "Logout",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 22,
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
