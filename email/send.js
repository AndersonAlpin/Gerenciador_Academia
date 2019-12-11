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
                    filename: 'bemvindo.jpg',
                    path: __dirname + '/bemvindo.jpg'
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
    },

    sendCode: function () {
        var $destinatario = email;
        var codigo = Math.floor(Math.random() * 65536);

        var mailOptions = {
            from: $usuario,
            to: $destinatario,
            subject: 'Academia IronFit - Recuperar senha',
            text: 'Esse é o seu código de recuperação: ' + codigo,
            html: ''
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