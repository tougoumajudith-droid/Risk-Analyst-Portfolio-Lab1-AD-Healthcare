# IAM Risk Assessment Report
## Clinique Santé Montréal

| Field | Details |
|---|---|
| **Organization** | Clinique Santé Montreal |
| **Environment** | Active Director:mtlclinic.local |
| **Analyst** | Paule Judith Tougouma  |
| **Date** | 07/21/2026 |
| **Frameworks** | ISO 27001, NIST 800-53 , Quebec Law 25 |
| **Classification** | Confidential |

---

## 1. Executive Summary
This report is the Identity and Access Management (IAM) risk assessment conducted on the Active Directory environment of Clinique Santé Montreal (mtlclinic.local). The risk assessment and the deliverables have been done from 07/02/2026 to 07/21/2026. This has been conducted following a warning letter received from the Commission d'accès à l'information (CAI). Six (6) risks have been identified. One of them is rated Critical and five (5) are rated High. Thus, the environment presents significant gaps against NIST SP 800-53, ISO 27001, and Quebec Law 25. An immediate action is required to designate a Privacy Officer, enable audit logging, and establish a breach notification procedure. All the remaining recommendations in this document should also be established.



---

## 2. System Characterization
*(NIST Appendix K — Element 1)*

- Equipment: Virtual Machine
- Host Hardware Brand: HP
- Operating System: Windows Server 2025
- Service: Active Directory Domain Services (AD DS)

### 2.1 System Description

An Active Directory Domain Services (AD DS) environment hosted on a Windows Server 2025 virtual machine. The system provides centralized identity and access management, including user authentication, authorization, and domain management services.


### 2.2 System Boundary and Scope
Principal domain : mtlclinic.local


### 2.3 Users and Roles
| User Account | Role |
|---|---|
| Jean | Reception Staff |
| Jeanne | Reception Staff |
| Jinette | Reception Staff |
| Julien | Reception Staff |
| Juliette | Reception Staff |
| Ben | Nursing Staff |
| Boris | Nursing Staff |
| Bibata | Nursing Staff |
| Brenda | Nursing Staff |
| Brigitte | Nursing Staff |
| Grace | Administration Staff |
| Gregoire | Administration Staff |
| Gaston | Administration Staff |
| Gloria | Administration Staff |
| Gladys | Administration Staff |
| Franck | IT Administrator |
| Francine | IT Administrator |
| Fidelia | IT Administrator |
| Flore | IT Administrator |



### 2.4 Out of Scope
The remaining domains of the clinic out of Montreal (qcclinic.local,ottawaclinic.local,gatineauclinic.local)


---

## 3. Assessment Methodology
*(NIST Appendix K — Elements 5 and 6)*
This assessment rely on the compliance requirements of cybersecurity frameworks .

### 3.1 Frameworks Used
NIST SP 800-53 , ISO 27001, Quebec Law 25


### 3.2 Risk Scoring Method
Risk = Likelihood x Impact 



### 3.3 Likelihood Scale

| Score | Label | Definition |
|---|---|---|
| 1 | Rare | The event is highly unlikely to occur. Existing controls are effective, and there is minimal exposure to the threat. |
| 2 | Unlikely | The event could occur but is not expected under normal circumstances. Controls significantly reduce the probability of occurrence. |
| 3 | Possible | The event may occur at some point. There are known vulnerabilities or weaknesses that could be exploited. |
| 4 | Likely | The event is expected to occur due to existing vulnerabilities, insufficient controls, or frequent threat activity. |
| 5 | Almost Certain | The event is highly expected to occur. Exploitation is easy, threats are active, or controls are ineffective. |

### 3.4 Impact Scale

| Score | Label | Definition |
|---|---|---|
| 1 | Minimal | The impact is negligible with limited disruption. No significant effect on operations, compliance, or data confidentiality. |
| 2 | Minor | The impact causes limited disruption or minor operational issues with minimal financial, legal, or reputational consequences. |
| 3 | Moderate | The impact affects business operations, may require corrective actions, and could result in moderate financial, compliance, or reputational consequences. |
| 4 | Major | The impact significantly affects operations, security, compliance, or sensitive information, requiring immediate remediation. |
| 5 | Critical | The impact results in severe consequences, including major data breaches, regulatory violations, significant financial loss, or critical business disruption. |

---

## 4. Threat Statement
*(NIST Appendix K - Element 2)*
Unauthorized individuals, malicious actors, or compromised user accounts may gain access to organizational resources (Patient data ) by exploiting
weaknesses in identity and access management controls . This could result in unauthorized access to sensitive information, data exposure)



---

## 5. Evidence Collected
*(NIST Appendix K - Elements 3 and 4)*

During the IAM assessment, the following evidence was reviewed:

