# 💍 Wedding Planner

A web-based **Wedding Planner and Event Management System** developed using **ASP.NET Web Forms, C#, HTML, CSS, and SQL Server**.

The system helps users explore wedding services, manage wedding-related activities, view venues and ceremonies, maintain wishlists and carts, and provide feedback. It also includes an administrative section for managing categories, venues, wedding types, ceremonies, and other website content.

---

## 📌 Project Overview

**Wedding Planner** is designed to provide an online platform where users can explore and manage different wedding-related services in one place.

The application provides separate functionality for users and administrators.

### 👰 User Features

* User Registration
* User Login
* Browse Wedding Services
* Browse Wedding Types
* View Venues
* View Ceremonies
* Add items to Wishlist
* Add items to Cart
* View Cart
* Feedback Submission
* View Wedding-related Information
* Service and Vendor Information

### 👨‍💼 Admin Features

* Admin Login
* Admin Dashboard
* Manage Categories
* Manage Wedding Types
* Manage Venues
* Manage Ceremonies
* Manage Services
* Manage Feedback
* View User-related Information
* Manage Website Content

---

## 🛠️ Technologies Used

### Frontend

* HTML5
* CSS3
* JavaScript
* ASP.NET Web Forms

### Backend

* C#
* ASP.NET

### Database

* Microsoft SQL Server

### Development Tools

* Visual Studio
* SQL Server Management Studio (SSMS)
* Git
* GitHub

---

## 📂 Project Structure

```text
weedingplanner1/
│
├── Account/
├── App_Code/
├── App_Data/
├── Scripts/
├── Styles/
├── image/
├── video/
│
├── About.aspx
├── About.aspx.cs
├── AboutUs.aspx
├── AboutUs.aspx.cs
├── Cart.aspx
├── Cart.aspx.cs
├── Default.aspx
├── Default.aspx.cs
├── Feedback.aspx
├── Feedback.aspx.cs
├── Home.aspx
├── Home.aspx.cs
├── Login.aspx
├── Login.aspx.cs
├── Registration.aspx
├── Registration.aspx.cs
├── wishlist.aspx
├── wishlist.aspx.cs
├── venue.aspx
├── venue.aspx.cs
├── weedingtype.aspx
├── weedingtype.aspx.cs
│
├── Global.asax
├── Site.master
├── Site.master.cs
├── Web.config
│
└── ...
```

---

## ✨ Main Modules

### 🏠 Home

The home page provides an introduction to the Wedding Planner platform and gives users access to the main wedding services.

### 👤 User Registration & Login

Users can create an account and log in to access the application's features.

### 💒 Wedding Services

Users can explore different wedding-related services and categories.

### 📅 Wedding Types

The application provides information about different types of weddings and related services.

### 📍 Venues

Users can browse available wedding venues and view venue-related information.

### ❤️ Wishlist

Users can save selected services or items for later viewing.

### 🛒 Cart

Users can add selected items/services to the cart and manage their selections.

### ⭐ Feedback

Users can submit feedback about their experience with the website and services.

### 🔐 Admin Panel

Administrators can manage website data and different wedding-related categories through the admin panel.

---

## 🗄️ Database

The project uses **Microsoft SQL Server** for storing application data.

The database can contain information related to:

* Users
* Admins
* Categories
* Wedding Types
* Venues
* Ceremonies
* Services
* Wishlist
* Cart
* Feedback

The database connection is configured in:

```text
Web.config
```

> **Important:** Do not upload real database passwords or other sensitive credentials to GitHub.

---

## ⚙️ How to Run the Project

### 1. Clone the Repository

Open Command Prompt and run:

```bash
git clone https://github.com/anupatil804/weedingplanner1.git
```

Then enter the project folder:

```bash
cd weedingplanner1
```

### 2. Open the Project

Open the project using **Microsoft Visual Studio**.

If a `.sln` solution file is available, open the `.sln` file.

Otherwise, open the ASP.NET Web Forms project through Visual Studio.

### 3. Configure SQL Server

Open **SQL Server Management Studio** and create the required database.

Import or execute the project's SQL database script if one is included.

### 4. Configure the Connection String

Open:

```text
Web.config
```

Update the SQL Server connection string according to your local SQL Server configuration.

Example:

```xml
<connectionStrings>
    <add name="YourConnectionString"
         connectionString="Data Source=YOUR_SERVER;
         Initial Catalog=YOUR_DATABASE;
         Integrated Security=True"
         providerName="System.Data.SqlClient" />
</connectionStrings>
```

Replace:

```text
YOUR_SERVER
YOUR_DATABASE
```

with your local SQL Server details.

### 5. Run the Application

In Visual Studio:

1. Open the project.
2. Make sure the database connection is configured.
3. Build the project.
4. Press **Ctrl + F5** or click **Start**.
5. The application will open in your browser.

---

## 🔐 Security

For security reasons, do not commit the following information to GitHub:

* Database passwords
* API keys
* Private credentials
* Production connection strings
* Personal information

Use local configuration for sensitive information.

---

## 🎯 Project Objectives

The main objectives of this project are:

* Provide an online wedding planning platform.
* Make wedding services easier to explore.
* Allow users to manage selected services.
* Provide venue and ceremony information.
* Provide wishlist and cart functionality.
* Allow users to submit feedback.
* Provide administrators with management functionality.
* Store application information using SQL Server.

---

## 🚀 Future Improvements

Possible future improvements include:

* Online payment integration
* Online booking system
* Vendor registration and management
* Email notifications
* SMS notifications
* Advanced search and filtering
* User profile management
* Wedding budget planner
* Wedding schedule/calendar
* Responsive mobile design
* Admin analytics dashboard
* Cloud deployment

---

## 📸 Screenshots

You can add screenshots of your application here.

Example:

```text
screenshots/
├── home.png
├── login.png
├── registration.png
├── services.png
├── venue.png
├── cart.png
├── wishlist.png
└── admin-panel.png
```

Then add them to this README:

```markdown
![Home Page](screenshots/home.png)
```

---

## 👩‍💻 Developer

**Anushka Patil**

BCA Graduate & Aspiring Software Professional

GitHub:
https://github.com/anupatil804

---

## 📄 License

This project was developed for **educational and project demonstration purposes**.

---

## ⭐ Acknowledgement

This project was developed as a web-based solution for simplifying wedding service exploration and event management.

If you find this project useful, consider giving the repository a ⭐ on GitHub.
