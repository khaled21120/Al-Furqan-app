import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/helper.dart';

class SocialButtonsRow extends StatelessWidget {
  const SocialButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    // Function to launch a URL
    Future<void> launchCustomUr(context, String? url) async {
      if (url != null) {
        Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        } else {
          Helper.showSnackBar(context: context, message: 'Cannot launch $url');
        }
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Facebook Button
        IconButton(
          icon: const Icon(
            FontAwesomeIcons.facebook,
            color: Colors.blue,
            size: 30,
          ),
          onPressed: () {
            // Add your Facebook link action here
            launchCustomUr(context, 'https://www.facebook.com/');
          },
        ),

        // google Button
        // IconButton(
        //   icon: const Icon(
        //     FontAwesomeIcons.google,
        //     color: Colors.red,
        //     size: 30,
        //   ),
        //   onPressed: () {
        //     // Add your Twitter link action here
        //     launchCustomUr(context, 'https://www.google.com/');
        //   },
        // ),

        // Instagram Button
        IconButton(
          icon: const Icon(
            FontAwesomeIcons.linkedin,
            color: Colors.blueAccent,
            size: 30,
          ),
          onPressed: () {
            // Add your linkedin link action here
            launchCustomUr(context, 'https://www.linkedin.com/');
          },
        ),

        // github Button
        IconButton(
          icon: const Icon(
            FontAwesomeIcons.github,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            // Add your github link action here
            launchCustomUr(context, 'https://github.com/khaled21120');
          },
        ),
      ],
    );
  }
}
