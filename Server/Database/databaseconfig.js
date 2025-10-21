const mysql2 = require("mysql2");
const fs = require("fs");
const dotenv = require("dotenv");

dotenv.config();

const dbconnection = mysql2.createPool({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT, // Aiven MySQL port
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  ssl: {
    ca: fs.readFileSync(process.env.DB_CA_PATH), // now reads the correct path
  },
});

module.exports = dbconnection.promise();
