// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import { getFirestore } from "firebase/firestore";
import { getStorage } from "firebase/storage";
// import { getRemoteConfig } from "firebase/remote-config";


// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyDJzgGKz0QPrBBHpOwEndp3Gsbcm_lZcmQ",
  authDomain: "stpaulsrkl-erp.firebaseapp.com",
  projectId: "stpaulsrkl-erp",
  storageBucket: "stpaulsrkl-erp.appspot.com",
  messagingSenderId: "761502801966",
  appId: "1:761502801966:web:8fafbf1396f581f3783fbf"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const defaultAnalytics = getAnalytics(app);
const defaultFirestore = getFirestore(app);
// Initialize Cloud Storage and get a reference to the service
const defaultStorage = getStorage(app);
// const defaultRemoteConfig = getRemoteConfig(app);