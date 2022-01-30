import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";


export const fetchUser = createAsyncThunk(
    "dashboard/fetchUser",
    async () => {
        
        const data = await fetch("/users/details", {credentials: "include"});
        const json = await data.json();
        return json;
    }
);

export const dashboardSlice = createSlice({
    name: "dashboard",
    initialState: {
        user: {},
        isUserLoading: false,
        userHasError: false

    },

    reducer: {
        "clearUser": (state, action) => {
            state.user = {}
        }
    },

    extraReducers: {
        [fetchUser.pending]: (state, action) => {
            state.isUserLoading = true;
            state.userHasError = false;
        },

        [fetchUser.fulfilled]: (state, action) => {
            state.isUserLoading = false;
            state.userHasError = false;
            state.user = action.payload;
        },

        [fetchUser.rejected]: (state, action) => {
            state.isUserLoading = false;
            state.userHasError = true;
        },
    }

});

export default dashboardSlice.reducer;
export const {clearUser} = dashboardSlice.actions;