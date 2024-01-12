const db = require('../../conf/dbConnection').promise();
const bcrypt = require('bcrypt');

exports.register = async (req, res) => {  
  //parse input dari req.body
  const { username, email, password } = req.body;

  //cek apakah ada input yang kosong
  if (!username || !email || !password) {
    return res.status(400).send({ message: "Please provide all required fields!" });
  }
  
  try {
    // cek apakah user sudah terdaftar
    const [user] = await db.query('SELECT * FROM users WHERE username = ?', [username]);
    if (user.length > 0) {
      return res.status(400).send({ message: "Username is already registered!" });
    };

    //cek apakah email sudah terdaftar
    const [userEmail] = await db.query('SELECT * FROM users WHERE email = ?', [email]);
    if(userEmail.length > 0) {
      return res.status(400).send({ message: "Email is already registered!" });
    };
    
    //salt & hash password
    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);
    
    //insert user baru ke database
    const [newUser] = await db.execute('INSERT INTO `users` (`username`, `email`, `password`) VALUES (?, ?, ?)', [username, email, hashedPassword]);

    //cek apakah user berhasil di insert
    if (newUser.affectedRows === 1) {
      return res.status(200).send({ message: "User successfully registered!" });
    }
    
  } catch (error) {
    console.error(error);
    return res.status(500).send({ message: "Internal server error" });
  }
}
