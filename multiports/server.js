const http = require('http');

// Create the server once
const server = http.createServer((req, res) => {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end(`Hello from Node.js! You hit ${req.socket.localPort}\n`);
});

// List of ports to listen on
const ports = [3000, 4000];

ports.forEach(port => {
  server.listen(port, '0.0.0.0', () => {
    console.log(`Server listening on port ${port}`);
  });
});
