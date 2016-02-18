# Get Feedback - Customer Succes data in POGO

1. Clone this repo

2. Download [Pogocore](http://pogostack.com/pogocore-1.3.18.zip) and put into directory

3. Set up database

  - In a terminal window first run `psql` then the below:

```plpgsql
create database feedback;
alter database feedback owner test;
\password test
```
    
- Enter password here, which is "test"

- Run `\c feedback test ; \i path/to/dump/dump_2015...sql`


## Running / Developing the app

- Make sure Postgres is running.

- Update your database with: `\c feedback test ; \i path/to/dump/dump_2015...sql`

- In a new terminal window go to the directory with the app in: `cd path/to/pogocore`
