import { configureStore } from "@reduxjs/toolkit";
import itemsReducer from '../components/Items/ItemsSlice';
import searchBarReducer from '../components/SearchBar/SearchBarSlice';
import dashboardReducer from '../components/Dashboard/DashboardSlice';
import cartReducer from '../components/Cart/CartSlice';
import ordersReducer from '../components/Orders/OrdersSlice'

export const store = configureStore({
    reducer: {
        items: itemsReducer,
        searchBar: searchBarReducer,
        dashboard: dashboardReducer,
        cart: cartReducer,
        orders: ordersReducer
    },
});