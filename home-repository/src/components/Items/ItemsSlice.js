import { createSlice, createAsyncThunk } from '@reduxjs/toolkit';


export const fetchItems = createAsyncThunk(
    'items/fetchItems',
    async () => {
        
        const data = await fetch("/items");
        const json = await data.json();
        return json;
   
    });

export const fetchCategories = createAsyncThunk(
    'items/fetchCategories', 
    async () => {

        const data = await fetch("/items/categories");
        const json = await data.json();
        return json;
        

    }
) 


export const fetchItemsByCategory = createAsyncThunk(
    'items/fetchItemsByCategory', 
    async (id) => {
       
        const data = await fetch(`/items/categories/${id}`);
        const json = await data.json();
        return json;
        

    }
) 


// export const searchItems = createAsyncThunk(
//     'items/searchItems',
//     async (arg, {getState}) => {

//         const searchTerm = getState().searchBar.searchTerm;
//         console.log(searchTerm);
//         const data = await fetch(`${backEndUrl}/items/search/${searchTerm}`);
//         const json = await data.json()
//         console.log(json)
//     }
// )

export const itemsSlice = createSlice({
        name: 'items',
        initialState: {
            items: [],
            isItemsLoading: false,
            itemsHasError: false,
            categories: [],
            isCategoriesLoading: false,
            hasCategoriesError: false,
            selectedCategory: null,
        },
        
        reducers: {
            'setCategory': (state, action) => {
               
                state.selectedCategory = action.payload;
            } 
        },
    
        extraReducers: {
    
            [fetchItems.pending]: (state, action) => {
                state.isItemsLoading = true;
                state.itemsHasError = false;
            },
    
            [fetchItems.fulfilled]: (state, action) => {
                state.isItemsLoading = false;
                state.itemsHasError = false;
                state.items = action.payload;
            },
    
            [fetchItems.rejected]: (state, action) => {
                state.isItemsLoading = false;
                state.itemsHasError = true;
            },

            [fetchItemsByCategory.fulfilled]: (state, action) => {
                state.items = action.payload;
            },

            [fetchCategories.pending]: (state, action) => {
                state.isItemsLoading = true;
                state.itemsHasError = false;
            },

            [fetchCategories.fulfilled]: (state, action) => {
                state.isItemsLoading = false;
                state.itemsHasError = false;
                state.categories = action.payload;
            },

            [fetchCategories.rejected]: (state, action) => {
                state.isItemsLoading = false;
                state.itemsHasError = true;
            },

            // [searchItems.pending]: (state, action) => {
            //     state.isItemsLoading = true;
            //     state.itemsHasError = false;
            // },

            // [searchItems.fulfilled]: (state, action) => {
            //     state.isItemsLoading = false;
            //     state.itemsHasError = false;
            //     state.items = action.payload;
            // },

            // [searchItems.rejected]: (state, action) => {
            //     state.isItemsLoading = false;
            //     state.itemsHasError = true;
            // },
 

            
        }
    
    });

export default itemsSlice.reducer;
export const { setCategory } = itemsSlice.actions;