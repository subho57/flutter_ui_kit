import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mighty_ui_kit/snippets/firebaseCRUD/model/FBUserModel.dart';
import 'package:nb_utils/nb_utils.dart';

class FirebaseUserService {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  CollectionReference ref;

  FirebaseUserService() {
    ref = fireStore.collection("users");
  }

  Future<FBUserModel> loginUser(String email, String password) async {
    var res = await ref.where('email', isEqualTo: email).where('password', isEqualTo: password).limit(1).get();
    if (res.docs != null) {
      if (res.docs.length == 0) {
        throw errorSomethingWentWrong;
      } else {
        return FBUserModel.fromJson(res.docs[0].data());
      }
    } else {
      throw errorSomethingWentWrong;
    }
  }

  Future<DocumentReference> addDocument(FBUserModel data) async {
    var res = await ref.where('email', isEqualTo: data.email.validate()).limit(1).get();

    if (res != null) {
      if (res.docs.isEmpty) {
        var doc = await ref.add(data.toJson());
        doc.update({'id': doc.id});
        return doc;
      } else {
        throw 'You are already registered with us';
      }
    } else {
      throw errorSomethingWentWrong;
    }
  }

  Future<void> updateDocument(Map<String, dynamic> data, String id) => ref.doc(id).update(data);

  Future<void> removeDocument(String id) => ref.doc(id).delete();
}
