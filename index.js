import express from 'express';

const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Olá do meu aplicativo Node.js no Google Cloud!');
});

app.get('/health', (req, res) => {
    res.status(200).send('OK');
});

app.listen(port, () => {
    console.log('Aplicativo ouvindo na porta ${port}');
});
