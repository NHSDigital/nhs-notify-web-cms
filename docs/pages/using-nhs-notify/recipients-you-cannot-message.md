---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Recipients you cannot message
parent: Using NHS Notify
nav_order: 5
permalink: /using-nhs-notify/recipients-you-cannot-message
section: Sending a message
---

NHS Notify automatically prevents you from sending messages to people who you should not contact. This includes recipients with certain information on their records.

We check the [Personal Demographics Service (PDS)](https://digital.nhs.uk/services/personal-demographics-service) for recipients with:

- [flagged records](#flagged-records)<!-- markdownlint-disable-line -->
- [exit codes](#exit-codes)
- [a patient death status](#patient-death-status)

You will not be charged for messages we could not send due to information in PDS.

These messages will show as failed messages in your reports.

## Flagged records

Some patients' data is strictly controlled. These records have flags on them in PDS.

### Sensitive flag (S flag)

Patients with a sensitive flag (sometimes called an S flag) have [restricted contact details](https://digital.nhs.uk/services/personal-demographics-service/restricting-access-to-a-patients-demographic-record). We do not have access to any information that could reveal their location.

S flags help to protect patients who may be at risk, such as victims of domestic violence, law court witnesses or vulnerable children awaiting adoption.

### Invalid flag

We're unable to access the records of patients with an invalid flag.

An invalid flag means the patient's NHS number is no longer in use. This could be for safeguarding reasons or because of duplication.

## Exit codes

Exit codes show that patients should not be contacted due to certain circumstances. For example, they're serving in the armed forces.

Exit codes are sometimes called reason for removal codes.

NHS Notify does not show which types of exit codes have been given to each recipient.

## Patient death status

Patients who have died have a death status notification on their record in PDS.

### Formal death status

This means that there's a signed death certificate for the patient.

### Informal death status

This means that a professional has informed the NHS about the patient's death but there's no signed death certificate.
