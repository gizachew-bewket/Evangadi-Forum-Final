import fs from "fs";
import mysql from "mysql2/promise";
import dotenv from "dotenv";

dotenv.config();

const DB_HOST = process.env.DB_HOST;
const DB_USER = process.env.DB_USER;
const DB_PASSWORD = process.env.DB_PASSWORD;
const DB_NAME = process.env.DB_NAME;
const DB_PORT = process.env.DB_PORT;

async function importSQL() {
  try {
    const sqlFilePath = "./evangadi-forum-db.sql";
    const sql = fs.readFileSync(sqlFilePath, "utf8");

    const connection = await mysql.createConnection({
      host: DB_HOST,
      user: DB_USER,
      password: DB_PASSWORD,
      database: DB_NAME,
      port: DB_PORT,
      multipleStatements: true, // Allows executing multiple queries at once
    });

    console.log("Disabling foreign key checks...");
    await connection.query("SET FOREIGN_KEY_CHECKS = 0;");

    console.log("Dropping existing tables if they exist...");
    await connection.query("DROP TABLE IF EXISTS answers, questions, users;");

    console.log("Importing SQL file...");
    await connection.query(sql);

    console.log("Re-enabling foreign key checks...");
    await connection.query("SET FOREIGN_KEY_CHECKS = 1;");

    console.log("✅ SQL import finished successfully!");
    await connection.end();
  } catch (err) {
    console.error("❌ Error importing SQL:", err);
  }
}

importSQL();
