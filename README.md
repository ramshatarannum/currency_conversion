# Currency Conversion


This project is a minimal Ruby on Rails web application with a React frontend that performs currency conversions using a third-party API. The application uses a service object to encapsulate the API request, ensuring that the external API is not called directly from the controller. The result of the currency conversion is stored in a database record, including details such as the original currency, target currency, original amount, converted amount, and exchange rate.

## Installation
Frontend and Backend are in one reposetory
1. Clone the repository:
    ```sh
    git clone https://github.com/ramshatarannum/currency_conversion.git
    cd currency_conversion
    ```

2. Navigate to the frontend directory:
    ```sh
    cd frontend
    ```

3. Install dependencies:
    ```sh
    npm install
    ```

4. Start the development server:
    ```sh
    npm start
    ```

### Backend

1. Navigate to the backend directory:
    ```sh
    cd currency_converter_api
    ```
2. application dependencies:
    ```sh
    ruby version : 3.2.2
    rails version: 7.0.8.4
    database :postgresql
    ```

3. Install dependencies:
    ```sh
    bundle install
    ```

5. Set up the database:
    ```sh
    rails db:create
    rails db:migrate
    ```

6. Start the Rails server:
    ```sh
    rails server
    ```


## Contact

Your Name - [ramshatarannum07@gmail.com](mailto:yramshatarannum07@gmail.com)

Project Link: [https://github.com/your-username/your-repo-name](https://github.com/your-username/your-repo-name)

