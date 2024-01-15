const db = require('../../conf/dbConnection').promise();

exports.sufferers = async (req, res) => {
  try {
    const { id } = req.params;
    const [results] = await db.execute(`SELECT * FROM donation_target WHERE id = ${id}`);

    if (results.length === 0) {
      return res.status(400).send({ message: "No Sufferers." });
    }

    return res.status(200).json({ message: "Success", output: results });
  } catch (e) {
    console.log(e);
    return res.status(400).send({ message: "Failed to get Sufferers." });
  }
}

exports.posyanduDetail = async (req, res) => {
  try {

    const {latitude, longitude} = req.body;
    
    const [results] = await db.execute(`SELECT donation_target.id, posyandus.name AS nama_posyandu, posyandus.address, posyandus.sufferer, donation_target.name AS penerima_donasi, donation_target.weight, donation_target.height, motor_delays.motor_delay, SQRT( POW(111.2 * (posyandus.latitude - ${latitude}), 2) + POW(111.2 * (${longitude} - posyandus.longitude) * COS(posyandus.latitude / 57.3), 2) ) AS distance
    FROM donation_target
    JOIN posyandus ON donation_target.posyandu_id = posyandus.id
    JOIN motor_delays ON donation_target.motor_delay_id = motor_delays.id;
    `);

    if (results.length === 0) {
      return res.status(400).send({ message: "No Posyandu." });
    }

    return res.status(200).json({ message: "Success", output: results });
  } catch (e) {
    console.log(e);
    return res.status(400).send({ message: "Failed to get Posyandu." });
  }
}
