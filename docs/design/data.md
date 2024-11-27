# Detail plan of the data the app will collect

## Dimensions

### Participants

- Description:
  - General information about the user, their credentials, and their device
- Components (order of priority):
  - Participant ID
  - Firebase Auth ID
  - Messaging tokens
  - Date first time app launched
  - Date notifications accepted
  - Date consent
  - App version
  - Installation date
  - Locale
  - Timezone
  - Location (country level)
  - Nickname
  - Pic

### Notifications

- Description:
  - Metadata about the notifications delivered to the user and their interaction with them
- Components (order of priority):
  - Participant id
  - Notification id
  - Date time sent
  - Date time received
  - Date time tapped
  - Notification type (e.g., EMA)

### Cognitive tasks

- Description:
  - Metadata about the cognitive tasks and data about the trials
- Components (order of priority):
  - Metadata
    - Session
      - Participant id
      - Session id
      - Start time
      - End time
    - Device
      - Participant id
      - Session id
      - Aspect ratio
      - OS
      - OS version
      - Device type/model
      - Height
      - Width
  - Trials
    - Participant id
    - Session id
    - Trial type
    - Stim
    - Response
    - Start time
    - End time

### Surveys

- Description:
  - Metadata about the cognitive tasks and data about the trials
- Components (order of priority):
  - Metadata
    - Id
    - Description
    - Start time
    - End time
  - Items
    - Id
    - Description
    - Start time
    - End time
    - Type
    - Response
