import { CiSquareCheck } from "react-icons/ci";
import { MdErrorOutline } from "react-icons/md";
import { SlClose } from "react-icons/sl";

const Alert = () => {
  return (
    <div
      role="alert"
      className="rounded-xl border border-gray-100 bg-white p-4"
    >
      <div className="flex items-start gap-4">
        <span className="text-green-600">
          <CiSquareCheck />
        </span>
        <span className="text-red-600">
          <MdErrorOutline />
        </span>

        <div className="flex-1">
          <strong className="block font-medium text-gray-900">
            {" "}
            Changes saved{" "}
          </strong>

          <p className="mt-1 text-sm text-gray-700">
            Your product changes have been saved.
          </p>
        </div>

        <button className="text-gray-500 transition hover:text-gray-600">
          <SlClose />
        </button>
      </div>
    </div>
  );
};

export default Alert;
