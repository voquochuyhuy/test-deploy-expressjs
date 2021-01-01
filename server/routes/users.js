import express from "express";
import runQuery from "../databaseConnection";
import { v4 as uuidv4 } from 'uuid';
import moment from "moment";
import { authenticateJWT } from "../middleware/authencationJWT";
import aesjs from "aes-js";
import bcrypt from "bcrypt";
var router = express.Router();

/* GET users listing. */
router.get("/", async function (req, res, next) {
  const data = await runQuery(`SELECT * FROM user `);
  res.send({ data: data });
});

/* GET user detail. */
router.get("/:id", async function (req, res, next) {
  const id = req.params.id;
  const data = await runQuery(`SELECT * FROM user where id = ${id};`);
  res.send({ data: data });
});

/* CREATE user . */
router.post("/", async function (req, res, next) {
  const {
    username,
    email,
    password,
    gender,
    bio,
    country,
    nativeLanguage,
    interestLanguages,
    points,
    photoURL,
    status,
  } = req.body;
  if (!email) res.status(400);
  const saltRounds = 10;
  const date = moment(new Date()).format('YYYY-MM-DD hh:mm:ss');
  // bcrypt.genSalt(saltRounds, function (err, salt) {
  //   bcrypt.hash(passwordHash, salt, async function (err, hash) {
  //     const data = await runQuery(`insert into user
  //     (CreationDate, DisplayName, LastAccessDate,
  //     WebsiteUrl, Region, AboutMe,
  //     UpVotes, DownVotes, ProfileImageUrl,
  //     Email, Age, Account, PasswordHash)
  //     values(${creationDate},${displayName},${lastAccessDate},${websiteUrl},${region},${aboutMe},0,0,${profileImageUrl},${email},${age},${account},${hash}
  //     )`);
  //     res.send({ data: data });
  //   });
  // });
  const id = uuidv4();
  const data = await runQuery(`insert into user 
      (id,username, email,password,gender,bio,country,nativeLanguage,interestLanguages,points,photoURL,status, createdAt) 
      values ('${id}',${username}','${email}','${password}','${gender}','${bio}','${country}','${nativeLanguage}','${interestLanguages}',${points},'${photoURL}','${status}','${date}');`);
  res.send({ data: data });
});

/* UPDATE user. */
router.put("/", async function (req, res, next) {
  const {
    id,
    username,
    email,
    password,
    gender,
    bio,
    country,
    nativeLanguage,
    interestLanguages,
    points,
    photoURL,
    status,
  } = req.body;
  let queryString = `UPDATE user SET `;
  if (username) {
    queryString = queryString.concat(`username = '${username}', `);
  }
  if (email) {
    queryString = queryString.concat(`email = '${email}', `);
  }
  if (password) {
    queryString = queryString.concat(`password = '${password}', `);
  }
  if (gender) {
    queryString = queryString.concat(`gender = '${gender}', `);
  }
  if (bio) {
    queryString = queryString.concat(
      `bio = '${bio}', `
    );
  }
  if (country) {
    queryString = queryString.concat(`country = '${country}', `);
  }
  if (nativeLanguage) {
    queryString = queryString.concat(`nativeLanguage = '${nativeLanguage}', `);
  }
  if (interestLanguages) {
    queryString = queryString.concat(`interestLanguages = '${interestLanguages}', `);
  }
  if (points) {
    queryString = queryString.concat(`points = '${points}', `);
  }
  if (photoURL) {
    queryString = queryString.concat(`photoURL = '${photoURL}', `);
  }
  if (status) {
    queryString = queryString.concat(`status = '${status}' `);
  }
  queryString = queryString.concat(`WHERE id = '${id}';`);
  try {
    const data = await runQuery(queryString);
    res.send({ data: data });
  } catch (error) {
    res.status(500);
  }
});

/* Delete user . */
router.delete("/:id", async function (req, res, next) {
  const id = req.params.id;
  const data = await runQuery(`DELETE FROM user WHERE id = '${id}'`);
  res.send({ data: data });
});

export default router;
