import express from "express";
import moment from "moment";
import { v4 as uuidv4 } from 'uuid';
import runQuery from "../databaseConnection";
import { authenticateJWT } from "../middleware/authencationJWT";

var router = express.Router();


router.get("/", async function (req, res, next) {
  const data = await runQuery(`SELECT * FROM question`);
  res.send({ data: data });
});
router.get("/no-comment-question", async function (req, res, next) {
  const data = await runQuery(`SELECT * FROM question where comments = ""`);
  res.send({ data: data });
});

router.get("/:id", async function (req, res, next) {
  const id = req.params.id;
  const data = await runQuery(`select * from question inner join user on question.userID = user.id WHERE question.id = '${id}'`);
  if(data){
    res.send({ data: data});
  }
  else {
    res.status(500);
  }

});


router.post("/", async function (req, res, next) {
  const {id, userID,type,lang,content,additionalInfomation, audioURL,photoURL,questionType,comments, featuredAnswer, votes, status } = req.body;
  const date = moment(new Date()).format('YYYY-MM-DD hh:mm:ss');
  // const id = uuidv4();
  const queryString = `insert into question (id,userID, type, lang,content, additionalInfomation, audioURL,photoURL, questionType, comments, featuredAnswer, votes, status, createdAt, updatedAt) values('${id}','${userID}','${type}','${lang}',"${content}",'${additionalInfomation}','${audioURL}','${photoURL}','${questionType}','${comments}','${featuredAnswer}','${votes}','${status}','${date}','${date}');`;
  const data = await runQuery(queryString);
  if (data) res.send({ data: data });
  else {
    res.status(500);
  }
});

router.put("/", async function (req, res, next) {
  const {  id,type,lang,content,additionalInfomation, audioURL,photoURL,questionType,comments, featuredAnswer, votes, status} = req.body;
  let queryString = `UPDATE question SET `;
  if (title) {
    queryString = queryString.concat(`type = '${type}', `);
  }
  if (lang) {
    queryString = queryString.concat(`lang = '${lang}', `);
  }
  if (content) {
    queryString = queryString.concat(`content = ${content}, `);
  }
  if (additionalInformation) {
    queryString = queryString.concat(`additionalInfomation = '${additionalInfomation}', `);
  }
  if (audioURL) {
    queryString = queryString.concat(`audioURL = '${audioURL}', `);
  }
  if (photoURL) {
    queryString = queryString.concat(`photoURL = '${photoURL}', `);
  }
  if (questionType) {
    queryString = queryString.concat(`questionType = ${questionType}, `);
  }
  if (comments) {
    queryString = queryString.concat(`comments = '${comments}', `);
  }
  if (featuredAnswer) {
    queryString = queryString.concat(`featuredAnswer = '${featuredAnswer}', `);
  }
  if (vote) {
    queryString = queryString.concat(`votes = '${votes}', `);
  }
  if (status) {
    queryString = queryString.concat(`status = ${status}, `);
  }
  const updatedAt = moment(new Date()).format('YYYY-MM-DD hh:mm:ss');
  queryString = queryString.concat(
    `updatedAt = '${updatedAt}' WHERE id = '${id}'`
  );
  const data = await runQuery(queryString);
  res.send({ data: data });
});

router.delete("/:id", authenticateJWT, async function (req, res, next) {
  const id = req.params.id;
  const data = await runQuery(`DELETE FROM question WHERE Id = '${id}'`);
  res.send({ data: data });
});
export default router;
