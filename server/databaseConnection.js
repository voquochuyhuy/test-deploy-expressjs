import { async } from 'regenerator-runtime';
import mysql from 'mysql';

var connection = mysql.createConnection({
  host: 'db4free.net',
  user: 'voquochuy798',
  password: 'a22994f0',
  database: 'togetherbetter'
})

const runQuery = async (query)=>{
  console.log(query);
  return  new Promise(function(resolve,reject){
    connection.query(query,function(err,rows,fields){
      console.log(err);
      resolve(rows);
    })
  });
};
export default runQuery;

