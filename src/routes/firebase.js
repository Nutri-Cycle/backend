// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyDu7cLqOvlXLsMINWHMQGjsCy89Pkf-vrg",
  authDomain: "nutricycle-infra.firebaseapp.com",
  projectId: "nutricycle-infra",
  storageBucket: "nutricycle-infra.appspot.com",
  messagingSenderId: "801573479405",
  appId: "1:801573479405:web:9ae040a2a6fafc75d03de4",
  measurementId: "G-FXQK82VQM5"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);


//exports
module.exports = firebase;
