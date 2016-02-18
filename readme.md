# Get Feedback - Customer Succes data in POGO

1. Clone this repo

2. Download [Pogocore](http://pogostack.com/pogocore-1.3.18.zip) and unzip into directory

3. Set up database

  - In a terminal window first run `psql` then the below:

```plpgsql
create database feedback;
alter database feedback owner test;
\password test
```
    
- Enter password here, which is "test"

- Run `\c feedback test ; \i path/to/feedback_db_002.sql`


## Running / Developing the app

- Make sure Postgres is running.

- Compile all files

Windows: `compile-all.bat`.

Mac: `./compile-all.sh`.


To get the server going run the following in a new terminal window.

Mac: `export GOPATH=~/gocode ; go run ../pogocore/pogo_server.go`.

Windows: `set GOPATH=c:/Go/gocode ; go run ../pogocore/pogo_server.go`

Go to [localhost:4200](localhost:4200)

## Tasks

1. Show response time
2. List top 5 performing in order
3. Bottom 5 average question type wise
4. Add a piece of feedback