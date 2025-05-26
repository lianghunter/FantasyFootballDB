import dotenv from 'dotenv';
import express from 'express';
import path from 'path';
import { fileURLToPath } from 'url';
import knex from 'knex';
import { generateSQL } from './pipeline.js';

dotenv.config();

// Resolve paths for relative DB file
const filename = fileURLToPath(import.meta.url);
const dirname = path.dirname(filename);

// Use DB path from .env or default to ./db/league.db
const dbFile = process.env.DB_FILE || './db/league.db';
const dbPath = path.isAbsolute(dbFile)
  ? dbFile
  : path.resolve(dirname, '..', dbFile);

// Connect to SQLite database using Knex
const db = knex({
  client: 'sqlite3',
  connection: {
    filename: dbPath,
  },
  useNullAsDefault: true,
});

const app = express();
app.use(express.json());
app.use(express.static(path.resolve('../frontend/src')));


// Health check route
app.get('/test-db', async (req, res) => {
  try {
    const data = await db.select('*').from('FootballPlayer').limit(5);
    res.json({ success: true, data });
  } catch (err) {
    console.error('Test DB error:', err);
    res.status(500).json({ success: false, error: err.message });
  }
});

// Core AI SQL endpoint
app.post('/api/chat', async (req, res) => {
  const { question } = req.body;

  if (!question) {
    return res.status(400).json({ error: 'Request body must include a "question" field.' });
  }

  try {
    const sql = await generateSQL(question);

    // Return plain response if it's not SQL
    if (!/^(SELECT|INSERT|UPDATE|DELETE|WITH)\b/i.test(sql)) {
      return res.json({ answer: sql });
    }

    const result = await db.raw(sql);
    res.json({ sql, rows: result });
  } catch (err) {
    console.error('Chat error:', err);
    res.status(500).json({ error: err.message });
  }
});

const port = parseInt(process.env.PORT, 10) || 3000;
app.listen(port, () => {
  console.log(`🚀 Server listening at http://localhost:${port}`);
});
