const express = require("express");
const router = express.Router();
const Pacote = require("../models/Pacote")

router.get("/administrador/pacotes/listar", (req, res) => {
    Pacote.findAll({force: true}).then(pacotes => {
        res.render("administrador/pacotes/listar", {pacotes: pacotes});
    });
});

router.get("/administrador/pacotes/cadastro", (req, res) => {
    res.render("administrador/pacotes/cadastro")
});

router.post("/pacotes/salvar", (req, res) => {
    
});

router.post("/pacotes/delete", (req, res) => {
    var id = req.body.id;
    if(id != undefined){ //SE FOR DIFERENTE DE NULO
        if(!isNaN(id)){ //SE FOR UM NÚMERO  
            
            Pacote.destroy({
                where: {
                    id: id
                }
            }).then(() => {
                res.redirect("/administrador/pacotes/listar");
            })

        }else{
            res.redirect("/administrador/pacotes/listar");
        }
    }else{
        res.redirect("/administrador/pacotes/listar");
    }
})

module.exports = router;