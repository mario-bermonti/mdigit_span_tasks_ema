/// Run a data collection session
/// Running a session includes configuring everything needed and running a
/// cognitive task specificed with [taskRunner].
void startSession({required Function taskRunner}) {
  taskRunner();
}
