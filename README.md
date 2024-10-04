
# test_application


A mobile application built with Flutter that provides users with an intuitive interface. It includes user authentication(test) and course management

---


## **Project Structure**

The `lib` directory of this project follows the structure outlined below:

lib/ 
    ├── models/ 
         └── user_model.dart 
    ├── ui/
        ├── screens/ 
            |── authentication/  
                ├── login_screen.dart
                ├── register_screen.dart 
                └── verification_screen.dart 
            ├── courses/ │ 
                │ └── main_screen.dart │ 
        ├── widgets/ 
            └── custom_textfield.dart
    ├── utils/
        └── app_constants.dart 
    └── main.dart


## **File Overview**

Here's a brief overview of each file in the project and how they are connected:

### `models/`
- **course_model.dart**  
  Contains the structure of the course data model used in the main_screen.

### `screens/`
- **authentication/**  
  This folder includes all screens related to authentication like login, registration, and verification.

  - **login_screen.dart**: Handles user login, but only for UI, doesn't connected to real authentication service 
  - **register_screen.dart**: Contains the user registration form, including input validation and redirection to the verification screen.  
  - **verification_screen.dart**: Verifies the user's phone number or email after registration, leading them to the main app.

- **courses/**  
  Contains screens related to course management in the app.

  - **main_screen.dart**: The main screen after login, showing a list of courses. Displays courses based on the course type.

### `widgets/`
- **custom_textfield.dart**  
  A reusable TextField widget used across different screens to maintain consistent UI styling.

### `main.dart`  
The entry point of the application. It defines the main widget tree and handles initial routing.

---

## **Packages Used**

Here is a list of third-party packages used in this project:

1. **[flutter](https://flutter.dev/)**  
   The framework used for building the app.

2. **[pinput](https://pub.dev/packages/pinput)**  
   Used for creating PIN input fields (for example, in the verification screen).






