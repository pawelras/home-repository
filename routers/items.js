const express = require('express');
const db = require('../queries/itemsQueries')

const itemsRouter = express.Router();

itemsRouter.get('/', db.getAllItems );

itemsRouter.get('/search/:searchTerm', db.getItemsBySearchTerm);

itemsRouter.get('/categories', db.getCategories);

itemsRouter.get('/categories/:categoryId', db.getItemsByCategory);

itemsRouter.get('/:id', db.getItemById);

// itemsRouter.get('/:id', db.getItemById(), (req, res, next) => {
//     res.render('item.ejs', {item: })
// })

itemsRouter.post('/:id', db.addItemToCart);


module.exports = itemsRouter;