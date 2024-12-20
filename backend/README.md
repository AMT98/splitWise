# Splitwise Clone Project
![dbdiagram](images/splitWise%20.png)

## Installation Steps

Step 1: **Clone the Repository**

Clone the project repository to your local machine:
```
git clone <https://github.com/AMT98/splitWise.git>

cd splitwise-clone
```
Step 2: **Install Dependencies**
```
Install the required Ruby gems:

bundle install
```
Step 3: **Database Configuration**

Create and configure the PostgreSQL database.

Update the config/database.yml file with your database credentials:
```
default: &default
  adapter: postgresql
  encoding: unicode
  pool: 5
  username: <your_username>
  password: <your_password>
  host: localhost

development:
  <<: *default
  database: splitwise_clone_development

test:
  <<: *default
  database: splitwise_clone_test

production:
  <<: *default
  database: splitwise_clone_production
  username: <your_production_username>
  password: <your_production_password>
```
Step 4: **Set Up the Database**

Run the following commands to create and migrate the database:
```
rails db:create
rails db:migrate
```
To seed the database with initial data (if provided):
```
rails db:seed
```
Step 5: **Add Environment Variables**

Set up your secret credentials for JWT authentication and other sensitive data. Use Rails credentials:
```
EDITOR="code --wait" rails credentials:edit
```
Add the following:
```
jwt_secret: <your_jwt_secret>
```
Save and close the editor.

Step 6: **Run the Server**

Start the Rails server:
```
rails server
```
By default, the server runs on http://localhost:3000.

## API Endpoints

**Authentication**

Login: POST /login

Register: POST /register

**Groups**

Create a group: POST /groups

View all groups: GET /groups

**Bills**

Create a bill: POST /bills

View bills for a group: GET /groups/:group_id/bills

Update a bill: PATCH /bills/:id

Delete a bill: DELETE /bills/:id

**Payments**

Record a payment: POST /payments

View payments for a group: GET /groups/:group_id/payments

Delete a payment: DELETE /payments/:id

**Group Memberships**

Add a member to a group: POST /groups/:group_id/memberships

View members of a group: GET /groups/:group_id/memberships

Remove a member from a group: DELETE /groups/:group_id/memberships/:id