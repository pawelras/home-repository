const pool = require('../config/dbConfig');

const getAllItems = (req, res) => {

   

    pool.query('SELECT * FROM items', (error, results) => {
        if (error) {
            throw error
        };

        res.status(200).json(results.rows);
    });
};

const getCategories = (req, res) => {
    pool.query('SELECT * FROM categories', (error, results) => {
        if (error) {throw error};

        res.status(200).json(results.rows)
    });
};

const getItemById = (req, res) => {
    const id = req.params.id;
    pool.query('SELECT * FROM items WHERE id = $1', [id], (error, results) => {
        if (error) {
            throw error
        }
        const item = results.rows[0]
        res.render('item.ejs', {item: item})
    });
};

const getItemsByCategory = (req, res) => {
    const id = req.params.categoryId;
    pool.query('SELECT * FROM items WHERE category_id = $1', [id], (error, results) => {
        if (error) {
            throw error
        }
        res.status(200).json(results.rows);
    });
};

const getItemsBySearchTerm = (req, res) => {
    const searchTerm = `%${req.params.searchTerm}%`;
    pool.query('SELECT * FROM items WHERE LOWER(name) LIKE LOWER($1)', [searchTerm], (error, results) => {
        if (error) {
            throw error
        }; 
        res.status(200).json(results.rows);
    });
};




const addItemToCart = (req, res, next) => {
    if (req.isAuthenticated()) {

        const userId = req.user.id;
        console.log(userId);
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

        })
        
        

    }  else { //if not authencticated
        res.status(401).send();
    }
} //function end

module.exports = {  getAllItems,
                    getItemById,
                    getItemsByCategory,
                    getItemsBySearchTerm,
                    addItemToCart,
                    getCategories
                };