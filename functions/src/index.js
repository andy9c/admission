// Import the functions you need from the SDKs you need
import { initializeApp } from "@firebase/app";
import { getAnalytics } from "@firebase/analytics";
import { getFirestore } from "@firebase/firestore";
import { getStorage } from "@firebase/storage";
import { getPerformance } from "@firebase/performance";


// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyD71A_OGuYvtb7fTKPOr3FgWZ7Gsb7K3b8",
  authDomain: "stpaulsrkl-admission.firebaseapp.com",
  projectId: "stpaulsrkl-admission",
  storageBucket: "stpaulsrkl-admission.appspot.com",
  messagingSenderId: "167009655082",
  appId: "1:167009655082:web:dac8d439eb7204f8876653",
  measurementId: "G-4N2VB0G6L4"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const defaultAnalytics = getAnalytics(app);
const defaultFirestore = getFirestore(app);
const defaultStorage = getStorage(app);
const defaultPerformance = getPerformance(app);