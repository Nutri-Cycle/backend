# The Backbone of Nutricycle App.

![Logo Nutricycle](https://lh3.googleusercontent.com/drive-viewer/AEYmBYQL-NXfdIN88d8iv_kZ0iEj6YJOcXUfEDtF2A7UH1k3o7B6IX26G3QBt2uzdvHZBXIAqMlpAAoL23JVRTQRymrRZPO0CQ=w1920-h945)

NutriCycle, designed to provide a platform to buy and sell leftover food with good quality and provide a platform to donate basic food items to stunted people in need, with an easy-to-use platform to optimize Food Loss and Waste and help in reducing stunting rates in Indonesia to ensure the welfare of the Indonesian people.

# Tim Peduli Stunting - (Nutricycle Apps)

1. **Arrizal Bintang Ramadhan** - Hacker
2. **Nafis Almajid** - Hustler
3. **Daffa Pandu Dewanata** - Hipster
4. **Adit Hernowo** - Hacker

## Authors

- [@Arrizal](https://www.github.com/ArrizalBintangR)

## How to run
1. `git clone https://github.com/Nutri-Cycle/backend.git` in terminal
2. `cd backend`
3. `npm install`
4. `npm run production`

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



