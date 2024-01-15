const router = require('express').Router();
const { register } = require('../controllers/registerController');
const { login } = require('../controllers/loginController');
const { nearestFood, nearestRestaurant } = require('../controllers/restaurantController');
const { sufferers, posyanduDetail } = require('../controllers/posyanduController');
const { search } = require('../controllers/searchController');

router.post('/register', register);

router.post('/login', login);

router.post('/nearestFood', nearestFood);

router.post('/nearestRestaurant', nearestRestaurant);

router.get('/detailSufferers/:id', sufferers);

router.post('/posyanduDetail', posyanduDetail);

router.get('/api/search', search);

// router.post('/order', order);

module.exports = router;
