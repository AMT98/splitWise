import { combineReducers } from "@reduxjs/toolkit";
import loggedSlice from "./isLogged";
import loadingSlice from "./isLoading";
import alertReducer from "./alert";

const rootReducer = combineReducers({
  isLoggedIn: loggedSlice,
  isLoading: loadingSlice,
  alert: alertReducer,
});

export default rootReducer;
