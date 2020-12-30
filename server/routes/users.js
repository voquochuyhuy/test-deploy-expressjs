import express from 'express';
import moment from "moment";
import runQuery from "../databaseConnection";
var router = express.Router();

/* GET users listing. */
router.get('/', async function(req, res, next) {
  const data = await runQuery(`SELECT * FROM log Inner join user on log.userID = user.id`);
  res.send({ data: data });
});
router.post("/", async function (req, res, next) {
  const {  userId,action } = req.body;
  if(!userId) res.status(400);
  const CreationDate = moment(new Date()).format('YYYY-MM-DD hh:mm:ss');
  const queryString = `insert into log values (${userId},${action},${CreationDate})`;
  const data = await runQuery(queryString);
  if (data) res.send({ data: data });
  else {
    res.status(500);
  }
});
export default router;
