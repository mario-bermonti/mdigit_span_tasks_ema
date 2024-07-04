# Design of survey data

## Requirements

- Create a data object with the minimum reasonable data that survey data should have in a research study
- Return data to caller in a portable format
- Objects must be serializable

## Structure

- Survey data object
  - Session level info
  - List of question objects
  
- Question data object
