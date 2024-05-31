const express = require("express");
const resource = require("express-resource");
const app = express();

// Routes
const users = require("./routes/users");
const main = require("./routes/main");

// Resource Mapper
app.resource(main);
app.resource("users", users);

app.listen(3000);
