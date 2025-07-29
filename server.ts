import express from 'express';
import compression from 'compression';
import morgan from 'morgan';
import { createRequestHandler } from '@remix-run/express';
const build = require('./build/server/index');// Adjust if your build folder is somewhere else

const app = express();
const PORT = Number(process.env.PORT) || 3000;

app.use(compression());
app.use(morgan('tiny'));

app.use(express.static('public'));

app.all('*', createRequestHandler({ build }));

app.listen(PORT, '0.0.0.0', () => {
  console.log(`🚀 Server is listening on http://localhost:${PORT}`);
});
