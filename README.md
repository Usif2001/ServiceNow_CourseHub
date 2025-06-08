# Course Subscription App

## 1. Introduction

This application is a prototype Course Subscription system built using ServiceNow’s **App Engine Studio** and **UI Builder**. It enables users to:

- View available courses
- Subscribe/unsubscribe to courses
- Manage their subscriptions

This project demonstrates table design, business logic, and user interface development within the ServiceNow platform.

---

## 2. Features & Requirement Mapping

| Feature                    | Description                                                                                                                                              | Assignment Requirement                 |
|----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------|
| Course Listing             | Implemented using custom table `course`. Displayed using repeater component within UI Builder.<br>(Screenshot: `Ui.png`)                                 | Course listing view (PRD01)            |
| Course Detail View         | Default view for admin to add course as shown in screenshot.<br>(Screenshot: `course.png`)                                                               | Course detail (PRD01 - if required)    |
| Course Subscription        | Subscription handled via subscription table. Toggle button on each card performs subscribe/unsubscribe via Data Resource actions.<br>(Screenshot: `builder.png`) | Subscription interaction (PRD02)       |
| Duplicate Prevention       | A Business Rule (`Prevent Duplicate Subscriptions`) prevents the same user from subscribing to the same course more than once.<br>(Screenshot: `business.png`) | Business rule logic (PRD02)            |
| UI Experience              | Created through Experience: `CourseHubExperience`, with a main page using repeater and dynamic Data Resource for subscriptions.                         | UI Builder experience                  |
| Subscribe/Unsubscribe Logic| Created a script for toggle to create and delete subscription from table.<br>(Screenshot: `toggle.png`)                                                  | Script logic (PRD02)                   |
| Subscribed Courses         | Filtered view of courses user is subscribed to using user reference in subscription table.<br>(Screenshot: `script.png`)                                 | User-specific view (PRD02 - Optional)  |




---

## 3. User Interaction Workflow

1. **View Subscription Status**
   - Each course displays a Subscribe/Unsubscribe toggle based on the current user's subscription.

2. **Subscribe to a Course**
   - Clicking **Subscribe** creates a record in the subscription table with the user's `sys_id` and course reference.

3. **Duplicate Prevention**
   - If the user tries to subscribe again, a business rule prevents duplicate entries and can show an alert.

4. **Unsubscribe from a Course**
   - Clicking **Unsubscribe** deletes the corresponding subscription record.

---

## 4. Testing Summary

### Manual UI Testing
- Subscribe/Unsubscribe toggle behavior
- Validation of the duplicate prevention rule
- Correct subscription state per user

### Backend Testing
- Creation of dummy records in the `Subscription` table
- Duplicate insert behavior validation

### Automation
- Tests automated using the **Robot Framework**

---

## 5. Technology Stack

- **Platform:** ServiceNow App Engine Studio
- **Frontend:** UI Builder
- **Logic:** Business Rules, Script Includes
- **Testing:** Manual UI Tests, Robot Framework

## 6.Screenshots
The following screenshots demonstrate the implemented features:

- **Ui.png** – Course listing view with repeater component  
- **course.png** – Course detail view for admin  
- **builder.png** – UI Builder setup showing subscription toggle  
- **business.png** – Business rule for duplicate prevention  
- **toggle.png** – Toggle script logic implementation  
- **script.png** – Subscribed courses filtered view  

