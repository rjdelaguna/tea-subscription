# Tea-Subscription

This api service saves Tea, Subscription, and Customer information. It provides functionality to view subscriptions and their status for an individual customer, begin a new subscription for a customer, and cancel an existing subscription.


To begin:
* Ensure that your local ruby version is 3.2.2
    `$ rbenv local -v`
* To install gems run 
    `$ bundle install`
* Create database
    `$ rails db:{drop,create,migrate,seed}`
* To run tests
    `$ bundle exec rspec`

Schema:
  customer_subscriptions table
    - status: default: 0
    - subscription_id
    - customer_id
    - created_at
    - updated_at

  customers table
    - first_name
    - last_name
    - email
    - address
    - created_at
    - updated_at

  subscriptions table
    - title
    - price
    - frequency
    - tea_id
    - created_at
    - updated_at

  teas table
    - title
    - description
    - temperature
    - brew_time
    - created_at
    - updated_at

Endpoints:
  Return a customers subscriptions
    "customers/:customer_id/customer_subscriptions"
    Response Example:
     {
    "data": {
        "id": null,
        "type": "subscription",
        "attributes": {
            "id": null,
            "customer_id": 1,
            "active": [
                {
                    "id": 5,
                    "title": "Tier 2",
                    "price": "$1.00",
                    "frequency": "weekly",
                    "created_at": "2023-11-26T22:48:34.084Z",
                    "updated_at": "2023-11-26T22:48:34.084Z",
                    "tea_id": 2
                }
            ],
            "cancelled": [
                {
                    "id": 1,
                    "title": "Tier 1",
                    "price": "$5.00",
                    "frequency": "monthly",
                    "created_at": "2023-11-26T22:48:34.074Z",
                    "updated_at": "2023-11-26T22:48:34.074Z",
                    "tea_id": 1
                }
            ]
        }
    }
}

  Create a new customer_subscription
    "customers/:customer_id/:subscription_id/create"
    Response Example:
     {success: "Subscription Created Successfully"}

  Cancel an existing customer_subscription
    "customers/:customer_id/:subscription_id/cancel"
    Response Example:
     {success: "Subscription Cancelled"}