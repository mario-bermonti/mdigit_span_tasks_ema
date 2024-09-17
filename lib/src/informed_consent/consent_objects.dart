import 'package:research_package/research_package.dart';

RPConsentSection overviewSection = RPConsentSection(
  type: RPConsentSectionType.Overview,
  summary:
      "Usamos mDigits para estudiar cómo las personas recuerdan información reciente",
  content:
      """mDigits nos permite estudiar cómo funciona la memoria de las personas para recordar información reciente en la vida cotidiana. Por ejemplo, cuán bien recordamos información luego de caminar o ver una película.

Usamos esta información para entender cómo funciona la memoria de las personas y cómo podemos mejorarla.""",
);

RPConsentSection aboutUs = RPConsentSection(
  type: RPConsentSectionType.AboutUs,
  summary: "¡Somos el CHTLab!",
  content:
      """Somos el laboratorio de investigación Cognition, Health, and Technology (CHTLab) de la Ponce Health Sciences University (PHSU).
      
En el CHTLab estudiamos cómo la memoria, la atención y otros procesos cognitivos que nos permiten pensar se relacionan con la salud y cómo podemos mejorarlos.""",
);

RPConsentSection dataGatheringSection = RPConsentSection(
    type: RPConsentSectionType.DataGathering,
    summary:
        "Recogemos información sobre cuán bien las personas recuerdan información nueva",
    content:
        """mDigits nos permite recoger información sobre cuán bien recuerdas información nueva completando actividades de memoria.

También recogemos alguna información básica sobre ti como tu edad y nivel educativo. 
        
Completarás todas las actividades en este celular.""");

RPConsentSection studyTasksSection = RPConsentSection(
    type: RPConsentSectionType.StudyTasks,
    summary: "Completarás unas actividades de memoria",
    content: """En estas actividades verás una lista de números. 

En algunas ocasiones recordarás la lista de números en el orden en que los viste. 

En otras ocasiones recordarás la lista de atrás para adelante.

mDigits te guiará para completar las actividades con instrucciones claras y sencillas. También completarás ejercicios de practica.""");

RPConsentSection studySurveySection = RPConsentSection(
    type: RPConsentSectionType.StudySurvey,
    summary: "Completarás cuestionarios sencillos",
    content:
        """Completarás un cuestionario con información básica sobre ti como tu 
        edad y nivel educativo.
        
También completarás un cuestionario sobre tu salud como si padeces condiciones de salud como diabetes o alta presión.""");

RPConsentSection privacySection = RPConsentSection(
    type: RPConsentSectionType.Privacy,
    summary: "No parearemos tus datos con tu nombre y  protegeremos tus datos",
    content:
        """No preguntaremos tu nombre, número de teléfono ni ninguna otra información que pueda identificarte. Así que nadie podrá saber que los datos te pertenecen a ti.
        
También protegeremos tus datos convirtiéndolos en un código secreto usando un proceso llamado "encriptar".""");

RPConsentSection timeCommitmentSection = RPConsentSection(
    type: RPConsentSectionType.TimeCommitment,
    summary: "Completarás las actividades de memoria diariamente por 2 semanas",
    content:
        """Completarás las actividades de memoria 3 veces al día durante la mañana, tarde y noche.
        
Completarás las actividades durante 2 semanas.""");

RPConsentSection welcomeSection = RPConsentSection(
    type: RPConsentSectionType.Welcome,
    summary: "¡Te damos la bienvenida al equipo mDigits!",
    content:
        """Tu participación es sumamente importante y nos ayudará a entender 
cómo funciona la memoria cuando tratamos de recordar información nueva.""");

RPConsentSection withdrawingSection = RPConsentSection(
    type: RPConsentSectionType.Withdrawing,
    summary: "Puedes terminar de participar en cualquier momento",
    content:
        "Solo tienes que desinstalar la aplicación si decides no continuar participando en el estudio.");

RPConsentDocument consentDocumentSummary = RPConsentDocument(
  title: 'Informed Consent - Summary',
  sections: [
    overviewSection,
    aboutUs,
    dataGatheringSection,
    studyTasksSection,
    timeCommitmentSection,
    privacySection,
    welcomeSection,
  ],
);

RPConsentDocument consentDocumentFull = RPConsentDocument(
  title: 'Informed Consent - Full',
  sections: [
    overviewSection,
    aboutUs,
    dataGatheringSection,
    studyTasksSection,
    timeCommitmentSection,
    privacySection,
    withdrawingSection,
    welcomeSection,
  ],
);

RPConsentReviewStep consentReviewStep = RPConsentReviewStep(
  identifier: "consentReview",
  title: 'Consent Review',
  consentDocument: consentDocumentFull,
  reasonForConsent: 'informed_consent.agree_text',
  text: 'informed_consent.agree_confirm',
);

RPVisualConsentStep consentVisualStep = RPVisualConsentStep(
    identifier: "visualStep", consentDocument: consentDocumentSummary);

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

RPCompletionStep completionStep = RPCompletionStep(
  identifier: "consentCompletion",
  title: "¡Gracias por tu apoyo!",
  text: "Guardamos tu respuesta",
);
