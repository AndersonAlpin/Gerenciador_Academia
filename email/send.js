const express = require("express");
const router = express.Router();
const adminAut = require("../middlewares/adminAut");
var nodemailer = require('nodemailer');

var $usuario = 'academiaprojetoweb@gmail.com';
var $senha = 'Web123321';

var transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: $usuario,
        pass: $senha
    }
});


// EXPORTANDO AS FUNÇÕES DE ENVIAR EMAIL
module.exports = {

    bemvindo: function (email, nome, sobrenome) {
        var $destinatario = email;

        var mailOptions = {
            from: $usuario,
            to: $destinatario,
            subject: 'Academia IronFit',
            text: 'Bem-vindo(a) ' + nome + ' ' + sobrenome,
            html: '',
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
            }
        });
    }

}