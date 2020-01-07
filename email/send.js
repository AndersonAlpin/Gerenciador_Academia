var nodemailer = require('nodemailer');

let transporter = nodemailer.createTransport({
    host: "smtp.gmail.com",
    port: 587,
    secure: false,
    auth: {
        user: "startupinnovation2020@gmail.com",
        pass: "20Inno20vation"
    }
});

// transporter.sendMail({
//     from: "Academia IronFit <academiaprojetoweb@gmail.com>",
//     to: "anderalpin@gmail.com",
//     subject: "Este é um email de teste",
//     text: "Esse é um email de teste novamente",
//     html: "Esse é um email de teste mais uma vez",
//     attachments: [
//         {
//             filename: 'bemvindo.jpg',
//             path: __dirname + '/bemvindo.jpg'
//         }
//     ]
// }).then(message => {
//     console.log(message);
// }).catch(err => {
//     console.log(err);
// });


module.exports = {

    enviarLink: function (email) {
        transporter.sendMail({
            from: "Sublime <startupinnovation2020@gmail.com>",
            to: email,
            subject: "Link de Recuperação de Senha",
            text: "",
            html: `
                <h2>Para alterar sua senha, acesse o link abaixo, o link expira em 10 minutos.</h2>
                <a href="http://sublimemanager-com-br.umbler.net/administrador/password/reset">Alterar senha</a>
            `
        }).then(message => {
            console.log(message);
        }).catch(err => {
            console.log(err);
        });
    }

}