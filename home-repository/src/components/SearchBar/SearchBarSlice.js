import { createSlice } from '@reduxjs/toolkit';


export const searchBarSlice = createSlice({

    name: 'searchBar',
    initialState: {
        searchTerm: ''
    },

    reducers: {
        'setSearchTerm': (state, action) => {
            state.searchTerm = action.payload
        }
    }

})

export default searchBarSlice.reducer;
export const { setSearchTerm } = searchBarSlice.actions;