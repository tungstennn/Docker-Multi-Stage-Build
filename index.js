const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.json({ message: "docker is easy" });
});
const port = 3000;
app.listen(port, () => {
  console.log(`app is listening at port ${port}`);
});