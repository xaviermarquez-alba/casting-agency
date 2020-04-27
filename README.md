# Casting Agency API

## Getting Started

### Installing Dependencies

- Install Python 3.7 (https://www.python.org/downloads/)

### Setup Virtual Enviroment

its recommend working within a virtual environment, this keeps your dependencies for each project separate and organaized.

```bash
virtualenv -p python3.7 venv
source venv/bin/activate
```

#### Install Dependencies

```bash
pip install -r requirements.txt
```

### Setup Environment Variables
The required ENV variables are can be set runing setup.sh, befor you runing  modify the database conection and name:

```bash
sudo chmod +x setup.sh 
source ./setup.sh
```

## Running the server

Finally to run the server, execute:

```bash
flask run
```

## Endpoints

```
GET '/movies'
GET '/actors'
POST '/movies'
POST '/actors'
POST '/movies/actors'
PATCH '/movies/<int:movie_id>'
PATCH '/actors/<int:actor_id>'
DELETE '/movies/<int:movie_id>'
DELETE '/movies/<int:actor_id>'
```

#### GET '/movies'

- Fetches a list for all available movies
- Request Arguments: None
- Returns:
```
{
 'success': True,               # request status 
 'movies':                      # List of dicts { 'tile', 'release_date' }
}
```

#### GET '/actors'

- Fetches a list for all available actors
- Request Arguments: None
- Returns:
```
{
 'success': True,               # request status 
 'actors':                      # List of dicts { 'name', 'age', 'gender' }
}
```

#### POST '/movies'

- Create a new movie, require the title and release date
- Request Arguments: 
    + title: string
    + release_date: string, date format (YYYY-MM-DD)

- Returns:
```
{
    'success': True,
    'movie_id':                          # ID of the new created movie
}
```

#### POST '/actors'

- Create a new actor, require the name, age and gender
- Request Arguments: 
    + name: string
    + gender: string
    + age: int

- Returns:
```
{
    'success': True,
    'actor_id':                          # ID of the new created actor
}
```

#### POST '/movies/actors'

- Create a new relation movie-actor require the movie and actor id
- Request Arguments: 
    + movie_id: int
    + actor_id: int

- Returns:
```
{
    'success': True,
    'actor_id':                          # ID of the actor
    'movie_id':                          # ID of the movie
}
```

#### PATCH '/movie/movie_id'

- Update the title and/or release date
- Request Arguments:
    + movie_id: int
    + tile: new movie title
    + release_date: new release date

- Returns:
```
{
    'success': True,
    'movie_id':                 # ID of the updated movie
} 
```

#### PATCH '/actors/actor_id'

- Update the name, age, gender of an actor
- Request Arguments:
    + actor_id: int
    + name: string
    + age: int
    + gender: string

- Returns:
```
{
    'success': True,
    'actor_id':                 # ID of the updated actor
} 
```

#### DELETE '/movie/movie_id'

- Delete a movie
- Request Arguments:
    + movie_id: int

- Returns:
```
{
    'success': True,
    'movie_id':                 # ID of the deleted movie
} 
```

#### DELETE '/actors/actor_id'

- Delete an actor
- Request Arguments:
    + actor_id: int

- Returns:
```
{
    'success': True,
    'actor_id':                 # ID of the deleted actor
} 
```


## Testing
First ensure you are working using your created virtual environment then run:
```
python test_app.py
```