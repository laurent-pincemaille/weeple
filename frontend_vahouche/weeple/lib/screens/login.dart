import 'package:flutter/material.dart';
import 'package:weeple/fake_data/users.dart';
import 'package:weeple/screens/home.dart';
import 'package:weeple/screens/signin.dart';
import 'package:weeple/styles.dart';

enum InputType {
  mail,
  password,
  pseudo,
  address,
  search,
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Logo(),
              SizedBox(height: 16),
              Title(),
              SizedBox(height: 16),
              Input(inputType: InputType.mail),
              Input(inputType: InputType.password),
              // Expanded(child: SizedBox()),
              ConnexionBtn(),
              SignInSection(),
              ForgontenPassword(),
            ],
          ),
        ),
      ),
    );
  }
}

//Title
class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Weeple",
      style: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: primaryColor),
    );
  }
}

//Logo
class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage("assets/weeple_logo.webp"),
      width: 200,
    );
  }
}

//Input
class Input extends StatefulWidget {
  const Input({
    super.key,
    required this.inputType,
  });
  final InputType inputType;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  late IconData _iconData;
  late String _hint;
  late TextInputType _textInputType;
  bool _isObscure = true;
  @override
  void initState() {
    if (widget.inputType == InputType.mail) {
      _iconData = Icons.person;
      _hint = "adresse mail";
      _textInputType = TextInputType.emailAddress;
    }
    if (widget.inputType == InputType.password) {
      _iconData = Icons.lock;
      _hint = "mot de passe";
      _textInputType = TextInputType.text;
    }
    if (widget.inputType == InputType.search) {
      _iconData = Icons.search_outlined;
      _hint = "quel jeux rechez-vous ?";
      _textInputType = TextInputType.text;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
      height: 64,
      decoration: BoxDecoration(
        color: primaryColorLightest,
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Icon(
            _iconData,
            color: primaryColorLighter,
            size: 32,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: TextField(
            obscureText:
                widget.inputType == InputType.password ? _isObscure : false,
            cursorColor: primaryColorLighter,
            cursorWidth: 4,
            keyboardType: _textInputType,
            style: const TextStyle(
              color: primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: _hint,
                hintStyle: const TextStyle(
                    color: neutral, fontWeight: FontWeight.normal)),
          ),
        ),
        if (widget.inputType != InputType.password) const SizedBox(width: 8),
        if (widget.inputType == InputType.password)
          IconButton(
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
            icon: _isObscure
                ? const Icon(
                    Icons.visibility,
                    color: primaryColor,
                  )
                : const Icon(
                    Icons.visibility_off,
                    color: primaryColor,
                  ),
          ),
      ]),
    );
  }
}

class ConnexionBtn extends StatelessWidget {
  const ConnexionBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: double.infinity,
      height: 64,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
          {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => Home(user: users[0], pageIndex: 1),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColorLighter,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32))),
        ),
        child: const Text(
          "CONNEXION",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class SignInSection extends StatelessWidget {
  const SignInSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Pas encore de compte?",
          style: TextStyle(color: primaryColorLighter, fontSize: 16),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => const SignIn()));
              }
            },
            child: const Text(
              "Inscrivez-vous !",
              style: TextStyle(color: primaryColor, fontSize: 16),
            ))
      ],
    );
  }
}

class ForgontenPassword extends StatelessWidget {
  const ForgontenPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: primaryColor,
            content: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Un mail vous permettant de réinitialiser votre mot de passe vous a été envoyé à l'adresse indiquée",
                style: TextStyle(fontSize: 16),
              ),
            ),
            duration: Duration(seconds: 4)));
      },
      child: const Text(
        "mot de passe oublié",
        style: TextStyle(
            color: primaryColorLighter,
            fontSize: 16,
            fontWeight: FontWeight.normal),
      ),
    );
  }
}