a- Active Directory User Accounts and Organizational Unit

Evidence Reviewed:
- Active Directory user account inventory.
- Organizational Unit (OU) structure.

Observations:

User accounts are organized into the following Organizational Units:
OU=Reception
OU=Nursing
OU=Administration
OU=IT Department
User accounts were identified based on assigned roles and departments.

Purpose of Review:
To evaluate identity management practices and determine whether user accounts are appropriately organized
and managed according to business roles  . 

b-Group Policy Object (GPO) Configuration

Evidence Reviewed:
- Domain-level Group Policy Objects.
- Security-related GPO settings.

Observations:

The GPO review identified the following security configurations:

- Password Policy
No password complexity requirements were enforced.
No password expiration policy was configured.
- Account Lockout Policy
No account lockout threshold was configured.
- Audit Policy
Active Directory audit logging was not enabled.
- Authentication Controls
No MFA-related security controls were implemented 
- Screen Lock Policy
  
A screen lock policy was the only security-related GPO identified
Purpose of Review:
To assess whether centralized security policies are implemented to protect 
user identities and access.







### 5.1 User Accounts
| Organizational Unit | User Accounts |
|---|---|
| Reception | Jean, Jeanne, Jinette, Julien, Juliette |
| Nursing | Ben, Boris, Bibata, Brenda, Brigitte |
| Administration | Grace, Gregoire, Gaston, Gloria, Gladys |
| IT Department | Franck, Francine, Fidelia, Flore |



### 5.2 Password Policy
The clinic don't have a password policy regarding the accounts'passwords security requirements .


### 5.3 Group Policy Objects (GPOs)
Only a Screen lockout policy is applied to the domain .


### 5.4 Organizational Units (OUs)
OU=Reception
OU=Nursing
OU=Administration
OU=IT Department



### 5.5 Current Controls in Place
Since no specific control are currently in place , immediate action is required to mitigate the identified risks.



---

## 6. Vulnerability Identification
*(NIST Appendix K — Element 3)*

| Vulnerability ID | Description | Affected Asset | Current Control |
|---|---|---|---|
| V-001 |No password expiry policy is enforced .Accounts retain the same credentials indefinitely with no forced rotation |Patients data  | Nothing |
| V-002 |Due to an absence of accounts lockout threshold , a threat actor could indefinitely log in the system without being detected  | Patients data| Nothing |
| V-003 |The passwords'complexity rules aren't enforced ,any user can set a weak password like "1234" |Patient data | Nothing|
| V-004 |The network traffic isn't monitored . Malicious activities that could harm the clinic can't be detected | Patient data | Nothing |
| V-005 | The maximun age of passwords is set to 90. Employees could potentially change their password from a strong to a weak one |Patient data |Nothing  |
| V-006 |MFA isn't activated .A stolen or guesse password alone is sufficient to gain access to any user account  |Patient data  |Nothing  |

---



## 7. Risk Findings
*(NIST Appendix K — Elements 5, 6 and 7)*

### Finding R-001 - Non-Expiring Passwords
**Risk level:** High
**Threat:** External attacker performing brute force attacks against accounts with non-expiring passwords.
**Vulnerability:** No password expiry policy is enforced in Active Directory; accounts retain the same credentials indefinitely without forced rotation.
**Likelihood:** 4/5 — Likely
**Impact:** 4/5 — Major
**Risk Score:** 16
**Framework violations:**
- NIST SP 800-53: IA-5 Authenticator Management
- ISO/IEC 27001:2022: A.5.17 Authentication Information
- Quebec Law 25: Article 10
**Current control:** None
**Recommendation:** Configure a Group Policy Object (GPO) to enforce password expiration and regular password rotation.

---

### Finding R-002 - No Account Lockout Policy
**Risk level:** High
**Threat:** External attacker conducting brute-force or password spray attacks against Active Directory accounts.
**Vulnerability:** The account lockout threshold is set to 0, allowing unlimited failed login attempts.
**Likelihood:** 4/5 — Likely
**Impact:** 4/5 — Major
**Risk Score:** 16
**Framework violations:**
- NIST SP 800-53: AC-7 Unsuccessful Login Attempts
- ISO/IEC 27001:2022: A.8.5 Secure Log-on Procedures
- Quebec Law 25: Article 10
**Current control:** None
**Recommendation:** Configure a GPO to enforce an account lockout threshold after a defined number of failed login attempts.

---

