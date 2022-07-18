const express = require("express");
const app = express();
const path = require("path");
app.use("/dist", express.static(__dirname + "/dist"));

app.listen(3000, () => {
  console.log("server open");
});
