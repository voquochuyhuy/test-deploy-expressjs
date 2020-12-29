import express from 'express';
import runQuery from "../databaseConnection";
var router = express.Router();

/* GET users listing. */
router.get('/', async function(req, res, next) {
  const data = await runQuery(`SELECT * FROM log Inner join user on log.userID = user.id`);
  res.send({ data: data });
});

export default router;
