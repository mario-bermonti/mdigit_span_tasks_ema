# Design of informed consent

## Requirements

- Ask for permission to send notifications
- Subscribe to remote notifications
- Deliver notifications while app in foreground, background, or terminated
- Tapping on EMA notifications should direct user to the EMA screen

## Components

- Notifications manager
  - Interface between app and remote/local notifications services
- Remote notifications service
  - Configure and manage remote notifications
  - Subscribe to remote notifications
- Local notifications service
  - Note: Only used to deliver notifications while application in the foreground on Android
  - Configure and manage local notifications
