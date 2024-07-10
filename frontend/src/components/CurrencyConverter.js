import React, { useState } from 'react';

const CurrencyConverter = () => {
  const [formData, setFormData] = useState({
    original_currency: '',
    target_currency: '',
    amount: ''
  });
  const [conversionResult, setConversionResult] = useState(null); // State to hold conversion result

  const handleSubmit = async (e) => {
  e.preventDefault();

  try {
    const response = await fetch(`http://localhost:3000/currency_conversions`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        // Avoid setting other headers unless necessary
      },
      body: JSON.stringify(formData),
    });

    if (!response.ok) {
      throw new Error('Network response was not ok');
    }

    const data = await response.json();
    setConversionResult(data); 
  } catch (error) {
    console.error('Error:', error);
    // Handle errors
  }
};

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((prevData) => ({
      ...prevData,
      [name]: value
    }));
  };

  return (
    <div className="max-w-md mx-auto mt-16 p-6 bg-white shadow-md rounded-md">
    <h2 className='text-center text-lg font-bold'> Original Currency </h2>
      <form onSubmit={handleSubmit} className="space-y-4">
        <div>
          <label className="block mb-1 font-medium">Original Currency:</label>
          <input
            type="text"
            name="original_currency"
            value={formData.original_currency}
            onChange={handleChange}
            className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500"
          />
        </div>
        <div>
          <label className="block mb-1 font-medium">Target Currency:</label>
          <input
            type="text"
            name="target_currency"
            value={formData.target_currency}
            onChange={handleChange}
            className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500"
          />
        </div>
        <div>
          <label className="block mb-1 font-medium">Amount:</label>
          <input
            type="number"
            name="amount"
            value={formData.amount}
            onChange={handleChange}
            className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500"
          />
        </div>
        <button
          type="submit"
          className="w-full py-2 px-4 bg-blue-500 text-white rounded-md hover:bg-blue-600 focus:outline-none focus:bg-blue-600"
        >
          Convert
        </button>
      </form>

      {conversionResult && (
        <div className="mt-4">
          <h2 className="text-lg font-medium">Conversion Result:</h2>
          <p><span className="font-medium">Original Currency:</span> {conversionResult.original_currency}</p>
          <p><span className="font-medium">Target Currency:</span> {conversionResult.target_currency}</p>
          <p><span className="font-medium">Original Amount:</span> {conversionResult.original_amount}</p>
          <p><span className="font-medium">Converted Amount:</span> {conversionResult.converted_amount}</p>
          <p><span className="font-medium">Exchange Rate:</span> {conversionResult.exchange_rate}</p>
          <p><span className="font-medium">Conversion Date:</span> {new Date(conversionResult.created_at).toLocaleString()}</p>
        </div>
      )}
    </div>
  );
};

export default CurrencyConverter;
