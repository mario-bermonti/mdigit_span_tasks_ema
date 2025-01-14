# Design of ema_db subpackage

Goal: Provide a simple API for storing and retrieving EMA study data from remote databases and
cache basic data locally to address temporary connectivity issues.

## Requirements

- Store and retrieve study data from remote dbs
- Handle data collected longitudinally (recurring) and cross-sectionally (one-time)
- Handle data from different sources (e.g., surveys, cognitive tasks, mobile sensors)
- Handle metadata about the study (e.g., participant progress) and participants (e.g., credentials,
  basic info)
- Provide some convenience objects for storing basic data locally (e.g., participant credentials,
  participant progress) to address temporary connectivity issues.

## Structure

- Separate repositories will be defined for each data type (e.g., study tasks, credentials) to
  maximize flexibility for users and maintainability for developers.
- Remote and local repositories will implement abstract interfaces to standardize them and improve extensibility.
- Local repositories will only be supported for some data types, where it is essential to have the data available offline.
- Repositories will have methods for storing and retrieving data from remote databases.
- Data sources will be defined as needed to abstract core logic from the repositories.
