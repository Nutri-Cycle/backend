//TODO : IMPLEMENT PASSPORT


// const localStrategy = require('passport-local').Strategy;

// function initialize(passport) {
//   //2 definisikan fungsi untuk autentikasi
//   const authenticateUser = (email, password, done) => {
//     const user = getUserByEmail(email);


//   }

//   //1 definisikan passport untuk langkah langkah autentikasi
//   passport.use(new localStrategy({ usernameField: 'email' }, authenticateUser));

//   //3 serialize dan deserialize user
//   passport.serializeUser((user, done) => done(null, user.id));
//   passport.deserializeUser((id, done) => {});

  
// }

// module.exports = initialize;
