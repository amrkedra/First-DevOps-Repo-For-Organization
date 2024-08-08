const express = require('express');
const { MongoClient, ObjectId } = require('mongodb');
const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const uri = 'mongodb://mongodb-service:85';
const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true });

let collection;

client.connect().then(() => {
  const db = client.db('testdb');
  collection = db.collection('testcollection');
  console.log('Connected to MongoDB');
}).catch(err => console.error('Failed to connect to MongoDB', err));

// Serve the HTML page
app.get('/', (req, res) => {
  res.send(`
    <html>
      <head>
        <title>MongoDB CRUD Operations</title>
      </head>
      <body>
        <h1>MongoDB CRUD Operations</h1>
        <form action="/create" method="POST">
          <input type="text" name="name" placeholder="Enter name">
          <button type="submit">Create</button>
        </form>
        <br/>
        <form action="/read" method="GET">
          <button type="submit">Read All</button>
        </form>
        <br/>
        <form action="/update" method="POST">
          <input type="text" name="id" placeholder="Enter ID">
          <input type="text" name="name" placeholder="Enter new name">
          <button type="submit">Update</button>
        </form>
        <br/>
        <form action="/delete" method="POST">
          <input type="text" name="id" placeholder="Enter ID">
          <button type="submit">Delete</button>
        </form>
      </body>
    </html>
  `);
});

// Create operation
app.post('/create', async (req, res) => {
  try {
    const result = await collection.insertOne({ name: req.body.name });
    res.send('Document inserted with ID: ' + result.insertedId);
  } catch (err) {
    res.status(500).send(err);
  }
});

// Read operation
app.get('/read', async (req, res) => {
  try {
    const data = await collection.find({}).toArray();
    res.send(data);
  } catch (err) {
    res.status(500).send(err);
  }
});

// Update operation
app.post('/update', async (req, res) => {
  try {
    const { id, name } = req.body;
    const result = await collection.updateOne({ _id: new ObjectId(id) }, { $set: { name: name } });
    res.send(result.modifiedCount > 0 ? 'Document updated' : 'No document found');
  } catch (err) {
    res.status(500).send(err);
  }
});

// Delete operation
app.post('/delete', async (req, res) => {
  try {
    const { id } = req.body;
    const result = await collection.deleteOne({ _id: new ObjectId(id) });
    res.send(result.deletedCount > 0 ? 'Document deleted' : 'No document found');
  } catch (err) {
    res.status(500).send(err);
  }
});

// Listen on port 2717
app.listen(2717, () => {
  console.log('Server is running on port 2717');
});
