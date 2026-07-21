
# Loi 25 Gap Analysis Checklist
## Clinique Santé Montréal - IAM Assessment

| Field | Details |
|---|---|
| **Organization** | Clinique Santé Montreal |
| **Environment** | mtlclinic.local |
| **Analyst** | Paule Judith Tougouma  |
| **Date** | 07/20/2026 |
| **Classification** | Confidential |




---

## Category 1 - Confidentiality Incidents

| Article | Requirement | Status | Evidence | Recommendation | Risk Register | NIST / ISO |
|---|---|---|---|---|---|---|
| Art. 3.5-8 | Quebec Law 25 (Articles 3.5–3.8) mandates that organizations immediately mitigate "confidentiality incidents" and notify the Commission d'accès à l'information (CAI) and affected individuals if a "risk of serious injury" exists. | [GAP] | There is no monitoring system to notify if a potential incident occurs (Audit) | Enable AD audit logging for logon events. Evaluate SIEM deployment (Wazuh or Splunk) | R-004 | NIST AU-2 / ISO A.8.15 |


---

## Category 2 - Security Measures (Art. 10)

| Requirement | Status | Evidence | Recommendation | Risk Register | NIST / ISO |
|---|---|---|---|---|---|
| Password expiry |[GAP] | The accounts'passwords never expire .|One or more user accounts have PasswordNeverExpires set to True in Active Directory, allowing credentials to remain valid indefinitely without forced renewal .  | R-001 | NIST IA-5 (1) / ISO A.5.17|
| Password complexity | [GAP]|Passwords complexity requirements are not enforced . | Apply a GPO to enhance passwords'complexity | R-003|NIST IA-5(1) / ISO A.5.17 |
| Account lockout |	[GAP] |Accounts lockout threshold is configured to 0 . | Configure GPO for lockout threshold|R-002 | NIST AC-7 / ISO A.8.5 |
| MFA |[GAP] |MFA is not implemented for any user account in the Active Directory environment |MFA should be activate for every account in the clinic |R-006 | NIST IA-2 / ISO A.8.5  |
| Screen lock | [COMPLIANT] | A screen Lock Policy of 10 min is applied | n/a | n/a |n/a |
| Audit logging |[GAP] | No monitoring system exits in the clinic |Enable Active Directory logon auditing | R-004| NIST AU-2 / ISO A.8.15 |

---



## Gap Summary

| Category | Total | Compliant | Partial | Gap |
|---|---|---|---|---|
| Confidentiality Incidents | 1 | 0|0 |1 |
| Security Measures | 5 |1  |0 |4
| **TOTAL** | **6** |1 | 0 | 5 |

---

## Status Guide

| Status | Meaning | When to use it |
|---|---|---|
| [COMPLIANT] | Requirement is fully met|A control is in place, verified, and working correctly |
| [GAP]| Requirement is NOT met|Nothing exists - no control, no policy, no procedure|
| [PARTIAL] | Requirement is partially met |Something exists but is incomplete, unverified, or not fully enforced |

---
1- Immediate - 0 to 30 Days
Designate a Privacy Officer responsible for Quebec Law 25 compliance.
Review existing security measures protecting personal information.
Enable Active Directory audit logging to maintain traceability of user activities.
Define a process to identify, document, and respond to confidentiality incidents.

2- Short Term - 30 to 90 Days
Implement stronger IAM security controls:
Multi-Factor Authentication (MFA) for privileged accounts.
Account lockout policy.
Password complexity and password expiration requirements.
Privileged account review and least privilege enforcement.
Evaluate monitoring solutions (such as SIEM) to improve detection and incident response capabilities.

3- Medium Term - 90 to 180 Days
Deploy a centralized SIEM solution (e.g., Wazuh or Splunk) if feasible.
Conduct periodic IAM and privacy compliance reviews.
Perform a follow-up risk assessment to evaluate the effectiveness of implemented controls.
