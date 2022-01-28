const LocalStrategy = require('passport-local').Strategy;
const pool = require('./config/dbConfig');
const bcrypt = require('bcrypt');
// require('dotenv').config();
const {render} = require('ejs');


function initialize (passport) {

const authenticateUser = (email, password, done) => {
    pool.query('SELECT * FROM users WHERE email=$1', [email], (error, results) => {
        if (error) {
            throw error
        } 
        
        if (results.rows.length > 0 ) {
            
            const user = results.rows[0];
            //comparing stored password with supplied password
            bcrypt.compare(password, user.password, (error, isMatch) => {

                if (error) {
                    throw error
                }
                
                if (isMatch) {
                
                   console.log(user.id)
                   return done(null, user) //null error, user matched
                   
                }

                else {
                    return done (null, false, {message: 'Password is not correct'}); //null error, password not matched
            }
         })
        }
        
        else {
            return done(null, false, {message: 'Email not registered'}) // error null, email not matched
        }
    })
}
    passport.use(
        new LocalStrategy({
        usernameField: "email",
        passwordField: "password"
    }, authenticateUser)    );

    passport.serializeUser( (user, done) => {
        
         done(null, user.id)}//store user id in session
    );

    passport.deserializeUser((id, done) => {
        console.log('deserialising')
        pool.query('SELECT * FROM users WHERE id=$1', [id], (error, results) => {
            if (error) return done(error);
            if (results.rows[0]) { return done(null, results.rows[0]) //pass user object to deserialize
            } 
            else {
                return done(null, false)
              }
          
        });
    });
};

function checkAuthenticated (req, res, next) {
    if (req.isAuthenticated()) {
        return res.redirect('/') // return so that the function terminates here
    }
    next();
};

function checkNotAuthenticated (req, res, next) {
    if(req.isAuthenticated) {
        return next() // return so that the function terminates here
    }
    res.redirect('/users/login');
};

module.exports = {  initialize,
                    checkAuthenticated,
                    checkNotAuthenticated   }; 