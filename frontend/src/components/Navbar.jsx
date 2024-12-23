import { Link } from "react-router-dom";
import { useState } from "react";
import { useSelector, useDispatch } from "react-redux";
import { signIn, signOut } from "../reducers/isLogged";
import { setLoading, setLoaded } from "../reducers/isLoading";

const Navbar = () => {
  const [isMobileMenuOpen, setMobileMenuOpen] = useState(false);
  const userEmail = localStorage.getItem("email");
  const isLoggedIn = useSelector((state) => state.isLoggedIn);
  const dispatch = useDispatch();

  return (
    <header className="w-full bg-white fixed top-0 left-0 z-40 shadow-md">
      <nav className="container mx-auto p-4 flex justify-between items-center">
        <div>
          <Link to="/">
            <h1 className="text-3xl font-semibold text-indigo-600">
              Splitwise
            </h1>
          </Link>
        </div>

        <div className="hidden md:flex gap-4">
          {isLoggedIn ? (
            <>
              <span className="text-sm text-gray-700">
                Welcome, {userEmail}!
              </span>
              <button
                onClick={() => {
                  dispatch(setLoading());
                  localStorage.removeItem("token");
                  localStorage.removeItem("email");
                  dispatch(signOut());
                  dispatch(setLoaded());
                }}
                className="border p-2 bg-red-500 text-white font-bold rounded-md hover:bg-red-600 transition-colors"
              >
                Logout
              </button>
            </>
          ) : (
            <>
              <Link to="/login">
                <button className="border p-2 bg-indigo-500 text-white font-bold rounded-md hover:bg-indigo-600 transition-colors">
                  Login
                </button>
              </Link>
              <Link to="/signup">
                <button className="border p-2 bg-gray-500 text-white font-bold rounded-md hover:bg-gray-600 transition-colors">
                  Sign Up
                </button>
              </Link>
            </>
          )}
        </div>

        <div className="md:hidden flex items-center">
          <button
            onClick={() => setMobileMenuOpen(!isMobileMenuOpen)}
            className="text-indigo-600 focus:outline-none"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              className="w-6 h-6"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth="2"
                d="M4 6h16M4 12h16M4 18h16"
              />
            </svg>
          </button>
        </div>
      </nav>

      {isMobileMenuOpen && (
        <div className="md:hidden bg-white shadow-lg p-4">
          {isLoggedIn ? (
            <button
              onClick={() => {
                localStorage.removeItem("token");
                localStorage.removeItem("email");
                dispatch(signOut());
              }}
              className="block w-full text-center p-4 bg-red-500 text-white font-bold rounded-md mb-4 hover:bg-red-600"
            >
              Logout
            </button>
          ) : (
            <>
              <Link to="/login">
                <button className="block w-full text-center p-4 bg-indigo-500 text-white font-bold rounded-md mb-4 hover:bg-indigo-600">
                  Login
                </button>
              </Link>
              <Link to="/signup">
                <button className="block w-full text-center p-4 bg-gray-500 text-white font-bold rounded-md mb-4 hover:bg-gray-600">
                  Sign Up
                </button>
              </Link>
            </>
          )}
        </div>
      )}
    </header>
  );
};

export default Navbar;
