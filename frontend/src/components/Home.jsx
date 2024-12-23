import { Link } from "react-router-dom";

const Home = () => {
  return (
    <div className="bg-white min-h-screen overflow-x-hidden">
      <div className="relative px-6 lg:px-8">
        <div className="mx-auto max-w-7xl py-12 sm:py-24 lg:py-32">
          <div className="text-center">
            <h1 className="text-5xl font-semibold tracking-tight text-gray-900 sm:text-7xl">
              Welcome to <span className="text-indigo-500">Splitwise</span>
            </h1>
            <p className="mt-8 text-lg font-medium text-gray-500 sm:text-xl">
              Track and split your bills with friends and family.
            </p>
          </div>

          <section className="py-12 px-4 text-center">
            <h2 className="text-3xl font-semibold text-gray-800 mb-8">
              Why Choose Splitwise
              <span className="text-indigo-500 animate-pulse">?</span>
            </h2>
            <div className="flex flex-wrap justify-center gap-8">
              <div className="bg-white p-6 rounded-lg shadow-lg max-w-xs">
                <h3 className="text-xl font-semibold mb-4 border p-2 rounded-lg">
                  Simple Bill <span className="text-indigo-500">Splitting</span>
                </h3>
                <p>
                  Divide your expenses evenly or customize how you split bills
                  with ease.
                </p>
              </div>
              <div className="bg-white p-6 rounded-lg shadow-lg max-w-xs">
                <h3 className="text-xl font-semibold mb-4 border p-2 rounded-lg">
                  Track <span className="text-indigo-500">Expenses</span>
                </h3>
                <p>
                  Monitor your shared expenses and balances with a clear
                  overview.
                </p>
              </div>
              <div className="bg-white p-6 rounded-lg shadow-lg max-w-xs">
                <h3 className="text-xl font-semibold mb-4 border p-2 rounded-lg">
                  Group <span className="text-indigo-500">Management</span>
                </h3>
                <p>
                  Manage multiple groups and track who owes what, all in one
                  place.
                </p>
              </div>
            </div>
          </section>
          <section className="bg-gray-800 text-white py-12 text-center rounded-md">
            <h2 className="text-3xl font-semibold mb-4">
              Start Sharing and Saving Today
            </h2>
            <p className="mb-6">
              Join Splitwise now and make splitting bills simpler than ever!
            </p>
            <Link to="/signup">
            <button className="rounded-md bg-indigo-600 px-6 py-3 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500">
              Sign Up Now
            </button>
            </Link>
          </section>
        </div>
      </div>
    </div>
  );
};

export default Home;
