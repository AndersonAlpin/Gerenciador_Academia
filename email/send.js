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
    html: '<h1 style="color: blue; ">Olá, identificamos o pagamento refente ao mês de Dezembro. OBRIGADO!!!!!</h1>'

};

transporter.sendMail(mailOptions, function(error, info){
    if (error) {
        console.log(error);
    } else {
        console.log('Email enviado: ' + info.response);
    }
});