# Course Subscription App

## 1. Introduction

This application is a prototype Course Subscription system built using ServiceNow’s **App Engine Studio** and **UI Builder**. It enables users to:

- View available courses
- Subscribe/unsubscribe to courses
- Manage their subscriptions

This project demonstrates table design, business logic, and user interface development within the ServiceNow platform.

---

## 2. Features & Requirement Mapping

| Feature                  | Description                                                                 | Requirement Mapping            |
|--------------------------|-----------------------------------------------------------------------------|--------------------------------|
| **Course Listing**       | Custom `course` table shown using a Repeater component in UI Builder.       | Course listing view            |
| **Course Detail View**   | Default admin view for adding new courses. *(Optional)*                     | Course detail (if required)    |
| **Course Subscription**  | Subscriptions handled via `subscription` table and toggle button on cards.  | Subscription interaction       |
| **Duplicate Prevention** | Business Rule prevents same user subscribing multiple times.                | Business rule logic            |
| **UI Experience**        | Built using “CourseHubExperience” with dynamic data resources.               | UI Builder experience          |
| **Toggle Logic**         | Script handles creation/deletion of subscriptions.                          | Script logic                   |
| **Subscribed Courses**   | Filtered view of user's subscribed courses using user reference.            | User-specific view             |

*Screenshots referenced: `Ui.png`, `course.png`, `builder.png`, `buisness.png`, `toggle.png`, `script.png`.*

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
  •Ui.png - Course listing view with repeater component
  •course.png - Course detail view for admin
  •builder.png - UI Builder setup showing subscription toggle
  •business.png - Business rule for duplicate prevention
  •toggle.png - Toggle script logic implementation
  •script.png - Subscribed courses filtered view

