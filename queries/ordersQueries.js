const pool = require("../config/dbConfig");

 
const orderItems = async (req, res) => {
    if (req.isAuthenticated()) {
        const userId = req.user.id;
        const total = await pool.query('select SUM(cart_items.quantity * items.price) from items join cart_items on items.id = cart_items.item_id where cart_items.user_id = $1', [userId]);
        
        const intTotal = Number(total.rows[0].sum);

        const addedOrder = await pool.query('INSERT INTO orders (user_id, total) VALUES($1, $2) RETURNING *', [userId, intTotal]);
        const orderId = addedOrder.rows[0].id
        
        let results = await pool.query('SELECT item_id, quantity FROM cart_items WHERE user_id = $1', [userId]);
        
        const itemsToOrder = results.rows;
                

        for (let i = 0; i < itemsToOrder.length; i++ ) {
               
                await pool.query('INSERT INTO order_items VALUES($1, $2, $3)', [orderId, itemsToOrder[i].item_id, itemsToOrder[i].quantity])
                await pool.query('UPDATE items SET quantity = quantity - $1 WHERE id = $2', [itemsToOrder[i].quantity, itemsToOrder[i].item_id])
        }
        console.log('Order Created');

        await pool.query('DELETE FROM cart_items WHERE user_id = $1', [userId]);



        res.send('Order Placed');
    }

else {
    res.redirect('/users/login');
}
}

const fetchOrders = async (req, res) => {
    if (req.isAuthenticated()) {

        const userId = req.user.id;
        const orders = await (await pool.query('SELECT * FROM orders WHERE user_id = $1', [userId])).rows;

        res.json(orders)


    } else {
        res.redirect('users/login')
    }
}
 

module.exports = { orderItems,
                    fetchOrders };
                    