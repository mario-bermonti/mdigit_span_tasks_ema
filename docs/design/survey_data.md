# Design of survey data

## Requirements

- Create a data object with the minimum reasonable data that survey data should have in a research study
- Return data to caller 
- Objects must be serializable

## Structure

### Custom objects

- Survey data object
  - Survey level info
  - List of survey items
  
- Item data object
  - metadata about item
  - response
