const router = require('express').Router();
const { register } = require('../controllers/registerController');
const { login } = require('../controllers/loginController');
const { order, donate } = require('../controllers/checkoutController');

router.post('/register', register);
router.post('/login', login);
router.post('/order', order);

module.exports = router;
