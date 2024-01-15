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

This will return a JWT token. put it in the Authorization:BearerTOKEN

#### NearestFood

```http
POST /nearestFood
Content-Type: application/json
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `latitude` | `decimal (9,6)` | the latitude of the user |
| `longitude` | `varchar (9,6)` | the longitude of the user |

returning a nearest food located from user's location

#### NearestRestaurant

```http
POST /nearestRestaurant
Content-Type: application/json
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `latitude` | `decimal (9,6)` | the latitude of the user |
| `longitude` | `varchar (9,6)` | the longitude of the user |

returning a nearest restaurant located from user's location

#### PosyanduDetail

```http
POST /posyanduDetail
Content-Type: application/json
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `latitude` | `decimal (9,6)` | the latitude of the user |
| `longitude` | `varchar (9,6)` | the longitude of the user |

returning a posyandu based on its lat & long

#### DetailSufferers

```http
GET /detailSufferers/{id}
Content-Type: application/json
```

endpoint returns the details of a sufferer with a given ID.



