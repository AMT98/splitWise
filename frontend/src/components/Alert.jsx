import { useDispatch, useSelector } from "react-redux";
import { CiSquareCheck } from "react-icons/ci";
import { MdErrorOutline } from "react-icons/md";
import { SlClose } from "react-icons/sl";
import { useEffect } from "react";
import { hideAlert } from "../reducers/alert";

const Alert = () => {
  const dispatch = useDispatch();
  const { isVisible, message, type } = useSelector((state) => state.alert);

  useEffect(() => {
    if (isVisible) {
      const timeId = setTimeout(() => {
        dispatch(hideAlert());
      }, 5500);

      return () => clearTimeout(timeId);
    }
  }, [isVisible, dispatch]);

  if (!isVisible) return null;
  const borderColor =
    type === "success" ? "border-green-600" : "border-red-600";
  const iconColor = type === "success" ? "text-green-600" : "text-red-600";
  return (
    <div
      role="alert"
      className={`fixed bottom-4 left-4 z-50 rounded-xl border p-4 bg-white shadow-lg flex items-start gap-4 ${borderColor}`}
    >
      <div className="flex items-start gap-4">
        <span className={iconColor}>
          {type === "success" ? <CiSquareCheck /> : <MdErrorOutline />}
        </span>

        <div className="flex-1">
          <strong className="block font-medium text-gray-900">{message}</strong>
        </div>

        <button
          onClick={() => dispatch(hideAlert())}
          className="text-gray-500 transition hover:text-gray-600"
        >
          <SlClose />
        </button>
      </div>
    </div>
  );
};

export default Alert;
