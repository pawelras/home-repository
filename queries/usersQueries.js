// const pool = require('../config/dbConfig');
// const bcrypt = require('bcrypt');
// const passport = require('passport');
// const { Pool } = require('pg');





// const registerUser = async (req, res) => {

//     console.log(req.body)

//     const { firstName, lastName, email, password, password2 } = req.body;
       
//     const hashedPassword = await bcrypt.hash(password, 10); //10 is the number of routes  when generating salt
        

//     pool.query(

//             'SELECT * FROM users WHERE email = $1', [email], (error, results) => {
//                 if (error) {
//                     throw error
//                 }

//                 if (results.rows.length > 0) { 
//                     console.log('user exists')
//                     res.send("User Already Exists")
                
//             } else {

//                 pool.query( 'INSERT INTO users (first_name, last_name, email, password) VALUES ($1, $2, $3, $4)', [ firstName, lastName, email, hashedPassword ] , (error, results) => {

//                     if (error) {
//                         throw error
//                     }
                    
//                     res.status(201).send('user created');
//                 })
//             }
//         });
//     // }
//  }

 
//  const deleteUserById = (req, res) => {
    
//      if (req.isAuthenticated()) {
        
//         const id = req.user.id;
                
//         pool.query('DELETE FROM users WHERE id = $1', [id], (error, results) => {

//             if (error) {
//                 throw error
//             }
            
            
//         });
        
        
//         return res.status(204).render('login.ejs');
//      };
//         console.log('not authenticated')
//         res.status(204).render('login.ejs');
//  } ;


//  const updateUserById = (req, res, next) => {
        
//      if (req.isAuthenticated()) {
//          const id = req.user.id;
//          const { firstName, lastName, email, address} = req.body

//          pool.query('UPDATE users SET first_name = $1, last_name = $2, email = $3, address = $4 WHERE id = $5 RETURNING *' , [firstName, lastName, email, address, id], (error, results) => {
//              if (error) {
//                  throw error
//              }
//              if (results.rows.length > 0) {
//                  const user = results.rows[0];
//                  req.user = user;
                     
//                 req.flash('success_msg', 'Details Updated');
//                 res.render('dashboard.ejs', {user: user}); 
                 
//               } 
              
               
//          }); 
         
//      } else {

//      res.render('login.ejs') }
//  };

//  const getUserDetails = (req, res, ) => {

//     console.log(req.user);
    
//     console.log(req.headers);
    

//      if (req.isAuthenticated()) {

//         console.log('authenticated')
        
//         const id = req.user.id;
        
//         pool.query('SELECT first_name, last_name, address, email FROM users WHERE id = $1', [id], (error, results) => {
//             if (error) throw error;

//             if (results.rows.length > 0) {
//                 const user = results.rows[0]
//                 res.status(200).send(user);
                
//             }

//         })

//      } else {
//         console.log('not authenticated')
//         res.send('user not authenticated');
//      }
//  };


// module.exports = {
//     registerUser,
//     deleteUserById,
//     updateUserById,
//     getUserDetails
// };

const pool = require('../config/dbConfig');
const bcrypt = require('bcrypt');
const passport = require('passport');
const { Pool } = require('pg');
const { render } = require('ejs');




const registerUser = async (req, res) => {

    console.log(req.body)

    const { firstName, lastName, email, password, password2 } = req.body;
      
    const errors = [];

   
    if (password.length < 8) {
        errors.push({message: "Password should be at least 8 characters"})
    }

    if (password !== password2) {
        errors.push({message: "Passwords do not match"})
    }

    if (errors.length > 0) {
        res.render('register.ejs', {errors})
    } else {


    const hashedPassword = await bcrypt.hash(password, 10); //10 is the number of routes  when generating salt
    
    
    pool.query(

            'SELECT * FROM users WHERE email = $1', [email], (error, results) => {
                if (error) {
                    throw error
                }

                if (results.rows.length > 0) { 
                    errors.push({message: 'Email address already in use'})
                    res.render('register.ejs', {errors})
                
            } else {

                pool.query( 'INSERT INTO users (first_name, last_name, email, password) VALUES ($1, $2, $3, $4)', [ firstName, lastName, email, hashedPassword ] , (error, results) => {

                    if (error) {
                        throw error
                    }
                    
                    req.flash('success_msg', "Registration Successful. Please now sign in");
                    res.status(201).redirect('/users/login');
                })
            }
        });
    }
 }

 
 const deleteUserById = (req, res) => {
    
     if (req.isAuthenticated()) {
        
        const id = req.user.id;
                
        pool.query('DELETE FROM users WHERE id = $1', [id], (error, results) => {

            if (error) {
                throw error
            }
            
            
        });
        
        
        return res.status(204).render('login.ejs');
     };
        console.log('not authenticated')
        res.status(204).render('login.ejs');
 } ;


 const updateUserById = (req, res, next) => {
        
     if (req.isAuthenticated()) {
         const id = req.user.id;
         const { firstName, lastName, email, address} = req.body;
         console.log(firstName, lastName, email, address)

         pool.query('UPDATE users SET first_name = $1, last_name = $2, email = $3, address = $4 WHERE id = $5 RETURNING *' , [firstName, lastName, email, address, id], (error, results) => {
             if (error) {
                 throw error
             }
             if (results.rows.length > 0) {
                 const user = results.rows[0];
                 req.user = user;
                  
                res.send(user);
                     
                                
              } 
              
               
         }); 
         
     } else {

     res.render('login.ejs') }
 };

 const getUserDetails = (req, res, ) => {
    

     if (req.isAuthenticated()) {

        console.log('authenticated')
        
        const id = req.user.id;
        
        pool.query('SELECT first_name, last_name, address, email FROM users WHERE id = $1', [id], (error, results) => {
            if (error) throw error;

            if (results.rows.length > 0) {
                const user = results.rows[0]
                res.status(200).send(user);
                
            }

        })

     } else {
        console.log('not authenticated')
        res.redirect('/users/login');
     }
 };


module.exports = {
    registerUser,
    deleteUserById,
    updateUserById,
    getUserDetails
};
