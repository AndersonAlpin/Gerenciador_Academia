const express = require("express");
const router = express.Router();

router.get("/pacote", (req, res) => {
    res.render("pacote");
});

module.exports = router;