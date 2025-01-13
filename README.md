# Airbnb Management System

A Java-based management system for Airbnb that handles hosts, users, bookings and administrative functions. The system uses MySQL for data persistence and implements data structures like Binary Search Trees and Linked Lists.

##  <u> Features </u>

### User Functions
- User registration and login
- Search and view available Airbnb listings 
- Book accommodations
- View booking history
- Cancel bookings
- Rate accommodations
- Make payments via credit card or cash
- Generate booking receipts

### Host Functions
- Host registration and login
- Add new Airbnb listings
- Update listing details
- Remove listings
- View available properties
- Track due payments

### Admin Functions
- View all hosts
- Remove hosts
- Remove specific Airbnb listings
- Monitor platform activity

# <u> Technical Details </u>

### Data Structures Used
- Binary Search Tree (BST) for price-based Airbnb listing organization
- Linked Lists for user and host data management

### Database
- MySQL database with multiple tables for:
  - User details and authentication
  - Host information
  - Airbnb listings
  - Bookings
  - Payments
  - Admin credentials

### Key Components
- `AirBnB.java`: Main entry point
- `Login_SignUp.java`: Authentication system
- `User.java`: User management
- `Host.java`: Host functionality
- `Booking.java`: Booking system
- `Admin.java`: Administrative functions
- `Airbnbdetails.java`: Property details management

## Setup

1. Install MySQL server
2. Import the database schema from `airbnb.sql`
3. Update database credentials in the connection strings
4. Compile and run the Java files

## Database Connection
```java
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airbnb", "root", "");
```

## Requirements
- Java JDK 8 or higher
- MySQL Server
- MySQL Connector/J JDBC driver

## Security Features

- Password-protected login system
- Role-based access control
- Transaction management for bookings
- Input validation

## Installation
1. Clone the repository
```markdown
git clone https://github.com/yourusername/airbnb-management-system.git
cd airbnb-management-system
```
2. Import MySQL database
``` markdown
mysql -u root -p airbnb < airbnb.sql
```
3. Configure database connection
- Open source files in `src` directory
- Update database credentials in the connection strings if needed:

4. Compile and run
```markdown
# Compile Java files
javac -d bin src/*.java

# Run the application 
java -cp bin:lib/* AirBnB
```
## Prerequisites
- Java JDK 8 or higher
- MySQL Server 5.7+
- MySQL Connector/J JDBC driver (included in lib)

## Directory Structure

├── src/ For Source Files               
├── bin/ Complied Class Files             
├── lib/ Dependencies   
├── airbnb.sql  DataBase     
└── README.md

## To start using the application after installation:
1. Run the application
2. Login as:
- Admin (username: Demo, password: demo)
- Host (Create new account)
- User (Create new account)
3. Follow the menu options to use different features