const db = require('../../conf/dbConnection').promise();

exports.nearestFood = async (req, res) => {
  try {
    const { latitude, longitude } = req.body;

    const [results] = await db.execute(`
    SELECT m.id, r.name AS nama_resto, m.name AS nama_makanan, m.price, m.description, m.expired, m.texture, m.food_condition, SQRT( POW(111.2 * (r.latitude - ${latitude}), 2) + POW(111.2 * (${longitude} - r.longitude) * COS(latitude / 57.3), 2) ) AS distance
    FROM menus m
    INNER JOIN restaurant r ON m.restaurant_id = r.id HAVING distance < 10 ORDER BY distance;
    `);

    if (results.length === 0) {
      return res.status(400).send({ message: "No Food Nearby." });
    }
    return res.status(200).json({ message: "Success", output: results });

  } catch (e) {
    console.log(e);
    return res.status(400).send({ message: "Failed to get Nearest Food." });
  }
}

exports.nearestRestaurant = async (req, res) => {
  try {
    const { latitude, longitude } = req.body;

    const [results] = await db.execute(`SELECT name, address, latitude, longitude,
       SQRT(POW(111.2 * (latitude - ${latitude}), 2) +
            POW(111.2 * (${longitude} - longitude) * COS(latitude / 57.3), 2)) AS distance
FROM restaurant HAVING distance < 10 ORDER BY distance;`);

  if (results.length === 0) {
    return res.status(400).send({ message: "No Food Restaurant Nearby." });
  }
  return res.status(200).json({ message: "Success", output: results });
  } catch (e) {
    console.log(e);
    return res.status(400).send({ message: "Failed to get Nearest Restaurant." });
  }
}


