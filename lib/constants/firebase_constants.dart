import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final firestore = FirebaseFirestore.instance;
final storageRef = FirebaseStorage.instance.ref();

final CollectionReference postsRef = firestore.collection('posts');
final CollectionReference userRef = firestore.collection('users');

