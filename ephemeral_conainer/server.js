const http = require("http");

// Set the port
const PORT = 3000;
const HOST = "0.0.0.0"
const server = http.createServer((req, res) => {
  res.writeHead(200, { "Content-Type": "text/plain" });
  res.end("Hello World from Node.js Distroless\n");
});

server.listen(PORT, HOST, () => {
  console.log(`Server running at http://${HOST}:${PORT}`);
});

