import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";


export const fetchOrders = createAsyncThunk(
    "orders/fetchOrders",
    async () => {
        const data = await fetch("/users/orders", {credentials: "include"});
        const json = await data.json()
        return json;
    }

)

export const ordersSlice = createSlice({
    name: "orders",

    initialState: {
        orders: [],
        isOrdersLoading: false,
        hasOrdersError: false
    },

    reducer: {

    },

    extraReducers: {
        [fetchOrders.pending]: (state, action) => {
            state.isOrdersLoading = true;
            state.hasOrdersError = false;

        },

        [fetchOrders.fulfilled]: (state, action) => {
            state.isOrdersLoading = false;
            state.hasOrdersError = false;
            state.orders = action.payload;

        },
        
        [fetchOrders.rejected]: (state, action) => {
            state.isOrdersLoading = false;
            state.hasOrdersError = true;
        }
    }
    }
)

export default ordersSlice.reducer;
