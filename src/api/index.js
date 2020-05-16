const express = require('express');
const app = express();
const bodyparser = require("body-parser");
const cors = require("cors");
const mysql = require('mysql2/promise');
const fs = require('fs');

const port = 5005;
app.use(cors());
app.use(bodyparser.urlencoded({ extended: false }))
app.use(bodyparser.json())
// app.use(express.static('public'));


app.get('/api/users', async function(req, res){
    const con = await get_sql();
    const [users, fields] = await con.query("SELECT username FROM orbiteer.users");
    con.end();
    res.send(users);
});

const get_sql = async () => await mysql.createConnection({
    host: process.env.DB_HOST || 'orbiteer-database', 
    port: 3306, 
    user: 'root', 
    database: process.env.DB_NAME || 'orbiteer', 
    multipleStatements: true
}); 

const init_db = async () => {
    console.log("checking if db has initialized....");
    try {
        const connection = await get_sql();
        connection.end();
        console.log("db is up, schema has been initialized")
    }
    catch(e) {
        if (e.code === 'ER_BAD_DB_ERROR') {
            console.log("db is up! creating schema");
            let sql = fs.readFileSync('/application/db_structure.sql').toString();
            const connection = await mysql.createConnection({
                host: process.env.DB_HOST || 'orbiteer-database', 
                port: 3306, 
                user: 'root', 
                multipleStatements: true
            });
            connection.query(sql);
            console.log(sql);
            connection.end();
        } else {
            console.log("db not up: " + e.code);
            setTimeout(init_db, 5000);
        }
    }
}

app.listen(port, async () => {
    init_db();
    console.log(`Your server is started: http://localhost:${port}`);
});