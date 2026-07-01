import http from 'http';

let astroHandler;

// Dynamically import Astro's ES Module handler
import('./dist/server/entry.mjs')
  .then((module) => {
    astroHandler = module.handler;
    console.log('Astro handler loaded successfully.');
  })
  .catch((err) => {
    console.error('Error loading Astro handler:', err);
  });

const server = http.createServer((req, res) => {
  if (astroHandler) {
    astroHandler(req, res);
  } else {
    res.writeHead(503, { 'Content-Type': 'text/plain' });
    res.end('Web application is starting up, please refresh in a moment...');
  }
});

// Phusion Passenger will pass the port/pipe via process.env.PORT
const port = process.env.PORT || 4321;
server.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
