import express from "express";
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
  const Date = moment(new Date()).format('YYYY-MM-DD hh:mm:ss');
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
  const data = await runQuery(`insert into user 
      (username, email,password,gender,bio,country,nativeLanguage,interestLanguages,points,photoURL,status, createdAt) 
      values ('${username}','${email}','${password}','${gender}','${bio}','${country}','${nativeLanguage}','${interestLanguages}',${points},'${photoURL}','${status}','${Date}');`);
  res.send({ data: data });
});

/* UPDATE user. */
router.put("/", async function (req, res, next) {
  const {
    id,
    displayName,
    websiteUrl,
    region,
    aboutMe,
    profileImageUrl,
    email,
    age,
    account,
  } = req.body;
  let queryString = `UPDATE user SET `;
  if (displayName) {
    queryString = queryString.concat(`DisplayName = '${displayName}', `);
  }
  if (websiteUrl) {
    queryString = queryString.concat(`WebsiteUrl = '${websiteUrl}', `);
  }
  if (region) {
    queryString = queryString.concat(`Region = '${region}', `);
  }
  if (aboutMe) {
    queryString = queryString.concat(`AboutMe = '${aboutMe}', `);
  }
  if (profileImageUrl) {
    queryString = queryString.concat(
      `ProfileImageUrl = '${profileImageUrl}', `
    );
  }
  if (email) {
    queryString = queryString.concat(`Email = '${email}', `);
  }
  if (age) {
    queryString = queryString.concat(`Age = '${age}', `);
  }
  if (account) {
    queryString = queryString.concat(`Account = '${account}', `);
  }
  queryString = queryString.concat(`WHERE id = ${id}`);
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
  const data = await runQuery(`DELETE FROM user WHERE id = ${id}`);
  res.send({ data: data });
});

export default router;