### Finding R-003 - Weak Password Policy
**Risk level:** High
**Threat:** External attacker performing dictionary or brute-force attacks against weak passwords.
**Vulnerability:** Password complexity requirements are not enforced through Group Policy.
**Likelihood:** 3/5 — Possible
**Impact:** 4/5 — Major
**Risk Score:** 12
**Framework violations:**
- NIST SP 800-53: IA-5(1) Password-Based Authentication
- ISO/IEC 27001:2022: A.5.17 Authentication Information
- Quebec Law 25: Article 10
**Current control:** None
**Recommendation:** Configure a GPO to enforce password complexity requirements.

---

### Finding R-004 - No Audit Logging or Monitoring
**Risk level:** Critical
**Threat:** Malicious insiders or external attackers performing unauthorized activities without detection.
**Vulnerability:** Active Directory audit logging and monitoring are not enabled.
**Likelihood:** 4/5 — Likely
**Impact:** 5/5 — Critical
**Risk Score:** 20
**Framework violations:**
- NIST SP 800-53: AU-2 Event Logging
- ISO/IEC 27001:2022: A.8.15 Logging
- Quebec Law 25: Articles 3.5–3.8
**Current control:** None
**Recommendation:** Enable Active Directory audit logging and implement centralized log monitoring using a SIEM solution such as Wazuh or Splunk.

---

### Finding R-005 - Weak Password Change Configuration
**Risk level:** High
**Threat:** Users may replace strong passwords with weak passwords, increasing the likelihood of credential compromise.
**Vulnerability:** Password policy configuration allows weak password management practices.
**Likelihood:** 3/5 — Possible
**Impact:** 4/5 — Major
**Risk Score:** 12
**Framework violations:**
- NIST SP 800-53: IA-5(1) Password-Based Authentication
- ISO/IEC 27001:2022: A.8.5 Secure Log-on Procedures
- Quebec Law 25: Article 10
**Current control:** None
**Recommendation:** Configure an appropriate password minimum age through Group Policy to prevent frequent password changes intended to bypass password history.

---

### Finding R-006 - Multi-Factor Authentication Not Implemented
**Risk level:** High
**Threat:** An attacker using stolen or compromised credentials can successfully authenticate.
**Vulnerability:** Multi-Factor Authentication (MFA) is not implemented for any user account.
**Likelihood:** 4/5 - Likely
**Impact:** 4/5 - Major
**Risk Score:** 16
**Framework violations:**
- NIST SP 800-53: IA-2 Identification and Authentication
- ISO/IEC 27001:2022: A.8.5 Secure Log-on Procedures
- Quebec Law 25: Article 10
**Current control:** None
**Recommendation:** Implement Multi-Factor Authentication (MFA) for all user accounts.

---

## 8. Risk Summary Table
*(NIST Appendix K - Element 9)*

| Risk ID | Description | Likelihood | Impact | Score | Priority | Status |
|---|---|---:|---:|---:|---|---|
| R-001 | Non-expiring passwords | 4 | 4 | 16 | High | In Progress |
| R-002 | No account lockout policy | 4 | 4 | 16 | High | In Progress |
| R-003 | Weak password complexity policy | 3 | 4 | 12 | High | In Progress |
| R-004 | No audit logging or monitoring | 4 | 5 | 20 | Critical | In Progress |
| R-005 | Weak password change configuration | 3 | 4 | 12 | High | In Progress |
| R-006 | Multi-Factor Authentication not implemented | 4 | 4 | 16 | High | In Progress |

---

## 9. Control Recommendations
*(NIST Appendix K - Element 8)*

### Immediate - 0 to 30 Days
- Designate a Privacy Officer to support compliance with Quebec Law 25.
- Enable Active Directory audit logging.
- Configure an account lockout policy.
- Implement Multi-Factor Authentication (MFA) for privileged accounts.

### Short Term - 30 to 90 Days
- Enforce password complexity requirements.
- Configure password expiration and minimum password age using Group Policy.
- Review privileged accounts and apply the principle of least privilege.

### Medium Term - 90 to 180 Days
- Deploy a centralized SIEM solution (e.g., Wazuh or Splunk).
- Conduct periodic Active Directory security reviews.
- Perform regular IAM compliance assessments against NIST SP 800-53, ISO/IEC 27001, and Quebec Law 25.
---

## 10. Conclusion

The Identity and Access Management (IAM) risk assessment identified six (6) security risks affecting the Active Directory environment of Clinique Santé Montréal. One (1) risk was assessed as Critical and five (5) were assessed as High.

The assessment revealed weaknesses in authentication, password management, account protection, audit logging, and identity governance. These weaknesses increase the likelihood of unauthorized access, credential compromise, and non-compliance with applicable security frameworks and privacy regulations.

Implementing the recommended security controls will significantly reduce the organization's overall risk exposure and improve compliance with NIST SP 800-53, ISO/IEC 27001, and Quebec Law 25. Regular reviews and continuous monitoring should be performed to maintain an effective Identity and Access Management program.

