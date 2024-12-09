## Participants

- Description:
  - General information about the user, their credentials, and their device
- Components (order of priority):
  - Participant ID
  - FCM tokens
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

## Components

- Participant Service
  - Exposes the participant data to the app
- Participant Repository
  - Interacts with dbs to update data (read, write/update)
- Participant model
  - Contains data
  - Serialization operations
