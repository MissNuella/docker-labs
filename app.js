//version 2

// Import the built-in http module to create a web server
const http = require('http');

// Import the built-in os module to get the container hostname
const os = require('os');

const PORT = 3000;

// process.getuid() returns the numeric user ID of the process running this app.
// Inside a Docker container, if no USER is set in the Dockerfile,
// this will be 0, which means root.
const uid = process.getuid();
const username = uid === 0 ? 'root -- DANGER' : `non-root (uid: ${uid})`;

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end(
    `App is running\n` +
    `User ID : ${uid}\n` +
    `Running as : ${username}\n` +
    `Hostname : ${os.hostname()}\n`
  );
});

server.listen(PORT, () => {
  console.log(`Server started on port ${PORT}`);
  console.log(`User ID inside container : ${uid}`);
  console.log(`Running as : ${username}`);
});
