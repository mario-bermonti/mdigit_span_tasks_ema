# Design of Authentication and Participant

## Authentication
### Requirements
- Sign in to fcm (returns a Participant object)

## Participant
### Requirements
- Contains data about a single study Participant

### Structure

- Data
  - id
  - firebase cloud messaging (fcm) tokens
  - registration time
  - nickname
  - avatar
  - timezone
  - location (country level)

- Behaviors
  - Sign in to fcm
