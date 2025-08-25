import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/auth/auth.dart';
import 'package:mdigits/src/auth/participant.dart';
import 'package:mdigits/src/core/ema_db/participant/models/participant.dart'
    as ema_participant;
import 'package:mdigits/src/core/participant/participant_service.dart';

class AuthSetupService {
  late final Participant _participant;
  final ParticipantService _participantService = ParticipantService.init();

  Future<void> initAuth() async {
    _participant = await Auth(auth: FirebaseAuth.instance).signIn();
    Get.put(_participant, permanent: true);
    if (_participant.id.isNotEmpty) {
      final ema_participant.Participant emaParticipant =
          ema_participant.Participant(
        id: _participant.id,
      );
      _participantService.save(participant: emaParticipant);
    }
  }
}
