#! /bin/bash

UserName=admin
PassWord=Login@123

JSON=$(cat <<EOF
{
     "participant": {
        "source": "OpenSpecimen",
        "firstName": "Virendra",
        "lastName": "Sehwag",
        "middleName": "Rajesh",
        "emailAddress": "viru@gmail.com",
        "birthDate": 101327400000,
        "gender": "Male",
        "races": [
            "White",
            "Asian"
        ],
        "pmis": [
            {
                "siteName": "Biobank_site",
                "mrn": "MRN1234567890"
            },
            {
                "siteName": "Kaustubh_Site_1",
                "mrn": "MRN12345678"
            }
        ],
        "ethnicities": [
            "Unknown",
            "Not Reported"
        ],
        "uid": "778-66-3333",
        "activityStatus": "Active",
        "empi": "MRN12345678",
        "phiAccess": true,
        "registeredCps": [],
        "extensionDetail": {
            "formId": 99,
            "formCaption": "Prosa Participant Extension",
            "attrs": [
                {
                    "name": "general_consent",
                    "udn": "general_consent",
                    "caption": "General Consent",
                    "value": "Refused",
                    "type": "radiobutton",
                    "displayValue": "Refused"
                },
                {
                    "name": "nccr_anti_resist_participant_id",
                    "udn": "nccr_anti_resist_participant_id",
                    "caption": "NCCR AntiResist Participant ID",
                    "value": "AntiResist-USB-00002",
                    "type": "stringTextField",
                    "displayValue": "AntiResist-USB-00002"
                }
            ],
            "useUdn": false
        },
        "cpId": -1,
        "reqRegInfo": false,
        "forceDelete": false,
        "birthDateStr": "1973-03-19"
    },
    "cpId": 1,
    "cpTitle": "Blood samples collection protocol",
    "cpShortTitle": "blood sample cp",
    "ppid": "COVID004",
    "barcode": null,
    "activityStatus": "Active",
    "registrationDate": 1616092200000,
    "externalSubjectId": "005",
    "site": "Kaustubh_Site_1",
    "consentDetails": null,
    "specimenLabelFmt": null,
    "aliquotLabelFmt": "%PSPEC_LABEL%_%PSPEC_UID%",
    "derivativeLabelFmt": null,
    "forceDelete": false
}
EOF
)

curl -u $UserName:$PassWord --header "Content-Type: application/json" --request POST --data "$JSON" "http://localhost:8080/openspecimen/rest/ng/collection-protocol-registrations/"
