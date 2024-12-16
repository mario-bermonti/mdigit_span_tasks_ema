# Design of EMADB package

Goal: Provide a simple API for storing and retrieving EMA study data from remote databases and
cache basic data locally to address temporary connectivity issues.

## Requirements

- Store and retrieve study data from remote dbs
- Handle data collected longitudinally (recurring) and cross-sectionally (one-time)
- Handle data from different sources (e.g., surveys, cognitive tasks, mobile sensors)
- Handle metadata about the study (participant progress) and participants (e.g., credentials,
  basic info)
- Provide some convenience objects for storing basic data locally (e.g., participant credentials,
  participant progress)

## Structure

- EMADB: Serves as the user-facing API
- DataManager: Interface that standardizes the methods for fetching and storing data that will be
  implemented by the different data sources
- CrossSectionalData
- LongitudinalData
- DBCache: Cache basic data locally. This object will not adhere to the DataManager interface.
- Models
  - Metadata
  - SurveyData
  - CognitiveTaskData
  - ParticipantData
