# Use uma imagem base oficial do Node.js
FROM node:20-slim

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie os arquivos package.json e package-lock.json para o diretório de trabalho
COPY package*.json ./

# Instale as dependências do projeto, incluindo pm2
RUN npm install

# Instale pm2 globalmente para que ele esteja disponível no contêiner
RUN npm install -g pm2

# Copie todo o código-fonte da aplicação para o diretório de trabalho
COPY . .

# Exponha a porta em que a aplicação Node.js irá rodar
EXPOSE 3000

# Comando para iniciar a aplicação usando pm2
# pm2 start index.js --no-daemon garante que o pm2 não rode em background
# e que o contêiner permaneça em execução.
CMD [ "pm2-runtime", "start", "index.js", "--name", "my-node-app" ]