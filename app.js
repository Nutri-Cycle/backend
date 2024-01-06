const express = require('express');
const app = express();
const port = 3000 || process.env.PORT;


app.get('/', (req, res) => {
  res.status(200);
  res.send('congrats, you just reached the root ');
});


app.listen(PORT, (error) => {
  if(error) {
    console.log(error);
  }

  console.log(`Server is running on port ${PORT}`);
});
