const express = require('express');
const userQueries = require('../queries/usersQueries');
const cartQueries = require('../queries/cartQueries');
const orderQueries = require('../queries/ordersQueries');
const usersRouter = express.Router();
const passport = require('passport');
// require('dotenv').config();
const checkAuthenticated = require('../passport-config').checkAuthenticated;
const checkNotAuthenticated = require('../passport-config').checkNotAuthenticated;

const frontEndUrl = process.env.FRONTEND_URL;
const backEndUrl = process.env.BACKEND_URL;


usersRouter.get('/details', userQueries.getUserDetails);

usersRouter.post('/register', userQueries.registerUser);

usersRouter.get('/register', (req, res) => {
    res.render('register.ejs')

});


usersRouter.get('/login', checkAuthenticated, (req, res) => {
    res.render('login.ejs')

});

usersRouter.post('/login', passport.authenticate('local', {successRedirect:'/', failureRedirect:'/users/login', failureFlash: true}));



usersRouter.get('/cart', cartQueries.fetchCartItems);

usersRouter.get('/cart/total',  cartQueries.fetchCartTotal);

usersRouter.delete('/cart/empty', cartQueries.emptyCart);

usersRouter.post('/cart/:id', cartQueries.addItemToCart);

usersRouter.delete('/cart/:id', cartQueries.removeItemsFromCart)

usersRouter.get('/orders', orderQueries.fetchOrders);


usersRouter.post('/orders', orderQueries.orderItems);


usersRouter.get('/logout', (req, res)=> { 
    req.logOut(); 
    res.redirect('/'); 
})

usersRouter.delete('/deleteAccount', userQueries.deleteUserById);

usersRouter.put('/update', userQueries.updateUserById);

module.exports = usersRouter;