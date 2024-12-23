import { combineReducers } from "@reduxjs/toolkit";
import loggedSlice from "./isLogged";

const rootReducer = combineReducers({
  isLoggedIn: loggedSlice,
});

export default rootReducer;
