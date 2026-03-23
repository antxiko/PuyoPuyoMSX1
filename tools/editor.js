#!/usr/bin/env node
// MSX Screen, Tile & Sprite Editor - Standalone portable
const http = require('http');
const fs = require('fs');
const path = require('path');
const { exec } = require('child_process');

const PORT = 8080;
const CWD = process.cwd();

// Read the embedded HTML (works both in pkg snapshot and normal node)
const HTML_DATA = fs.readFileSync(path.join(__dirname, 'screen_editor.html'));

const mimeTypes = {
    '.html': 'text/html', '.js': 'text/javascript', '.css': 'text/css',
    '.png': 'image/png', '.jpg': 'image/jpeg', '.json': 'application/json',
    '.bin': 'application/octet-stream', '.ico': 'image/x-icon'
};

const server = http.createServer((req, res) => {
    if (req.url === '/') {
        res.writeHead(200, { 'Content-Type': 'text/html', 'Cache-Control': 'no-cache' });
        res.end(HTML_DATA);
        return;
    }

    // Serve files relative to CWD (for user-loaded PNGs, JSONs, etc.)
    const filePath = path.resolve(CWD, '.' + req.url);
    if (!filePath.startsWith(CWD)) {
        res.writeHead(403); res.end('Forbidden'); return;
    }
    try {
        const data = fs.readFileSync(filePath);
        const ext = path.extname(filePath).toLowerCase();
        res.writeHead(200, { 'Content-Type': mimeTypes[ext] || 'application/octet-stream', 'Cache-Control': 'no-cache' });
        res.end(data);
    } catch (e) {
        res.writeHead(404); res.end('Not found: ' + req.url);
    }
});

server.listen(PORT, () => {
    const url = `http://localhost:${PORT}`;
    console.log('');
    console.log('  MSX Screen, Tile & Sprite Editor');
    console.log('  ' + url);
    console.log('');
    console.log('  Close this window to stop.');
    console.log('');

    const cmd = process.platform === 'win32' ? 'start' :
                process.platform === 'darwin' ? 'open' : 'xdg-open';
    exec(`${cmd} ${url}`);
});
