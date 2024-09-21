import 'package:research_package/research_package.dart';

import 'consent_sections.dart';

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
