import { createSlice } from "@reduxjs/toolkit";

const initialState = false;

const isLoadingSlice = createSlice({
  name: "isLoading",
  initialState,
  reducers: {
    setLoading(state) {
      return true;
    },
    setLoaded(state) {
      return false;
    },
  },
});

export const { setLoading, setLoaded } = isLoadingSlice.actions;

export default isLoadingSlice.reducer;
