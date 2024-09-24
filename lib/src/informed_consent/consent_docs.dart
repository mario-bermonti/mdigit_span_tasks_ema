import 'package:research_package/research_package.dart';

import 'consent_sections.dart';

/// Summary of the informed consent form that is presented interactively and
/// engagingly before the formal full consent form.
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

/// Full formal version of the informed consent form.
/// It is presented during the consent review after the summary consent form. It
/// was designed to present the formal consent that is usually required by IRBs.
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
