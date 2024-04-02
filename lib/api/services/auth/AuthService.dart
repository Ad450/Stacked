// import 'package:Stacked/api/services/auth/IAuthService.dart';
// import 'package:Stacked/core/storage/hive.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class AuthService implements IAuthService {
//   final HiveService hiveService;
//
//   AuthService(this.hiveService);
//   @override
//   Future<void> signupWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final credential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       await hiveService.saveItem(
//         credential.user?.uid,
//         HiveBoxNames.users.name,
//         key: credential.user?.uid,
//       );
//       return;
//     } on FirebaseAuthException catch (e) {
//       throw ApiFailure(e.code);
//     } on ApiFailure catch (e) {
//       throw ApiFailure(e.message);
//     } catch (e) {
//       throw ApiFailure(e.toString());
//     }
//   }
//
//   @override
//   Future<void> signupWithGoogle() async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         return;
//       } else {
//         final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//         final GoogleSignInAuthentication? googleAuth =
//             await googleUser?.authentication;
//         final googleCredentials = GoogleAuthProvider.credential(
//           accessToken: googleAuth?.accessToken,
//           idToken: googleAuth?.idToken,
//         );
//         final userCredentials =
//             await FirebaseAuth.instance.signInWithCredential(googleCredentials);
//         await hiveService.saveItem(
//           userCredentials.user?.uid,
//           HiveBoxNames.users.name,
//           key: userCredentials.user?.uid,
//         );
//         return;
//       }
//     } on ApiFailure catch (e) {
//       throw ApiFailure(e.message);
//     } catch (e) {
//       throw ApiFailure(e.toString());
//     }
//   }
//
//   @override
//   Future<String?> getCachedUser() async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user == null) {
//         throw ApiFailure("user not found");
//       }
//       final uid = await hiveService.readItem(user.uid, HiveBoxNames.users.name);
//       return uid;
//     } on ApiFailure catch (e) {
//       throw ApiFailure(e.message);
//     } catch (e) {
//       throw ApiFailure(e.toString());
//     }
//   }
//
//   @override
//   Future<void> logout() async {
//     try {
//       await FirebaseAuth.instance.signOut();
//       await hiveService.deleteAll(HiveBoxNames.categories.name);
//       return;
//     } catch (e) {
//       throw ApiFailure(e.toString());
//     }
//   }
// }
