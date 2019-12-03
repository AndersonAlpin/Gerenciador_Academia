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


var $destinatario = 'leonardocamacan@gmail.com';

var mailOptions = {
    from: $usuario,
    to: $destinatario,
    subject: 'Mensalidade paga com sucesso!! ',
    text: 'Tudo certo',
    html: '<img src="logo.png">'

};

transporter.sendMail(mailOptions, function(error, info){
    if (error) {
        console.log(error);
    } else {
        console.log('Email enviado: ' + info.response);
    }
});