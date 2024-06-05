import { configDotenv } from 'dotenv';
import express from 'express';
import cors from 'cors';
import compression from 'compression';
import cookieParser from 'cookie-parser';
import bodyParser from 'body-parser';
import http from 'http';
import listRoutes from 'express-list-routes';
import apiroutes from './routes/api';



require('express-resource');

configDotenv();

const app = express();

app.use(cors({
    credentials: true
}));

app.use(compression());
app.use(cookieParser());
app.use(bodyParser.json());


const HOST = process.env.HOST || "0.0.0.0";
const PORT = parseInt(<string>process.env.PORT) || 3000;
const LIST_ROUTES = process.env.LIST_ROUTES == "TRUE" || false;



app.get('/', (req, res, next) => {
    res.sendStatus(200);
});
app.use('/api', apiroutes)

app.get('*', (req, res) => {
    res.sendStatus(404);
})

if (LIST_ROUTES) {
    console.log("General Routes:");
    listRoutes(app);

    console.log("API Routes:")
    listRoutes(apiroutes);
}

const server = http.createServer(app);
server.listen(PORT, HOST, async () => {
    console.log(`🚀 Server running on http://${HOST}:${PORT}/`)
});

