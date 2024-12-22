const Footer = () => {
  return (
    <footer className="bg-white w-full fixed bottom-0 left-0">
      <div className="mx-auto max-w-screen-xl px-4 pb-8 pt-16 sm:px-6 lg:px-8">
        <div className="mt-16 border-t border-gray-100 pt-8">
          <p className="text-center text-xs/relaxed text-gray-500">
            © Splitwise Practice 2024. All rights reserved.
            <br />
            Created with{" "}
            <span className="font-bold">Ruby on Rails and React</span>
          </p>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
