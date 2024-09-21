import 'package:research_package/research_package.dart';

import 'consent_docs.dart';

RPInstructionStep instructionStep = RPInstructionStep(
  identifier: "consentInstruction",
  title: "¡Te damos la bienvenida!",
  detailText:
      """mDigits es parte de un estudio de investigación realizado por la Ponce Health Sciences University (PHSU).

A continuación te ofreceremos información sobre el estudio para que puedes decidir si te interesa participar.
      
Te adelantamos que tu participación será sencilla y nos ayudará mucho.

¡Gracias por tu apoyo!""",
  text: "¡Nos alegra tu interés en nuestro estudio!",
);

RPVisualConsentStep consentVisualStep = RPVisualConsentStep(
    identifier: "visualStep", consentDocument: consentDocumentSummary);

RPConsentReviewStep consentReviewStep = RPConsentReviewStep(
  identifier: "consentReview",
  title: 'Confirmación',
  consentDocument: consentDocumentFull,
  reasonForConsent:
      'Al presionar "ACEPTAR" aceptas a participar en el estudio.',
  text: '¿Aceptas?',
);

RPCompletionStep completionStep = RPCompletionStep(
  identifier: "consentCompletion",
  title: "¡Gracias por tu apoyo!",
  text: "Guardamos tu respuesta",
);
