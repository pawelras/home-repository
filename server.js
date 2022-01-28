// require('dotenv').config();
const morgan = require('morgan');
const express = require('express');
const cors = require('cors');
const cookieParser = require('cookie-parser');
const bodyParser = require('body-parser');
const session = require('express-session');
const passport = require('passport');
const flash = require('express-flash');
const path = require('path');
   
const initializePassport = require('./passport-config').initialize;
initializePassport(passport);



const usersRouter = require('./routers/users');
const itemsRouter = require('./routers/items');


const app = express();

app.use(express.static(path.join(__dirname, 'home-repository/build')));
app.use(morgan('dev'));
app.use(express.json()); 
app.use(flash());
app.use(cookieParser(process.env.SECRET));
app.use(bodyParser.json()); 
app.use(bodyParser.urlencoded({ extended: true }));


app.use(cors({credentials: true, origin: "https://homerepository.herokuapp.com/"}));


app.use(session({
    secret: process.env.SECRET,
    resave: false,
    saveUninitialized: false 
}));

app.use(passport.initialize());
app.use(passport.session()); 


app.use('/users', cors({origin: "https://homerepository.herokuapp.com/", credentials: true}), usersRouter); 
app.use('/users', usersRouter);
app.use('/items', itemsRouter); 

app.get('*', function(req, res) {
    res.redirect('/');
});

const PORT = process.env.PORT || 4001; 

app.listen(PORT, () => {  
    console.log(`The app is listening on port ${PORT}`)
});  