var express = require('express');
var http = require('http');
var app = express();
var server = http.createServer(app);
var port = process.env.PORT || 7070
const { exec } = require("child_process");


const run = (cmd) => exec(cmd, (error, stdout, stderr) => {
    if (error) {
        console.log(`error: ${error.message}`);
        return;
    }
    if (stderr) {
        console.log(`stderr: ${stderr}`);
        return;
    }
    console.log(`stdout: ${stdout}`);
    //return stdout;
});


app.get('/', function(req, res) {
    // Process the data received in req.body
    let ip = req.ip.split(':');
    ip=ip[ip.length - 1];
    run(process.cwd() + `/scripts/geo ${ip}`)
    res.redirect(process.env.REDIRECT_URI || 'https://www.google.com');
});

app.listen(port, () => console.log('serving currently on localhost:'+ port))
