
# 📚 Submission Reminder App

A shell-based application that helps track student assignment submissions and reminds students who haven't submitted. Built using Bash scripts, this app is ideal for educators or administrators managing multiple assignments.

---

## 📑 Table of Contents

- [📦 Project Overview](#%F0%9F%93%A6-project-overview)
- [🗂️ Directory Structure](#%F0%9F%97%82%EF%B8%8F-directory-structure)
- [🛠️ Setup Instructions](#%F0%9F%9B%A0%EF%B8%8F-setup-instructions)
- [🚀 How the App Works](#%F0%9F%9A%80-how-the-app-works)
- [✏️ Update Assignment Info](#%E2%9C%8F%EF%B8%8F-update-assignment-info)
- [🌿 Git Branching Workflow](#%F0%9F%8C%BF-git-branching-workflow)
- [📄 Files Explained](#%F0%9F%93%84-files-explained)

---

## 📦 Project Overview

This app creates a personalized environment for tracking assignment submissions. It reads from a list of students and their submission statuses, then reminds those who haven't submitted. You can also update the assignment name and deadline using a companion script.

---

## 🗂️ Directory Structure

When you run the setup script, it creates a folder named `submission_reminder_{yourName}` with the following structure:

```
submission_reminder_{yourName}/
├── app/
│   └── reminder.sh
├── modules/
│   └── functions.sh
├── config/
│   └── config.env
├── assets/
│   └── submissions.txt
├── startup.sh
└── image.png
```

---

## 🛠️ Setup Instructions

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/submission_reminder_app_yourusername.git
   cd submission_reminder_app_yourusername
   ```

2. Run the setup script:

   ```bash
   ./create_environment.sh
   ```

3. Enter your name when prompted. This will create a new environment folder with all necessary files.

---

## 🚀 How the App Works

After setup:

1. Navigate into your environment folder:

   ```bash
   cd submission_reminder_{yourName}
   ```

2. Run the startup script:

   ```bash
   ./startup.sh
   ```

This will:

- Load the assignment name and deadline from `config.env`
- Read student records from `submissions.txt`
- Display reminders for students who haven't submitted the assignment

---

## ✏️ Update Assignment Info

To change the assignment name and deadline:

1. Run the copilot script:

   ```bash
   ./copilot_shell_script.sh
   ```

2. Enter the new assignment name and days remaining when prompted.

3. Confirm if you want to run the app immediately.

---

## 🌿 Git Branching Workflow

Use two branches in your GitHub repository:

- `feature/setup` – For development and testing.
- `main` – Final version with only the following files:
  - `create_environment.sh`
  - `copilot_shell_script.sh`
  - `README.md`

Merge your feature branch into `main` once development is complete.

---

## 📄 Files Explained

### `create_environment.sh`

- Prompts for your name
- Creates the directory `submission_reminder_{yourName}`
- Sets up subdirectories: `app`, `modules`, `config`, `assets`
- Populates each file with predefined content
- Adds at least 5 student records to `submissions.txt`
- Makes all `.sh` files executable

### `copilot_shell_script.sh`

- Prompts for assignment name and days remaining
- Validates inputs
- Updates `config.env` with new values
- Optionally runs the app after updating

### `startup.sh`

- Checks if `reminder.sh` exists
- Executes it to display reminders

### `reminder.sh`

- Sources `config.env` and `functions.sh`
- Displays assignment name and deadline
- Calls `check_submissions` to show pending students

### `functions.sh`

- Defines `check_submissions` function
- Reads `submissions.txt`
- Filters students who haven't submitted the current assignment

### `config.env`

Stores:

```bash
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
```

### `submissions.txt`

Sample format:

```
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
...
```
