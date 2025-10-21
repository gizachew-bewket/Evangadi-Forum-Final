const express = require("express");
const cors = require("cors");
const dotenv = require("dotenv");

dotenv.config();

const app = express();
const PORT = process.env.PORT || 5173;

app.use(express.json());

app.use(
  cors({
    origin: ["http://localhost:5173", "http://localhost:5174"], // multiple allowed
    credentials: true,
  })
);

// Database connection
const dbconnection = require("./Database/databaseconfig");

// Routes
const userRoutes = require("./routes/userroutes");
app.use("/api/user", userRoutes);

const questionRoutes = require("./routes/questionRoute");
app.use("/api/question", questionRoutes);

const answerRoutes = require("./routes/answerRoute");
app.use("/api/answer", answerRoutes);

// Start server & test DB connection
async function start() {
  try {
    await dbconnection;
    console.log("✅ Connected to Aiven MySQL database!");

    app.listen(PORT, () => console.log(`🚀 Server is running on port ${PORT}`));
  } catch (error) {
    console.error("❌ DB connection failed:", error.message);
  }
}

start();
