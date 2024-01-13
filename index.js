import express from 'express';
import { createClient } from '@libsql/client';
import 'dotenv/config';

const PORT = process.env.PORT || 3000;

const client = createClient({
  url: 'file:./local-db.db',
  syncUrl: process.env.TURSO_URL,
  authToken: process.env.TURSO_AUTH_TOKEN,
});

async function getUsers() {
  try {
    const rs = await client.execute('select * from examples_users');
    return rs.rows;
  } catch (e) {
    console.error(e);
    return [];
  }
}

const app = express();

app.get('/', (_, res) => {
  res.json({
    success: true
  })
});

app.get('/users', async (_, res) => {
  const rs = await getUsers();
  res.json(rs);
});

app.listen(PORT, '0.0.0.0', async () => {
  await client.sync();
  console.log(`Server listening on port, ${PORT}`)
})
