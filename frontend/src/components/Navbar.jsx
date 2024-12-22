import { Link } from "react-router-dom";
const Navbar = () => {
  return (
    <header className="w-full bg-white fixed top-0 left-0 z-50">
      <nav className="container mx-auto p-4 flex justify-between items-center min-w-full">
        <div>
          <h1 className="text-3xl self-center">Splitwise</h1>
        </div>
        <div className="flex gap-4">
          <Link to="/login">
            <button className="border p-4 bg-indigo-500 text-white font-bold rounded-md">
              Login
            </button>
          </Link>
          <Link to="/signup">
            <button className="border p-4 bg-gray-500 text-white font-bold rounded-md">
              Sign Up
            </button>
          </Link>
        </div>
      </nav>
    </header>
  );
};

export default Navbar;
