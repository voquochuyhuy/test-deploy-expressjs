import express from 'express';
import moment from "moment";
import { v4 as uuidv4 } from 'uuid';
import runQuery from "../databaseConnection";
var router = express.Router();

/* GET users listing. */
router.get('/question-report', async function(req, res, next) {
  const data = await runQuery(`SELECT report.id,report.targetID,report.senderID,report.message,report.createdAt,question.content,question.id as questionID,user.username,user.id as userID FROM report Inner join question on report.targetID = question.id inner join user on report.senderID = user.id where report.targetType = 'question'`);
  res.send({ data: data });
});
router.get('/user-report', async function(req, res, next) {
  const data = await runQuery(`SELECT report.id,report.targetID,report.senderID,report.message,report.createdAt,user.id as userID,user.username FROM report inner join user on report.senderID = user.id where report.targetType = 'user'`);
  res.send({ data: data });
});
router.get('/answer-report', async function(req, res, next) {
  const data = await runQuery(`SELECT * FROM report inner join user on report.senderID = user.id where targetType = 'answer'`);
  res.send({ data: data });
});
router.get('/dashboard', async function(req, res, next) {
  const CreationDate = moment(new Date(Date.now() - 7 * 24 * 60 * 60 * 1000)).format('YYYY-MM-DD');
  const _totalActiveUser = await runQuery(`SELECT COUNT(*) FROM user WHERE status = 'active' and DATE(createdAt) > '${CreationDate}';`);
  const _totalSession = await runQuery(`SELECT COUNT(*) FROM log WHERE DATE(createdAt) > '${CreationDate}';`);
  const totalActiveUser = await runQuery(`SELECT COUNT(*) FROM user WHERE status = 'active';`);
  const totalSession = await runQuery(`SELECT COUNT(*) FROM log;`);
  const oldestLog = await runQuery(`SELECT * FROM log ORDER BY createdAt ASC LIMIT 1`); 
  res.send({ data: {
    _totalActiveUser,
    _totalSession,
    totalActiveUser,
    totalSession,
    oldestLog
  } });
});
router.post("/", async function (req, res, next) {
  const { id,senderID,targetID,message,targetType,type } = req.body;
  if(!senderID) res.status(400);
  const CreationDate = moment(new Date()).format('YYYY-MM-DD hh:mm:ss');
  // const id = uuidv4();
  const queryString = `insert into report (id,senderID,targetID,targetType,type, message,createdAt) values ('${id}','${senderID}','${targetID}','${targetType}','${type}','${message}','${CreationDate}');`;
  const data = await runQuery(queryString);
  if (data) res.send({ data: data });
  else {
    res.status(500);
  }
});
router.delete("/:id", async function (req, res, next) {
  const id = req.params.id;
  const data = await runQuery(`DELETE FROM report WHERE id = '${id}'`);
  res.send({ data: data });
});
export default router;
