import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class AuthService {


  final FirebaseAuth _auth = FirebaseAuth.instance;


  //create user obj based on firebase user
  CustomUser _userFromFireBase(User? user)
  {
    return CustomUser(uID: user!.uid);
  }

  //auth change user stream
  Stream<CustomUser> get user{
    return _auth.authStateChanges().map(_userFromFireBase);
  }

  //sign-in anon
  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFireBase(user);
    } catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  //sign-in

  //register

  //sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e)
    {
      print(e.toString());
      return null;
    }
  }

}