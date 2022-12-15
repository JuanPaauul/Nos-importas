import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SendEmail extends StatefulWidget {
  const SendEmail({super.key});

  @override
  State<SendEmail> createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
  final headers = {
    'Content-Type': 'application/json',
    'origin': 'http://localhost'
  };
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future sendConfidenceUserRequestEmail(
      {required String userName, required String email}) async {
    const templateId = 'template_xph6m4f';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: headers, body: getBody(templateId, userName, email, '', ''));
  }

  Future sendEmail(
      {required String userName,
      required String email,
      required String subject,
      required String message}) async {
    const templateId = 'template_xph6m4f';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: headers,
        body: getBody(templateId, userName, email, subject, message));
  }

  String getBody(String templateId, String userName, String email,
      String subject, String message) {
    const userId = 'zqvKHVi0Petufxiua';
    const serviceId = 'service_xwme01g';
    return json.encode({
      'service_id': serviceId,
      'templace_id': templateId,
      'user_id': userId,
      'template_params': {
        'user_name': userName,
        'user_email': email,
        'user_subject': subject,
        'user_message': message,
      }
    });
  }
}
