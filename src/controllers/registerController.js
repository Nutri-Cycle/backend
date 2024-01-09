const db = require('../../conf/dbConnection').promise();

exports.register = async (req, res, next) => {
  console.log(req.body);
  
}
