var express = require("express");

var app = express();

var port = process.env.PORT || 8080;
var color = process.env.COLOR;
var router = express.Router();

router.get("/", function(req, res) {
    res.json({'color': color});
});

app.use("/", router);
app.listen(port, function() {
    console.log("Listening at port 9876")
});