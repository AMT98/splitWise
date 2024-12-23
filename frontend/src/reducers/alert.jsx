import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  isVisible: false,
  message: "",
  type: "",
};

const alertSlice = createSlice({
  name: "Alert",
  initialState,
  reducers: {
    showAlert(state, action) {
      state.isVisible = true;
      state.message = action.payload.message;
      state.type = action.payload.type;
    },
    hideAlert(state) {
      state.isVisible = false;
      state.message = "";
      state.type = "";
    },
  },
});

export const { showAlert, hideAlert } = alertSlice.actions;
export default alertSlice.reducer;
