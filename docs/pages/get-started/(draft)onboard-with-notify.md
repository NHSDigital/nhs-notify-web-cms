---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Onboard with NHS Notify
parent: Get started
nav_order: 2
permalink: /get-started/onboard-with-nhs-notify
published: true
---

Use this page to find out what you need to do to onboard with NHS Notify.

1. [Register your interest](#1-register-your-interest)<!-- markdownlint-disable-line -->
2. [Attend an early engagement call](#2-attend-an-early-engagement-call)
3. [Get invited to start integration and onboarding](#3-get-invited-to-start-integration-and-onboarding)
4. [Confirm setup and eligibility](#4-confirm-setup-and-eligibility)
5. [Prepare for technical integration](#5-prepare-for-technical-integration)
6. [Create your templates](#6-create-your-templates)
7. [Create your routing plans](#7-create-your-routing-plans)
8. [Integrate and test with NHS Notify](#8-integrate-and-test-with-nhs-notify)
9. [Meet the technical conformance requirements](#9-meet-the-technical-conformance-requirements)
10. [Complete the connection agreement](#10-complete-the-connection-agreement)
11. [Onboarding complete](#11-onboarding-complete)

## Before you start

NHS organisations or services must be eligible to use NHS Notify before they can onboard.

You can use NHS Notify if your programme or service:

- is part of NHS England
- supports direct care

You'll need to integrate with [NHS Notify API]({% link pages/using-nhs-notify/api.md %}) or [NHS Notify MESH]({% link pages/using-nhs-notify/mesh.md %}) to send messages. You may need a developer or a technical team to do this.

[Try NHS Notify API by using our sandbox environments](https://god.gw.postman.com/run-collection/28740466-ec078d1e-d4d7-4460-92b9-7d79d51f967a?action=collection%2Ffork&source=rip_markdown&collection-url=entityId%3D28740466-ec078d1e-d4d7-4460-92b9-7d79d51f967a%26entityType%3Dcollection%26workspaceId%3D3664098f-4f8b-4edf-874d-ed33e1eea8ed).

## 1. Register your interest

If you’re eligible to use NHS Notify, you can email our onboarding team at <england.nhsnotify@nhs.net> to register your interest.

We'll aim to contact you within 10 working days to arrange an early engagement call.

## 2. Attend an early engagement call

The early engagement call will help NHS Notify to understand your needs. We'll ask you about:

- estimated volumes
- which channels you want to use
- what your organisation or service is trying to achieve

The call will also cover some costing estimates based on the information you give.

## 3. Get invited to start integration and onboarding

After your early engagement call, NHS Notify will prioritise your case along with other onboarding services and organisations.

Due to our current service capacity and features, you may have to wait before you can continue onboarding. We're working hard to increase the scale of our service.

[Read our roadmap to find out what we're doing next]({% link pages/features/roadmap.md %}).

## 4. Confirm setup and eligibility

NHS Notify needs to confirm that your service is eligible and suitable to integrate with its API.

You will need to provide detailed information about:

- your product or service and the organisation it represents
- why you want to use NHS Notify to send messages to patients
- what messages you plan to send
- how your messages will meet the accessible information standard
- how you want to send your messages
- the frequency and volumes of messages you plan to send

You will also need to provide information about:

- what data items you plan to process
- why you need to process this data
- if you use children's data
- what data processing activities you need to undertake
- your product or service's Data Protection Impact Assessment (DPIA)

{% include components/inset-text.html
text='This information will be reviewed by the NHS Notify service team. If your organisation or service is eligible and suitable, you will be able to continue onboarding.

If your organisation or service is not suitable or eligible to use NHS Notify for any reason, the service team will contact you to explain.'

%}

## 5. Prepare for technical integration

This stage covers the requirements your service needs to meet before it begins integration with NHS Notify.

Your service will need to:

{% include components/details.html
heading='Declare Data and Information security controls'
text='To ensure you have controls in place to keep patient data private and secure, you must complete the Data and Security Protection Toolkit (DSPT).

You will need to evidence:

- processes for ensuring End User Organisations of your product or service have a ‘standards met’ or ‘approaching standards’ DSPT
- a formal and documented Information Security Management System (ISMS) that covers the scope of your product or service'
  %}

{% include components/details.html
heading='Implement a Clinical Risk Management process'
text='As an organisation of healthcare software, you must ensure you implement a clinical risk management process that conforms to the DCB0129 standard.

You will need to evidence:

- your service is compliant with the DCB0129 standard
- who your Clinical Safety Officer is and their contact details
- that your Clinical Safety Officer has approved a clinical safety report of your product or service
- you considered the NHS Digital hazard log during development
- the Caldicott Guardian is aware of each of your use cases and plans to send messages to patients and the public'
  %}

{% include components/details.html
heading='Register for service and incident management'
text='If you’re an NHS organisation or service, you may already be registered for service management with the NHS England National Service Desk.

If you’re not already registered, you can register with the NHS England National Service Desk.

Your programme or service will also need to have an incident management process that is consistent with the NHS England Incident Management process.'
%}

Once this stage is completed, you can begin to technically integrate and test with NHS Notify.

## 6. Create your templates

To send an NHS App message, email, text message or letter with NHS Notify, you must create a reusable message template.

Templates let you send the same thing to lots of people, as often as you need to, without writing a new message each time.

Learn how to create:

- [NHS App message templates]({% link pages/using-nhs-notify/nhs-app-templates.md %})
- [email templates]({% link pages/using-nhs-notify/email-templates.md %})
- [text message templates]({% link pages/using-nhs-notify/text-message-templates.md %})
- [letter templates]({% link pages/using-nhs-notify/letter-templates.md %})

## 7. Create your routing plans

You’ll need to create a routing plan to decide how messages will be sent to your recipients. The NHS Notify team will support you to create your routing plans.

[Learn more about routing plans]({% link pages/using-nhs-notify/routing-plans.md %}).

## 8. Integrate and test with NHS Notify

Use NHS Notify’s integration test environments to run formal integration sandbox-testing.

You'll need at least one template and one routing plan for testing. These can contain mock data.

The integration test environment is stateful, which means it receive updates. It also includes [signed JWT authentication](https://digital.nhs.uk/developer/guides-and-documentation/security-and-authorisation/application-restricted-restful-apis-signed-jwt-authentication) which allows you to test the integration environment without writing any code.

You can try the integration environment using [NHS Notify’s Postman collection](https://god.gw.postman.com/run-collection/28740466-ec078d1e-d4d7-4460-92b9-7d79d51f967a?action=collection%2Ffork&source=rip_markdown&collection-url=entityId%3D28740466-ec078d1e-d4d7-4460-92b9-7d79d51f967a%26entityType%3Dcollection%26workspaceId%3D3664098f-4f8b-4edf-874d-ed33e1eea8ed).

## 9. Meet the technical conformance requirements

This stage covers the technical requirements your service or organisations needs to meet before it can go live with NHS Notify.

You will need to:

{% include components/details.html
heading='Show you can meet NHS Notify’s technical conformance requirements'
text='Your organisation or service will need to accept that it’s responsible for:

- using the correct processes to identify the recipients of messages you plan to send
- authoring and proofing the content of messages
- managing the volume of messages it sends so it does not exceed any previously agreed amounts

You also need to confirm that you have successfully completed integration testing with NHS Notify.'
%}

{% include components/details.html
heading='Prove you have developed your integration securely'
text='Your organisation or service should be designed, developed and deployed in a way that minimises and mitigates threats to its security.

Overall, you will need to evidence that your organisation or service:

- has a System Level Security Policy (SLSP) in place
- aligns with NCSC Secure development and deployment guidance
- adheres to the 10 data security standards – Security Self Assessment

To prove that your integration has been developed securely, we ask for information and evidence on the following topics.

### People

The staff and people operating your organisation or service need to:

- commit to handle information respectfully and safely, according to the Caldicott Principles
- understand their responsibilities under the National Data Guardian’s Data Security Standards
- complete appropriate annual data security training and pass mandatory tests provided through the DSPT

### Processes

Your organisation or service must:

- ensure personal confidential information is only accessible by required staff and is attributable to individuals
- complete annual reviews to prevent instances where data security is compromised
- have processes and procedures to deal with security incidents resultant of cyber attacks
- have a continuity plan in place to respond to data security that is tested annually

### Technology

Your organisation or service must:

- only use supported operating systems, software or browsers within its IT estate
- have a strategy is in place to protect IT systems from cyber threats
- have processes and procedures are in place to deal with security incidents resultant of cyber attacks
- prove third party IT suppliers are contractually accountable for protecting personal confidential data that they process and meet National Data Guardian’s Data Security Standards

### Data in transit protection

Your organisation or service must confirm that data in transit is:

- encrypted by default, including sensitive data in transit
- protected between your end-user devices and your service
- protected between internal components within the service
- protected where exposed to other external service, for example, via an API

### Identity and authentication

Access to service interfaces should be constrained to authenticated and authorised individuals.

Your organisation or service must confirm that:

- access to internal and external interfaces is authenticated
- it has processes to manage the lifecycle of service credentials'
  %}

## 10. Complete the connection agreement

{% include components/inset-text.html
text='You only need to complete the connection agreement if your organisation or service is not part of NHS England.'
%}

This stage is about accepting the terms of use for NHS Notify, otherwise known as the Connection Agreement.

It is a legal document that is signed alongside any financial agreements between NHS Notify, its suppliers and your service.

Accepting and signing the Connection Agreement must be done by someone in your service’s organisation with the appropriate authority.

## 11. Onboarding complete

Once you have proven you integrated securely, you will be given a go live date by the NHS Notify team. You can then start using NHS Notify to send messages to patients or members of the public.
