# 🍽️ Meal Menu Booking System

A full-stack **Ruby on Rails** application for managing daily employee food menu bookings.

Employees can log in via **magic links or Google**, view daily menus, and submit responses. Admins can manage menus, view responses, and export data to Excel.

---

## 📸 Screenshots

### 🔐 Magic Link Login
<img width="959" alt="image" src="https://github.com/user-attachments/assets/450cc673-82ad-4cfb-a7c8-b3669c368668" />

### 📅 Daily Menu Dashboard
<img width="959" alt="image" src="https://github.com/user-attachments/assets/4c40cf55-a88e-4864-a506-3c52319d737c" />

### 📋 Employee Response Summary
<img width="959" alt="image" src="https://github.com/user-attachments/assets/c6972827-b84b-400c-8c87-736c361eb8d9" />

---

## 🚀 Features

- ✅ Magic link login via email
- ✅ Google OAuth login via OmniAuth
- ✅ Daily menu creation (Admin)
- ✅ Responsive dashboard
- ✅ Role-based access (Admin, Employee)
- ✅ Export responses to Excel
- ✅ Bootstrap 5.3 UI with icons
- ✅ Fully customizable and extendable

---

## 🛠️ Tech Stack

| Layer         | Technology                      |
| ------------- | ------------------------------- |
| Backend       | Ruby on Rails                   |
| Authentication| Devise + Magic Link + OmniAuth  |
| Styling       | Bootstrap 5.3 + Bootstrap Icons |
| Excel Export  | Axlsx / caxlsx                  |
| Database      | MySQL           |
| Frontend      | Turbo / Hotwire                 |

---

## 🧑‍💻 Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/meal-menu-app.git
cd meal-menu-app
2. Install Dependencies
bash
Copy
Edit
bundle install
yarn install # if using js bundling
3. Set up the Database
bash
Copy
Edit
rails db:create db:migrate
4. Start the Server
bash
Copy
Edit
rails server
Visit: http://localhost:3000

🔐 Environment Setup
Create a .env file for local environment variables:

dotenv
Copy
Edit
GMAIL_USERNAME=your_gmail@gmail.com
GMAIL_PASSWORD=your_gmail_app_password
DEVISE_SECRET_KEY=your_devise_secret
GOOGLE_CLIENT_ID=your_google_client_id
GOOGLE_CLIENT_SECRET=your_google_secret
Make sure these are not committed. .env is in .gitignore.

📤 Export to Excel
Admins can export responses:

Entire dataset

Or by selected date

Excel files are generated using Axlsx.

👥 Roles
Admin: Full access (menus, responses, export)

Employee: Can view menu and submit response

🚧 TODO / Future Features
📱 Mobile-friendly UI

📅 Weekly menu planning

🔔 Email reminders

✨ Credits
Made with ❤️ by Shubham Dongarjal
