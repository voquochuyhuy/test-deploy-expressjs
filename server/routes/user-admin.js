import express from "express";
import moment from "moment";
import runQuery from "../databaseConnection";
import { authenticateJWT } from "../middleware/authencationJWT";

var router = express.Router();

/* GET Bad Post */
router.get("/bad-posts", async function (req, res, next) {
  const data = await runQuery(`SELECT * FROM report Inner join user on report.userID = user.id`);
  res.send({ data: data });
});

/* GET User Admin List */
router.get("/admin-list", async function (req, res, next) {
  const data = await runQuery(`SELECT * FROM admin `);
  res.send({ data: data });
});

/* GET User List */
router.get("/api/user-list", async function (req, res, next) {
  const data = await runQuery(`SELECT * FROM user`);
  res.send({ data: data });
});


/* CREATE user admin */
router.post("/", async function (req, res, next) {
  const { Username, Password } = req.body;
  if(!Username || !Password) res.status(400);
  const queryString = `insert into admin values ('${Username}','${Password}')`;
  const data = await runQuery(queryString);
  if (data) res.send({ data: data });
  else {
    res.status(500);
  }
});

/* DELETE user admin*/
router.delete("/:id", async function (req, res, next) {
  const id = req.params.id;
  const data = await runQuery(`DELETE FROM admin WHERE id='${id}'`);
  res.send({ data: data });
});
export default router;