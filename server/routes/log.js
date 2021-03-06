import express from 'express';
import moment from "moment";
import { v4 as uuidv4 } from 'uuid';
import runQuery from "../databaseConnection";
var router = express.Router();

/* GET users listing. */
router.get('/', async function(req, res, next) {
  const data = await runQuery(`SELECT log.action, log.createdAt, user.username FROM log Inner join user on log.userID = user.id ORDER BY log.createdAt DESC`);
  res.send({ data: data });
});
router.post("/", async function (req, res, next) {
  const {id, userId,action } = req.body;
  if(!userId) res.status(400);
  const CreationDate = moment(new Date()).format('YYYY-MM-DD hh:mm:ss');
  // const id = uuidv4();
  const queryString = `insert into log (id,userID, action,createdAt) values ('${id}','${userId}','${action}','${CreationDate}');`;
  const data = await runQuery(queryString);
  if (data) res.send({ data: data });
  else {
    res.status(500);
  }
});
export default router;
