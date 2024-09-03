# Design of ema data subpackage

## Requirements
- Handle data collected longitudinally (recurring) and cross-sectionally (one-time)
- Handle survey data
- Handle data cognitive tasks
- Adaptable to handle other types of data

## Structure

- Single object that manages the data
  - Stores participantID
  - Other required data passed as parameters to methods