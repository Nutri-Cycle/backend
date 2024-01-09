const mysql = require("mysql2");
// const dotenv = require("dotenv").config();

const db = mysql.createConnection({
    host: "localhost",
    database: "nutricycle_api",
    user: "root",
    password: '',
});

db.connect((err) => {
  if (err) {
    console.log("error connecting to db: " + err);
  } else {
    console.log("connected to database !");
  }
})

module.exports = db;
