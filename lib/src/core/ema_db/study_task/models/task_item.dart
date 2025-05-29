import 'package:mdigits/src/core/ema_db/models/ema_model.dart';

/// Base class for study task items (e.g., survey items, cognitive tasks).
///
/// All methods should depend on this base class, instead that on concrete
/// implementations.
abstract class TaskItem extends EMAModel {}
