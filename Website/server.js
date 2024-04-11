const express = require('express');
const http = require('http');
const socketIo = require('socket.io');

const app = express();
const server = http.createServer(app);
const io = socketIo(server);

// Serveur HTTP
app.use(express.static('public'));

app.get('/', (req, res) => {
    res.sendFile(__dirname + '/user.html'); // Envoyer le fichier HTML principal
});

// Gestion des connexions Socket.io
io.on('connection', (socket) => {
    console.log('New user connected');

    // Réception et diffusion des messages
    socket.on('chatMessage', (message) => {
        io.emit('chatMessage', message);
    });

    // Déconnexion de l'utilisateur
    socket.on('disconnect', () => {
        console.log('User disconnected');
    });
});

// Démarrage du serveur
const PORT = process.env.PORT || 3000;
server.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});