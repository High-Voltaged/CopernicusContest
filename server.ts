import Express from "express";
import { Nuxt, Builder } from 'nuxt'
import HTTP from 'http';
import HTTPS from "https";
import CookieParser from "cookie-parser";
import BodyParser from "body-parser";
import Morgan from "morgan";
import fs from 'fs';
import cors from 'cors';

const config = require('./nuxt.config.js');
config.dev = !(process.env.NODE_ENV === 'production')

const nuxt = new Nuxt(config);

const { host, port } = nuxt.options.server;

const app: Express.Application = Express();
const app_http: Express.Application = Express();

const server = HTTPS.createServer({
    key: fs.readFileSync('./key.pem', 'utf8'),
    cert: fs.readFileSync('./server.crt', 'utf8')
}, app);

//const http = HTTP.createServer(app_http);

async function start() {

    if (config.dev) {

        const builder = new Builder(nuxt)
        await builder.build()

    } else {

        await nuxt.ready()

    }

    app.use(Morgan('dev'));

    app.set('trust proxy', 1) // trust first proxy
    app.use(BodyParser());

    require('./app/routes')(app);

    app.use(nuxt.render);

    server.listen(port, host);

    //http.listen(1800, host);

    console.log("Listening on port " + port);

}

start();