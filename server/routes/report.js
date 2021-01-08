import express from 'express';
import moment from "moment";
import { v4 as uuidv4 } from 'uuid';
import runQuery from "../databaseConnection";
var router = express.Router();

/* GET users listing. */
router.get('/', async function(req, res, next) {
  const data = await runQuery(`SELECT * FROM report Inner join question on report.postID = question.id innner join user on question.userID = user.id`);
  res.send({ data: data });
});
router.post("/", async function (req, res, next) {
  const { id,userID,postID,message } = req.body;
  if(!userID) res.status(400);
  const CreationDate = moment(new Date()).format('YYYY-MM-DD hh:mm:ss');
  // const id = uuidv4();
  const queryString = `insert into report (id,userID,postID, message,createdAt) values ('${id}','${userID}','${postID}','${message}','${CreationDate}');`;
  const data = await runQuery(queryString);
  if (data) res.send({ data: data });
  else {
    res.status(500);
  }
});
export default router;
