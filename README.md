**About this project**

This project is a very simple data pipeline that connects to Postgres and then streams changes to Kafka via Debezium (which is built on top of Kafka Connect).
You'll need:
- Docker
- A database tool to connect to Postgres - I recommend [DBeaver](https://dbeaver.io/download/)

**To run**

- Clone this repo. 
- In the root directory, run `docker-compose up`.
- Configure DBeaver like this (password is "password" - see source-connector.json for connection details):
![image](https://user-images.githubusercontent.com/51458420/118000471-74c4d180-b30b-11eb-8ea3-82c33ecabee3.png)
- Run the `CREATE TABLE` statement in `setup-table.sql`. 
- Add the Kafka Connect connector: `curl -X POST -H "Content-Type: application/json" --data @pg-source-connector.json http://localhost:8083/connectors`

**To use**

- Open http://localhost:4001 in your browser and see AKHQ - it should be showing information about your Kafka cluster. 
- Using DBeaver, open the db `test-db`  and the table `etltest` and create a new row. Only edit the `editme` field.
- You should be able to see events coming into your kafka topic named `etltest` via the AKHQ UI every time you add, remove, or edit a row in your DB.
