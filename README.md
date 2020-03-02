# Koroibos

## Core Contributors

- [David Lopez](https://github.com/Not-Zorro)

## Tech Stack

- Ruby _Version 2.5.0_
- Rails _Version 5.2.4.1_

### Setup

```
git clone git@github.com:Not-Zorro/koroibos.git

cd koroibos

bundle install

rails db:create; rails db:migrate

# IMPORTS DATA INTO DB
rake add_data:csv_to_db
```

#### Schema

![Schema](https://user-images.githubusercontent.com/43835133/75699043-a8d44980-5ca7-11ea-9167-322f7fc307a9.png)

## Running Tests

`bundle exec rspec`

## Running the Application

`rails server`

## Documentation

### All endpoints go off of:

```
Development:
http://localhost:3000/api/v1/

Production:
https://desolate-fjord-29708.herokuapp.com/api/v1/
```

* `GET /olympians`

```
{
  "olympians":
    [
      {
        "name": "Maha Abdalsalam",
        "team": "Egypt",
        "age": 18,
        "sport": "Diving"
        "total_medals_won": 0
      },
      {
        "name": "Ahmad Abughaush",
        "team": "Jordan",
        "age": 20,
        "sport": "Taekwondo"
        "total_medals_won": 1
      },
      {...}
    ]
}
```

* `GET /olympians?age=youngest`

```
{
  "olympians":
    [
      {
        "name": "Ana Iulia Dascl",
        "team": "Romania",
        "age": 13,
        "sport": "Swimming"
        "total_medals_won": 0
      }
    ]
}
```

* `GET /olympians?age=oldest`

```
{
  "olympians":
    [
      {
        "name": "Julie Brougham",
        "team": "New Zealand",
        "age": 62,
        "sport": "Equestrianism"
        "total_medals_won": 0
      }
    ]
}
```

* `GET /olympian_stats`

```
  {
    "olympian_stats": {
      "total_competing_olympians": 3120
      "average_weight:" {
        "unit": "kg",
        "male_olympians": 75.4,
        "female_olympians": 70.2
      }
      "average_age:" 26.2
    }
  }
```

* `GET /events`

```
{
  "events":
    [
      {
        "sport": "Archery",
        "events": [
          "Archery Men's Individual",
          "Archery Men's Team",
          "Archery Women's Individual",
          "Archery Women's Team"
        ]
      },
      {
        "sport": "Badminton",
        "events": [
          "Badminton Men's Doubles",
          "Badminton Men's Singles",
          "Badminton Women's Doubles",
          "Badminton Women's Singles",
          "Badminton Mixed Doubles"
        ]
      },
      {...}
    ]
}
```

* `GET /events/:id/medalists`

```
{
  "event": "Badminton Mixed Doubles",
  "medalists": [
      {
        "name": "Tontowi Ahmad",
        "team": "Indonesia-1",
        "age": 29,
        "medal": "Gold"
      },
      {
        "name": "Chan Peng Soon",
        "team": "Malaysia",
        "age": 28,
        "medal": "Silver"
      }
    ]
}
```
