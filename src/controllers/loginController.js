const db = require('../../conf/dbConnection').promise();
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

exports.login = async (req, res) => {
  try {
    const {email, password} = req.body;

    //cari user berdasarkan email
    const [rows] = await db.query("SELECT * FROM users WHERE email = ?", [email]);

    //cek apakah email ada di database
    if (rows.length === 0) {
      return res.status(401).send({ message: "Invalid Email" });
    }

    //cek password yang diinputkan dengan password di database
    const compare = await bcrypt.compare(password, rows[0].password);

    if (!compare) {
      return res.status(401).send({ message: "Password is incorrect" });
    }

    //buat payload
    const payload = {
      id: rows[0].id,
      email: rows[0].email,
      password: rows[0].password,
    };

    //buat jwt token
    const token = jwt.sign(payload, 'this-access-token-must-be-put-on-env-in-production', {
      expiresIn: "1h",
    });

    return res.status(200).json({payload, accessToken : token});


  }catch ( error ) {
    console.error(error);
    return res.status(500).send({ message: "Internal server error" });
  }
}
