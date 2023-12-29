import 'package:flutter/material.dart';
import 'package:weeple/screens/home.dart';
import 'package:weeple/screens/login.dart';
import 'package:weeple/styles.dart';

class Wellcome extends StatefulWidget {
  const Wellcome({super.key});

  @override
  State<Wellcome> createState() => _LoginState();
}

class _LoginState extends State<Wellcome> {
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
              SizedBox(height: 16),
              Title(),
              SignInBtn(),
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
      "Bienvenue dans la commnunauté Weeple !",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      textAlign: TextAlign.center,
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
    if (widget.inputType == InputType.pseudo) {
      _iconData = Icons.sentiment_satisfied_alt;
      _hint = "pseudo";
      _textInputType = TextInputType.text;
    }
    if (widget.inputType == InputType.address) {
      _iconData = Icons.home_filled;
      _hint = "adresse";
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

class SignInBtn extends StatelessWidget {
  const SignInBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
          {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => const Home()));
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColorLighter,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32))),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            """Ajouter des Jeux 
à vôtre ludotèque""",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}

class LogInSection extends StatelessWidget {
  const LogInSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Déjà un compte ?",
          style: TextStyle(color: primaryColorLighter, fontSize: 16),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => const Login()));
              }
            },
            child: const Text(
              "Connectez-vous !",
              style: TextStyle(color: primaryColor, fontSize: 16),
            ))
      ],
    );
  }
}
