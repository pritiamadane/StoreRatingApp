Store Rating WebApp

Project Overview
This is a Ruby on Rails web application designed to allow users to submit ratings for stores registered on the platform. The application includes three user roles: System Admin, Normal User, and Store Owner, each with specific functionalities. 

Features

System Admin
* Add stores, normal users, and admin users to the system.
* View a dashboard displaying:
  - Total Stores
  - Total Users
  - Total Ratings Submitted
* User management:
  - Add/Edit/Delete users (fields: Name, Email, Address, Role, Password)
  - Filter users based on Name, Email, Address, and Role.
* Store management:
  - Add/Edit/Delete stores (fields: Name, Email, Address, Rating)
  - Filter stores based on Name, Email, and Address.
* View user details including Name, Email, Address, Role, and Rating (for Store Owners).
* Logout functionality.

Normal User
* Sign up and log in to the platform.
* Change password after login.
* View a list of all registered stores with:
  - Name
  - Address
  - Overall Rating
  - My Submitted Rating
* Search for stores based on Name or Address.
* Submit or modify ratings (1 to 5) for individual stores.
* Logout functionality.

Store Owner
* Log in to the platform.
* Change password after login.
* Dashboard displaying:
  - List of users who submitted ratings for their store.
  - Average total ratings for their store.
* Logout functionality.

Validation Rules
* Name: 20 to 60 characters.
* Address: Up to 400 characters.
* Password: 8 to 16 characters, must include at least one uppercase letter and one special character.
* Email: Must be a valid email address.

Sorting and Filtering
* All data tables include sorting (ascending/descending) functionality on key fields such as Name and Email.
* Filters are available for important fields like Name, Email, Address, and Role.

Technical Requirements
* Backend: Ruby on Rails.
* Frontend: HTML, CSS (following best practices for usability and responsiveness).
* Database: MySQL.
* Follow best practices for database schema design.

Installation and Setup
1. Prerequisites:
   - Ruby (>= 3.3.6)
   - Rails (>= 7.0)
   - MySQL
   - Git

2. Clone the repository:
   git clone https://github.com/pritiamadane/StoreRatingApp.git
   cd store-rating-platform

3. Install dependencies:
   bundle install

4. Database setup:
   - Update config/database.yml with your MySQL credentials.
   - Run migrations:
     rails db:create db:migrate

5. Run the server:
   rails server
   Access the application at http://localhost:3000.

Testing
* Run tests:
  rails test
