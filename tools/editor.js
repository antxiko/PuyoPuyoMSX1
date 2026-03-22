#!/usr/bin/env node
// MSX Screen & Tile Editor - Standalone launcher
// Usage: node tools/editor.js

const http = require('http');
const fs = require('fs');
const path = require('path');
const { exec } = require('child_process');

const PORT = 8080;
const ROOT = path.resolve(__dirname, '..');

const mimeTypes = {
    '.html': 'text/html',
    '.js': 'text/javascript',
    '.css': 'text/css',
    '.png': 'image/png',
    '.jpg': 'image/jpeg',
    '.json': 'application/json',
    '.bin': 'application/octet-stream',
    '.ico': 'image/x-icon'
};

const server = http.createServer((req, res) => {
    let filePath = path.join(ROOT, req.url === '/' ? 'tools/screen_editor.html' : req.url);

    // Security: prevent directory traversal
    if (!filePath.startsWith(ROOT)) {
        res.writeHead(403);
        res.end('Forbidden');
        return;
    }

    try {
        const data = fs.readFileSync(filePath);
        const ext = path.extname(filePath).toLowerCase();
        res.writeHead(200, {
            'Content-Type': mimeTypes[ext] || 'application/octet-stream',
            'Cache-Control': 'no-cache'
        });
        res.end(data);
    } catch (e) {
        res.writeHead(404);
        res.end('Not found: ' + req.url);
    }
});

server.listen(PORT, () => {
    const url = `http://localhost:${PORT}`;
    console.log(`MSX Screen & Tile Editor running at ${url}`);
    console.log('Press Ctrl+C to stop\n');

    // Open browser
    const cmd = process.platform === 'win32' ? 'start' :
                process.platform === 'darwin' ? 'open' : 'xdg-open';
    exec(`${cmd} ${url}`);
});
