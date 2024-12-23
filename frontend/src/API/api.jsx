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

export const GroupApi = {
  createGroup: (data) => api.post("/groups", data),
  addMemberToGroup: (data) => api.post("/groups/{group_id}/memberships", data),
  getGroupUsers: (data) => api.get("/groups/{id}/users", data),
  removeUserFromGroup: (data) =>
    api.delete("/groups/{group_id}/memberships/{id}", data),
};

export const BillsApi = {
  getUserBills: (data) => api.get("/users/{user_id}/bills", data),
  createBill: (data) => api.post("/bills", data),
  editBill: (data) => api.patch("/bills/{id}", data),
  deleteBill: (data) => api.delete("/bills/{id}", data),
};

export default api;
