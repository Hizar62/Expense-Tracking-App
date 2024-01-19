import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;

  const RoundButton({
    super.key,
    required this.title,
    required this.onTap,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 350,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 20, 18, 18),
        ),
        child: loading
            ? const CircularProgressIndicator(
                strokeWidth: 3,
                color: Colors.white,
              )
            : Center(
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
      ),
    );
  }
}
