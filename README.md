# The Backbone of Nutricycle App.


## API Reference

#### Register

```http
POST /register
Content-Type: application/json
```


| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `username` | `varchar` | **Required**. |
| `email` | `varchar` | **Required**. |
| `password` | `varchar` | **Required**. |

#### Login

```http
POST /login
Content-Type: application/json
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `email` | `varchar` | **Required**. |
| `password` | `varchar` | **Required**. |

This will return a JWT token. put it in the Authorization:Bearer<token>

#### Order

```http
POST /order
Content-Type: application/json
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `user_id` | `INT` | the id of an user that are making an order |
| `restaurant_id` | `INT` | the id of a restaurant that are processing an order |
| `menu_ids` | `ARRAY` | this parameter accepts array as an input, using the id of the items from the restaurant. |
| `status_ids` | `INT` | **UNDER DEVELOPMENT**. |
| `payment_id` | `INT` | **UNDER DEVELOPMENT**.this parameter is currently on testing mode, hence we only accept 3 types of parameter 1 for Dana 2 for OVO 3 for Gopay |
| `delivery_id` | `INT` | **UNDER DEVELOPMENT**.this parameter is currently on testing mode, hence we only accept 3 types of parameter 1 for Maxim 2 for Gojek 3 for Grab |
| `total` | `varchar` | the front end needs to query the price of the menu_ids and calculated before send it to total (or the be will process it but not now tehee) |



