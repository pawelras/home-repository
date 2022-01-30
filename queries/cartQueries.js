const pool = require('../config/dbConfig');
const {render} = require('ejs');

const fetchCartItems = (req, res) => {
    if(req.isAuthenticated()){
        const {id} = req.user;
        pool.query('SELECT cart_items.user_id, items.price,	items.name, cart_items.item_id,	cart_items.quantity, (cart_items.quantity * items.price) as total FROM items JOIN cart_items ON items.id = cart_items.item_id WHERE cart_items.user_id = $1', [id], (error, results) => {
            if (error) throw error
            res.status(200).json(results.rows);
        })

    } else {
        console.log('fetchCartItems Not Authenticated')
        res.render('login.ejs');
    }
};

const fetchCartTotal = (req, res) => {
    if (req.isAuthenticated()) {
        const {id} = req.user;
        pool.query('select SUM(cart_items.quantity * items.price) from items join cart_items on items.id = cart_items.item_id where cart_items.user_id = $1', [id], (error, results) => {
            if (error) throw error
            res.status(200).json(results.rows)
        })
    } else {
        console.log('fetchCartTotal Not Authenticated')
        res.render('login.ejs');
    }
};




const addItemToCart = (req, res, next) => {
    if (req.isAuthenticated()) {

        const userId = req.user.id;
        const itemId = req.params.id;
        
        pool.query('SELECT * FROM cart_items WHERE user_id = $1 AND item_id = $2', [userId, itemId], (error, results) => {
            if (error) { 
               throw error
            }

            if (results.rows.length > 0) {

                pool.query('UPDATE cart_items SET quantity = quantity + 1 WHERE user_id = $1 AND item_id = $2', [userId, itemId], (error, results) => {
                    if (error) {
                        throw error
                    }
                    return res.send('Item already in cart. Added another')
                })
            } 

            else {
                pool.query('INSERT INTO cart_items VALUES($1, $2, $3)', [userId, itemId, 1], (error, results) => {
                    if (error) {
                        throw error
                    }

                    return res.send('Item added')
                })
            }

        });
        
        

    }  else { //if not authencticated
        
        res.status(401).send()
    }
} //function end


const removeItemsFromCart = (req, res) => {

    if (req.isAuthenticated()) {

        const userId = req.user.id;
        const itemId = req.params.id;
       
        pool.query('DELETE FROM cart_items WHERE user_id = $1 AND item_id = $2', [userId, itemId], (error, results) => {
            if (error) { 
                throw error
            }

            return res.status(204).send()
        })

    }

    else {

        res.render('login.ejs');
    }
}


const emptyCart = async (req, res) => {
    if (req.isAuthenticated()) {
        const userId = req.user.id;
        console.log(userId);
        await pool.query('DELETE FROM cart_items WHERE user_id = $1', [userId])
        return res.status(204).send('Cart Empty')
    }

    else {
        console.log('empty cart not authenticated')
        res.redirect('/users/login')
    }
};

module.exports = {  fetchCartItems, 
                    addItemToCart,
                    removeItemsFromCart,
                    emptyCart,
                    fetchCartTotal
                };
