const express = require("express");
const router = express.Router();

router.post("/validarLogin", (req, res) => {
    var email = req.body.email;
    var senha = req.body.senha;
    var teste = 'email_invalido';
    console.log(email, senha);
   
    if(email == "kkk@gmail.com"){
        
        res.redirect("administrador");
        
    } else{ 
        document.getElementById('validar').innerHTML="senha inválida"
        res.redirect("index");
        
    }
});


module.exports = router;