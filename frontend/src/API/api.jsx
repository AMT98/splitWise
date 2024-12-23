import axios from "axios";

const api = axios.create({
  baseURL: "http://localhost:3000",
  headers: {
    "Content-Type": "application/json",
  },
});

export const AuthApi = {
  signup: (data) => api.post("/signup", data),
  login: (data) => api.post("/login", data),
};

export default api;
