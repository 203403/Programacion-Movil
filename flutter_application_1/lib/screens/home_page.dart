import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_application_1/screens/welcome_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late FirebaseAuth _auth;

  bool isUserSignedIn = false;
  bool isUserSignedInFacebook = false;

  @override
  void initState() {
    super.initState();

    initApp();
  }

  void initApp() async {
    FirebaseApp defaultApp = await Firebase.initializeApp();
    _auth = FirebaseAuth.instanceFor(app: defaultApp);
    checkIfUserIsSignedIn();
  }

  void checkIfUserIsSignedIn() async {
    var userSignedIn = await _googleSignIn.isSignedIn();
    AccessToken? accessToken = await FacebookAuth.instance.accessToken;

    setState(() {
      isUserSignedIn = userSignedIn;
      if (accessToken != null) {
        isUserSignedInFacebook = true;
      } else {
        isUserSignedInFacebook = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            children: [logo(), loginSN(context), loginRole(context)],
          ),
        ),
      ),
    );
  }

  Expanded logo() {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }

  Expanded loginSN(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton.icon(
                  icon: SvgPicture.asset("assets/images/google.svg",
                      color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xff3f68ec),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                  onPressed: () {
                    onGoogleSignIn(context);
                  },
                  label: Text(
                      isUserSignedIn
                          ? 'Continuar con Google'
                          : 'Acceder con Google',
                      style: TextStyle(fontSize: 22)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton.icon(
                  icon: SvgPicture.asset("assets/images/facebook.svg",
                      color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xff384e9f),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                  onPressed: () {
                    signInWithFacebook(context);
                  },
                  label: Text(
                    isUserSignedInFacebook
                        ? 'Continuar con Facebook'
                        : 'Acceder con Facebook',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                label: const Text("Registrarse con e-mail",
                    style: TextStyle(fontSize: 22)),
                icon: const Icon(Icons.email, color: Color(0xff65676e)),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xff65676e),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  side: const BorderSide(width: 3, color: Color(0xff65676e)),
                ),
                onPressed: () async {
                  Navigator.pushNamed(context, '/register');
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded loginRole(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            const Text("Entrar como invitado",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xffe73964))),
            const Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 40),
              child: Text(
                "Entrar como vendedor",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xff80a660)),
              ),
            ),
            loginAC(context)
          ],
        ),
      ),
    );
  }

  static Padding loginAC(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: RichText(
          textWidthBasis: TextWidthBasis.longestLine,
          textAlign: TextAlign.justify,
          text: TextSpan(
            style: const TextStyle(fontSize: 18, color: Colors.black),
            children: [
              const TextSpan(text: "¿Ya tienes una cuenta? "),
              TextSpan(
                text: "Iniciar sesión",
                style: const TextStyle(
                    color: Color(0xffe73863), fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    Navigator.pushNamed(context, '/login');
                  },
              ),
            ],
          ),
        ));
  }

  Future<User?> _handleSignIn() async {
    User? user;
    bool userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;
    });

    if (isUserSignedIn) {
      user = _auth.currentUser;
    } else {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      user = (await _auth.signInWithCredential(credential)).user;
      userSignedIn = await _googleSignIn.isSignedIn();
      setState(() {
        isUserSignedIn = userSignedIn;
      });
    }

    return user;
  }

  void onGoogleSignIn(BuildContext context) async {
    User? user = await _handleSignIn();
    // ignore: use_build_context_synchronously
    var userSignedIn = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => WelcomeUserGoogle(user!, _googleSignIn)),
    );

    setState(() {
      isUserSignedIn = userSignedIn == null ? true : false;
    });
  }

  Future<User?> _handleSignInFacebook() async {
    User? user;
    final AccessToken? accessToken = await FacebookAuth.instance.accessToken;

    setState(() {
      if (accessToken != null) {
        isUserSignedInFacebook = true;
      } else {
        isUserSignedInFacebook = false;
      }
    });

    if (isUserSignedInFacebook) {
      // final userData = await FacebookAuth.instance.getUserData();
      final AuthCredential credential = FacebookAuthProvider.credential(
        accessToken!.token,
      );
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      user = userCredential.user;
    } else {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.status == LoginStatus.success) {
        final AccessToken accessToken = loginResult.accessToken!;
        // final userData = await FacebookAuth.instance.getUserData();

        final AuthCredential credential = FacebookAuthProvider.credential(
          accessToken.token,
        );

        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        user = userCredential.user;
      }
    }
    return user;
  }

  void signInWithFacebook(BuildContext context) async {
    User? user = await _handleSignInFacebook();
    // ignore: use_build_context_synchronously
    var userSignedIn = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WelcomeUserFacebook(user!)),
    );

    setState(() {
      isUserSignedInFacebook = userSignedIn == null ? true : false;
    });
  }

  void signInAsGuest(BuildContext context) async {
    try {
      final userCreddential = await FirebaseAuth.instance.signInAnonymously();
      User? user = userCreddential.user!;
      // ignore: use_build_context_synchronously
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomeUserGuest(user)),
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  }
}
