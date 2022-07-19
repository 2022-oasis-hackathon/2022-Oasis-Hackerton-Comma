const express = require("express");
const app = express();
const path = require("path");
app.use("/CommaWebView/dist", express.static(__dirname + "/dist"));

app.listen(5500, () => {
  console.log("server open");
});
