/// Base class for all data models in the ema_db package.
///
/// Generic methods should depend on this base class, instead that on concrete
/// implementations to make them flexible.
abstract class EMAModel {
  Map<String, dynamic> toJson();
}
