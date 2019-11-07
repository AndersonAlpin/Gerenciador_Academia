const express = require("express");
const router = express.Router();

router.get("/relatorio", (req, res) => {
    res.render("relatorio");
});

module.exports = router;