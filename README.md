# 3.1_BookStoreSQLScript_i308
In this individual assignment you will use a SQL script to create tables in MySQL based on a given relational model and  populate those tables with appropriate data. You will then add additional tables and write basic SELECT queries to retrieve information from the database.

# Step 1: Use the provided assignment31.sql script to create this simple database (5 points) :

Download the assignment31.sql Download assignment31.sqlfile. (Note: We are naming the tables with the "A_" prefix so that they will not conflict with the customer, book, etc. that you will still need for in-class exercises.)

If you have not done so already, create a SQL directory in your Burrow home directory by issuing the following command: mkdir SQL

Use WinSCP or Cyberduck to upload the assignment31.sql file to your SQL directory on Burrow

Making sure you are in your SQL directory on Burrow, log in to your individual MySQL account. (See WATCH | Getting Started with MySQL for help.)

Run the assignment31.sql script by issuing the following command in MySQL: source assignment31.sql This will create the four tables pictured above and populate them with data. Note: the file must be in your SQL directory, and you must log into MySQL from that same directory for this to work!

# Step 2:

Modify the script by adding SQL code at the end of your script to make the following changes to the database. 

1. Create a table named A_bookcase that has the following attributes: bcid, location, num_shelf, capacity

2. Create a table named A_book_bookcase with the following attributes: bookid, bcid, quantity

3. Add statements at the top your script to drop these two new tables so that the script can be run multiple times

4. Insert the data into A_bookcase and A_book_bookcase

5. Change Sean's phone number to 555-123-1111.

6. Add the attribute "format" to the A_book table and update the data to indicate the format of each book. Use an ALTER TABLE followed by an UPDATE statement.

# Step 3: Add the following SELECT queries at the bottom of your script 

1. Find the location of all bookcases with a capacity between 40 and 45
  
2. Find the title and bookcase ID of all books not stored on bookcase 101.
   
3. Find the title, price, publisher, and quantity of all paperback books. 

