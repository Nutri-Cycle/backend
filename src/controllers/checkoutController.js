const db = require('../../conf/dbConnection').promise();

async function checkId(table, id) {
  const result = await db.execute(`SELECT * FROM ${table} WHERE id = ?`, [id]);
  return result[0].length > 0;
}

exports.order = async (req, res) => {
  try {
    //ambil input yg dibutuhkan dari body
    const { user_id, restaurant_id, menu_ids, status_id, payment_id, delivery_id, total } = req.body;

    //check apakah user_id, restaurant_id, menu_id, status_id, payment_id, delivery_id ada di database
    const checks = [
      { table: 'users', id: user_id },
      { table: 'restaurant', id: restaurant_id },
      { table: 'statuses', id: status_id },
      { table: 'payments', id: payment_id },
      { table: 'deliveries', id: delivery_id }
    ];

    for (let menu_id of menu_ids) {
      checks.push({ table: 'menus', id: menu_id });
    }

    const results = await Promise.all(checks.map(check => checkId(check.table, check.id)));

    for (let i = 0; i < results.length; i++) {
      if (!results[i]) {
        return res.status(400).send({ message: `No record found for id = ${checks[i].id} in ${checks[i].table}` });
      }
    }

    let orderCreated = false;

    if (menu_ids.length > 1) {
      menu_ids.forEach(menu => {
        db.execute('INSERT INTO `orders` (user_id, restaurant_id, menu_id, status_id, payment_id, delivery_id, total) VALUES (?, ?, ?, ?, ?, ?, ?)', [user_id, restaurant_id, menu, status_id, payment_id, delivery_id, total]);
      });
    } else {
      db.execute('INSERT INTO `orders` (user_id, restaurant_id, menu_id, status_id, payment_id, delivery_id, total) VALUES (?, ?, ?, ?, ?, ?, ?)', [user_id, restaurant_id, menu_ids[0], status_id, payment_id, delivery_id, total]);
    }

    // Check if the order was successfully created
    db.query('SELECT * FROM `orders` WHERE `user_id` = ? AND `restaurant_id` = ? AND `menu_id` IN (?) AND `status_id` = ? AND `payment_id` = ? AND `delivery_id` = ? AND `total` = ?', [user_id, restaurant_id, menu_ids, status_id, payment_id, delivery_id, total], (err, rows) => {
      if (err) {
        console.log(err);
        return res.status(400).send({ message: "Failed to create order." });
      }

      if (rows.length === menu_ids.length && !orderCreated) {
        orderCreated = true;
        return res.status(200).send({ message: "Order successfully created!" });
      } else {
        return res.status(400).send({ message: "Failed to create order." });
      }
    });


  } catch (error) {
    console.error(error);
    return res.status(500).send({ message: "Internal server error", cause: error });
  }
}


exports.donate = async (req, res) => {

}
