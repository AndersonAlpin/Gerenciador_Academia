const express = require("express");
const router = express.Router();
const adminAut = require("../middlewares/adminAut");
var nodemailer = require('nodemailer');
const Cliente = require("../models/Cliente");
const Mensalidade = require("../models/Mensalidade");

var $usuario = 'academiaprojetoweb@gmail.com';
var $senha = 'Web123321';

var transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: $usuario,
        pass: $senha
    }
});



// ENVIAR EMAIL DE BOAS VINDAS
router.get("/email/send/bemvindo", adminAut, (req, res) => {
    
    var $destinatario = 'andersonalpim@gmail.com';

    var emailBemVindo = ` 
        
    `;

    var mailOptions = {
        from: $usuario,
        to: $destinatario,
        subject: 'Bem-vindo(a)!! ',
        text: 'Bem-vindo',
        html: 'emailBemVindo',
        attachments: [
            {
                filename: 'banner-verao.jpeg',
                path: __dirname + '/banner-verao.jpeg'
            }
        ]
    };

    transporter.sendMail(mailOptions, function (error, info) {

        if (error) {
            console.log(error);
        } else {
            console.log('Email enviado: ' + info.response);
            res.redirect("/administrador/clientes/listar")
        }
    });
});

module.exports = router;