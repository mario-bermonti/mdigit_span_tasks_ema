import 'package:research_package/research_package.dart';

RPConsentSection overviewSection = RPConsentSection(
    type: RPConsentSectionType.Overview,
    summary: "overview.title",
    content: "overview.content");

RPConsentSection aboutUs = RPConsentSection(
    type: RPConsentSectionType.AboutUs,
    summary: "This is a summary for About Us.",
    content: "Info about us");

RPConsentSection dataGatheringSection = RPConsentSection(
    type: RPConsentSectionType.DataGathering,
    summary: "datagathering.title",
    content: "datagathering.content");

RPConsentSection privacySection = RPConsentSection(
    type: RPConsentSectionType.Privacy,
    summary: "privacy.title",
    content: "privacy.content");

RPConsentSection timeCommitmentSection = RPConsentSection(
    type: RPConsentSectionType.TimeCommitment,
    summary: "This is a summary for Time Commitment.",
    content:
        "Time commitment dolor sit amet, consectetur adipiscing elit. Aenean a mi porttitor, bibendum elit elementum, placerat augue. Quisque eu sollicitudin tortor, sed egestas ante. Sed convallis, mauris quis malesuada convallis, lectus ante vestibulum ante, vel lobortis magna dui eu nisl. Proin ac pellentesque nulla. Morbi facilisis dui aliquam quam pulvinar efficitur. Duis at lorem vitae leo pharetra ultricies. Proin viverra eleifend varius. Nulla sed nisi ut enim placerat venenatis. Maecenas imperdiet accumsan ligula id varius. Donec rhoncus gravida odio vitae convallis.Nullam at tempor erat. Praesent euismod orci nec sollicitudin placerat. Nunc nec nibh efficitur, mattis ante sit amet, scelerisque libero. Aliquam et mollis erat. Pellentesque aliquam convallis turpis sit amet molestie. Duis accumsan venenatis imperdiet. Integer quis est non elit varius mattis. Donec hendrerit in nisl eget sollicitudin. Nulla sapien lacus, mattis non orci sed, commodo tincidunt risus.");

RPConsentSection studyTasksSection = RPConsentSection(
    title: "What should you do?",
    type: RPConsentSectionType.StudyTasks,
    summary: "This is a summary for Study Tasks.",
    content: "Study Tasks dolor sit amet");

RPConsentSection studySurveySection = RPConsentSection(
    type: RPConsentSectionType.StudySurvey,
    summary: "This is a summary for Study Survey.",
    content: "Study Survey dolor sit amet");

RPConsentSection welcomeSection = RPConsentSection(
    type: RPConsentSectionType.Welcome,
    summary: "This is a summary for Welcome.",
    content: "Welcome dolor sit amet");

RPConsentSection withdrawingSection = RPConsentSection(
    type: RPConsentSectionType.Withdrawing,
    summary: "This is a summary for Withdrawing.",
    content: "Withdrawing dolor sit amet");

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
  identifier: "consentreviewstepID",
  title: 'Consent Review',
  consentDocument: consentDocumentFull,
  reasonForConsent: 'informed_consent.agree_text',
  text: 'informed_consent.agree_confirm',
);

RPVisualConsentStep consentVisualStep = RPVisualConsentStep(
    identifier: "visualStep", consentDocument: consentDocumentSummary);

RPInstructionStep instructionStep = RPInstructionStep(
  identifier: "instructionID",
  title: "Welcome!",
  detailText:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ultricies feugiat turpis nec efficitur. Integer in pharetra libero. Proin a leo eu enim porttitor hendrerit. Suspendisse vestibulum interdum mollis. Donec in sapien ut orci ultricies laoreet. Ut maximus ante id arcu feugiat scelerisque. Proin non rutrum libero. Aliquam blandit arcu ac dolor consequat maximus. Integer et dolor quis quam tempor porta quis vel nibh. Phasellus ullamcorper fringilla lorem, ac tempus sem cursus a. Aliquam maximus facilisis quam. Morbi hendrerit tempor tellus, ac hendrerit augue tincidunt eu. Cras convallis lorem at nulla mattis tristique.",
  footnote: "(1) Important footnote",
  text: "informed_consent.welcome_text",
);

RPCompletionStep completionStep = RPCompletionStep(
  identifier: "completionID",
  title: "informed_consent.thanks",
  text: "informed_consent.document_saved",
);
