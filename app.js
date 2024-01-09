const express = require('express');
const bodyParser = require('body-parser');
const routes = require('./src/routes/route');
const app = express();
const database = require('./conf/dbConnection');


app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use((err, req, res, next) => {
  err.statusCode = err.statusCode || 500;
  err.message = err.message || "Internal Server Error";
  res.status(err.statusCode).json({
      message: err.message,
  });
});

app.get('/', (req, res) => {
  res.status(200);
  res.send('congrats, you found the root of the server!');
});

const PORT = 8000 || process.env.PORT;
app.listen(PORT, (error) => {
  if(error) console.log(error);

  console.log(`Server is running on http://localhost:${PORT}`);
});
