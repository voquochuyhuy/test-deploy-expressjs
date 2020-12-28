const express = require('express')
const app = express()
const port = 300

app.get('/', (req, res) => {
  res.send('Hello World! dcm')
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})