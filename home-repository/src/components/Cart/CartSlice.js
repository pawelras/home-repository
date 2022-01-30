import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";


export const fetchCartItems = createAsyncThunk(
    'cart/fetchCartItems',
    async () => {
        const data = await fetch("/users/cart", {credentials: 'include'});
        const json = await data.json();
        return json;
    }
)

export const fetchCartTotal = createAsyncThunk(
    'cart/fetchCartTotal',
    async () => {
        const data = await fetch("/users/cart/total", {credentials: 'include'});
        const json = await data.json();
        return json;

    }
)


 export const cartSlice = createSlice({
     name: 'cart', 

     initialState: {

         cartItems: [],
         isCartItemsLoading: false,
         hasCartItemsError: false,
         cartTotal: 0,
         noItems: 0,
         isCartTotalLoading: false,
         hasCartTotalError: false
        
    },

     reducers: {
        clearCart: (state) => {
            state.cartItems = [];
            state.noItems = 0;
        }
     },

     extraReducers: {
         [fetchCartItems.pending]: (state, action) => {
             state.isCartItemsLoading = true;
             state.hasCartItemsError = false;
         },

         [fetchCartItems.fulfilled]: (state, action) => {
             state.isCartItemsLoading = false;
             state.hasCartItemsError = false;
             state.cartItems = action.payload;
             state.noItems = action.payload.length
         },

         [fetchCartItems.rejected]: (state, action) => {
             state.isCartItemsLoading = false;
             state.hasCartItemsError = true;
         },

         [fetchCartTotal.pending]: (state, action) => {
            state.isCartTotalLoading = true;
            state.hasCartTotalError = false;
        },

        [fetchCartTotal.fulfilled]: (state, action) => {
            state.isCartTotalLoading = false;
            state.hasCartTotalError = false;
            state.cartTotal = action.payload
        },

        
        [fetchCartTotal.rejected]: (state, action) => {
            state.isCartTotalLoading = true;
            state.hasCartTotalError = false;

        }
     }

 });

 export default cartSlice.reducer;
 export const { clearCart } = cartSlice.actions;
