import express from 'express';
import path from 'path';
import cookieParser from 'cookie-parser';
import logger from 'morgan';

import indexRouter from './routes/index';
import logRouter from './routes/log';
import userRouter from './routes/users';
import postRouter from './routes/posts';
import adminRouter from './routes/user-admin';

var app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, '../public')));

app.use('/', indexRouter);
app.use('/log', logRouter);
app.use('/user', userRouter);
app.use('/post', postRouter);
app.use('/admin', adminRouter);

export default app;
