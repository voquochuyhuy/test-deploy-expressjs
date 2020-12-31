import express from "express";
import moment from "moment";
import runQuery from "../databaseConnection";
import { authenticateJWT } from "../middleware/authencationJWT";

var router = express.Router();


router.get("/", async function (req, res, next) {
  const data = await runQuery(`SELECT * FROM question`);
  res.send({ data: data });
});

router.get("/:id", async function (req, res, next) {
  const id = req.params.id;
  const data = await runQuery(`select * from question  WHERE id = ${id}`);
  if(data){
    res.send({ data: data});
  }
  else {
    res.status(500);
  }

});


router.post("/", async function (req, res, next) {
  const { email,userId,type,lang,content,additionalInformation, audioURL,photoURL,questionType,comments, featuredAnswer, vote, status } = req.body;
  const Date = moment(new Date()).format('YYYY-MM-DD hh:mm:ss');
  const user = await runQuery(`select * from user where email = '${email}'`);
  const queryString = `insert into question 
  (userID, type, lang, 
  content, additionalInformation, audioURL, 
  photoURL, questionType, 
  comments, featuredAnswer, vote, status, 
  createdAt, updatedAt) values(${user.id},'${type}','${type}','${lang}','${content}','${additionalInformation}','${audioURL}','${photoURL}','${questionType}','${comments}','${featuredAnswer}',${vote},'${status}','${Date}','${Date}');`;
  const data = await runQuery(queryString);
  if (data) res.send({ data: data });
  else {
    res.status(500);
  }
});

router.put("/", async function (req, res, next) {
  const { id, title, tags, isAudioQuestion, content } = req.body;
  let queryString = `UPDATE Posts SET `;
  if (title) {
    queryString = queryString.concat(`Title = '${title}', `);
  }
  if (tags !== undefined) {
    queryString = queryString.concat(`Tags = '${tags}', `);
  }
  if (isAudioQuestion !== undefined) {
    queryString = queryString.concat(`isAudioQuestion = ${isAudioQuestion}, `);
  }
  if (content !== undefined) {
    queryString = queryString.concat(`Content = '${content}', `);
  }
  const lastActivityDate = moment(new Date()).format('YYYY-MM-DD');
  queryString = queryString.concat(
    `LastActivityDate = '${lastActivityDate}' WHERE id = ${id}`
  );
  const data = await runQuery(queryString);
  res.send({ data: data });
});

router.delete("/:id", authenticateJWT, async function (req, res, next) {
  const id = req.params.id;
  const data = await runQuery(`DELETE FROM Question WHERE id = ${id}`);
  res.send({ data: data });
});
export default router;
