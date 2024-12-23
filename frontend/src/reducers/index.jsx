import { combineReducers } from "@reduxjs/toolkit";
import loggedSlice from "./isLogged";
import loadingSlice from "./isLoading";

const rootReducer = combineReducers({
  isLoggedIn: loggedSlice,
  isLoading: loadingSlice,
});

export default rootReducer;
