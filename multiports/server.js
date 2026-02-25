const http = require('http');
const ports = [3000, 4000];
ports.forEach(port => {
  const server = http.createServer((req, res) => {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end(`Hello from Node.js! You hit port ${port}\n`);
  });

  server.listen(port, '0.0.0.0', () => {
    console.log(`Server listening on port ${port}`);
  });
});