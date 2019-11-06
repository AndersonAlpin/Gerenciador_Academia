const express = require("express");
const router = express.Router();

router.get("/mensalidade", (req, res) => {
    res.render("mensalidade");
});

module.exports = router;