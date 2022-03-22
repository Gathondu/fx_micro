# README

# Running the application
* Make sure you have ruby, rails, and postgres installed in your system.

* In the project dir:
  * create a .env file similar to the .env.example file in the project.
  * run `rails db:create` to create the databases.
  * run `rails db:migrate` to create the tables.
  * run `rails db:seed` to populate some of the tables in order to get test data to work with.

* After following the steps above, running `rails server` you should be able to get the app running in your localhost on port `3000`
* navigate to the route `localhost:3000/graphiql` and you should be in a position to see the graphql playground view that will allow you to make various requests to ineract with the data.

## To create a transaction
* run customers query to get a list of customers and select one id.
  save the customer id selected somewhere
  ```
  query {
    customers {
      id
    }
  }
  ```

* run currencies query to get a list of currencies. Select 2 is and save them somewhere.
  ```
  query {
    currencies {
      id
    }
  }
  ```

* now run the transaction mutation to create a transaction record.
  ```
  mutation {
      createTransaction(input: {
        customerId: "saved_customer_id",
        inputAmount: "15.34",
        inputCurrencyId: "first_saved_currency_id",
        outputCurrencyId: "second_saved_currency_id"
      }) {
        transaction {
          id
          customer {
            firstName
            lastName
          }
          inputAmount
          inputCurrency {
            isoCode
          }
          outputAmount
          outputCurrency {
            isoCode
          }
          createdAt
        }
        errors
      }
  }
  ```

* Following this you should now have a transaction record that you can access by first quering the
transactions then querying the transaction with id with the transaction ID to get the single transaction
