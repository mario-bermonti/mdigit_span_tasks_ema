import 'package:research_package/research_package.dart';

import 'consent_docs.dart';

RPInstructionStep instructionStep = RPInstructionStep(
  identifier: "consentInstruction",
  title: "¡Te damos la bienvenida!",
  text:
      """¡Nos alegra tu interés en nuestro estudio!\n\nmDigits es parte de un estudio de investigación realizado por la Ponce Health Sciences University (PHSU).\n\nNecesitarás aceptar participar en el estudio para utilizar mDigits.""",
  detailText:
      """A continuación te ofreceremos información sobre el estudio para que puedes decidir si te interesa participar.\n\nTe adelantamos que tu participación será sencilla y nos ayudará mucho.\n\n¡Gracias por tu apoyo!""",
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
