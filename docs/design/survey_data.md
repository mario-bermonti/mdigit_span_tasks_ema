# Design of survey data

## Requirements

- Create a data object with the minimum reasonable data that survey data should have in a research study
- Return data to caller 
- Objects must be serializable

## Structure

### Custom objects

- Survey data object
  - Session level info
  - List of survey items
  
- Item data object

### Interface between research_package and survey:

higher level functions:
- convert rp to json
- format survey metadata
- format survey items data

helpers functions:
- format response
  - date
  - single choice
- format choices
  - date
  - single choice