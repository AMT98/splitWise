import { createSlice } from "@reduxjs/toolkit";

const initialState = false;

const loggedSlice = createSlice({
  name: "auth",
  initialState,
  reducers: {
    signIn(state) {
      return true;
    },
    signOut(state) {
      return false;
    },
  },
});

export const { signIn, signOut } = loggedSlice.actions;
export default loggedSlice.reducer;
