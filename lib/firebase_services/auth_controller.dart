
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../Screen/emailverify_screen.dart';
import '../Screen/login_screen.dart';
import 'firebase_auth.dart';


class AuthController extends GetxController {
  static AuthController authInstance = Get.find();
  late Rx<User?> firebaseUser;


  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {

    if (user != null) {
      // user is logged or created then go for verification
      Get.offAll(() =>  EmailVerify());
    } else {
      // user is null as in user is not available or not logged in
      Get.offAll(() => const LoginScreen());
    }
  }

  void register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      print(e.message);
      // Get.snackbar("Error", e.message!);
      Get.snackbar(
        "Something Went Wrong",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      // this is temporary. you can handle different kinds of activities
      //such as dialogue to indicate what's wrong
      print(e.toString());
    }
  }

  void login(String email, String password) async {

    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      print(e.message);

      Get.snackbar(
        "Something Went Wrong",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print(e.toString());
    }
  }



  void forget(String email) async {

    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      print(e.message);

      Get.snackbar(
        "Something Went Wrong",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print(e.toString());
    }
  }


  void signOut() {
    try {
      auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}



Future collection() async{

  try{
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
     }
  on FirebaseAuthException catch (e) {
    // this is solely for the Firebase Auth Exception
    // for example : password did not match
    print(e.message);

    Get.snackbar(
      "Something Went Wrong",
      e.message!,
      snackPosition: SnackPosition.BOTTOM,
    );
  } catch (e) {
    print(e.toString());
  }
}