import 'package:flutter/material.dart';
import 'package:flutter_authentication_ui/app_utils.dart';
import 'package:flutter_authentication_ui/screen/login_screen.dart';
import 'package:flutter_authentication_ui/widgets/input_field_widget.dart';
import 'package:flutter_authentication_ui/widgets/primary_button.dart';
import 'package:intl/intl.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  String genderSelected = "male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Jack',
                style: TextStyle(
                  color: colorWhite,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Center(
              child: Text(
                'of all trades',
                style: TextStyle(
                  color: colorWhite,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const Center(
              child: Text(
                'Please enter your information',
                style: TextStyle(
                  color: colorWhite,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InputField(
              controller: nameController,
              hintText: 'Enter your name',
              icon: Icons.person,
            ),
            const SizedBox(
              height: 25,
            ),
            InputField(
              controller: emailController,
              hintText: 'Enter your email',
              icon: Icons.email,
            ),
            const SizedBox(
              height: 25,
            ),
            InputField(
              controller: passwordController,
              hintText: 'Enter your password',
              icon: Icons.password,
              obscureText: true,
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 20),
              child: TextFormField(
                style: const TextStyle(
                  color: colorWhite,
                ),
                textAlign: TextAlign.center,
                controller: birthDateController,
                decoration: const InputDecoration(
                  prefixIcon:
                      Icon(Icons.calendar_month, color: colorWhite, size: 25.0),
                  hintText: 'Enter your birth date',
                  hintStyle: TextStyle(
                    fontSize: 14.0,
                    color: colorGrey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: colorWhite),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: colorWhite),
                  ),
                ),
                onTap: () async {
                  DateTime date = DateTime(1900);
                  FocusScope.of(context).requestFocus(FocusNode());

                  date = (await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100)))!;
                  String dateFormatter = date.toIso8601String();
                  DateTime dt = DateTime.parse(dateFormatter);
                  var formatter = DateFormat('dd-MMMM-yyyy');
                  birthDateController.text = formatter.format(dt);
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'GENDER',
                    style: TextStyle(
                        color: colorWhite,
                        fontSize: 14.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          groupValue: genderSelected,
                          activeColor: colorWhite,
                          title: const Text(
                            "MALE",
                            style: TextStyle(
                                fontSize: 14.0,
                                color: colorWhite,
                                fontWeight: FontWeight.bold),
                          ),
                          value: 'male',
                          onChanged: (val) {
                            setState(() {
                              genderSelected = val.toString();
                            });
                            print(genderSelected);
                          },
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          groupValue: genderSelected,
                          activeColor: colorWhite,
                          title: const Text(
                            "FEMALE",
                            style: TextStyle(
                                fontSize: 14.0,
                                color: colorWhite,
                                fontWeight: FontWeight.bold),
                          ),
                          value: 'female',
                          onChanged: (val) {
                            setState(() {
                              genderSelected = val.toString();
                            });
                            print(genderSelected);
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            PrimaryButton(
              text: 'Sign Up',
              onPressed: () {
                if (isValidate()) {
                  print("Data is validated");
                  // Navigate to different screen
                }
              },
            ),
            const SizedBox(
              height: 25.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: colorWhite,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                        color: colorWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool isValidate() {
    if (nameController.text.isEmpty) {
      showScaffold(context, "Please enter your name");
      return false;
    }
    if (emailController.text.isEmpty) {
      showScaffold(context, "Please enter your email");
      return false;
    }
    if (passwordController.text.isEmpty) {
      showScaffold(context, "Please enter your password");
      return false;
    }
    if (birthDateController.text.isEmpty) {
      showScaffold(context, "Please enter your birth date");
      return false;
    }
    return true;
  }
}
