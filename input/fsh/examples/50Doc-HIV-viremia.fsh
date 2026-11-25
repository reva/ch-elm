Instance: 50Doc-HIV-viremia
InstanceOf: Bundle
Usage: #example
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:3401332d-6012-4434-9a90-6331adb23aab"
* type = #document
* timestamp = "2024-11-06T12:00:00+02:00"
* entry[0].fullUrl = "http://test.fhir.ch/r4/Composition/50Doc-HIV-viremia-Comp"
* entry[=].resource = 50Doc-HIV-viremia-Comp
* entry[+].fullUrl = "http://test.fhir.ch/r4/Patient/Pat-49Doc-HIV"
* entry[=].resource = Pat-49Doc-HIV
* entry[+].fullUrl = "http://test.fhir.ch/r4/Organization/Org-SanLab"
* entry[=].resource = Org-SanLab
* entry[+].fullUrl = "http://test.fhir.ch/r4/Observation/50Doc-HIV-viremia-Obs"
* entry[=].resource = 50Doc-HIV-viremia-Obs
* entry[+].fullUrl = "http://test.fhir.ch/r4/Practitioner/Pract-PeterHauser-2"
* entry[=].resource = Pract-PeterHauser-2
* entry[+].fullUrl = "http://test.fhir.ch/r4/Organization/Org-PraxisDrHauser"
* entry[=].resource = Org-PraxisDrHauser
* entry[+].fullUrl = "http://test.fhir.ch/r4/PractitionerRole/PR-PeterHauser-2"
* entry[=].resource = PR-PeterHauser-2
* entry[+].fullUrl = "http://test.fhir.ch/r4/Specimen/50Doc-HIV-viremia-Spec"
* entry[=].resource = 50Doc-HIV-viremia-Spec
* entry[+].fullUrl = "http://test.fhir.ch/r4/ServiceRequest/50Doc-HIV-viremia-SR"
* entry[=].resource = 50Doc-HIV-viremia-SR
* entry[+].fullUrl = "http://test.fhir.ch/r4/DiagnosticReport/50Doc-HIV-viremia-DR"
* entry[=].resource = 50Doc-HIV-viremia-DR

Instance: 50Doc-HIV-viremia-Comp
InstanceOf: Composition
Usage: #inline
* language = #de-CH
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:3401332d-6012-4434-9a90-6331adb23aab"
* status = #final
* type.coding[0].version = "http://snomed.info/sct/2011000195101"
* type.coding[=] = $sct#4241000179101 "Laborbericht"
* type.coding[+] = $loinc#11502-2 "Laboratory report"
* subject = Reference(Pat-49Doc-HIV)
* date = "2024-11-06T12:00:00+02:00"
* author = Reference(Org-SanLab)
* title = "Laborbericht vom 6.11.2024"
* section.title = "Analyseergebnisse der mikrobiologischen Untersuchung"
* section.code = $loinc#18725-2 "Microbiology studies (set)"
* section.entry = Reference(50Doc-HIV-viremia-Obs)

Instance: 50Doc-HIV-viremia-Obs
InstanceOf: Observation
Usage: #inline
* status = #final
* category = $observation-category#laboratory "Laboratory"
* code = $loinc#62469-2
* subject = Reference(Pat-49Doc-HIV)
* effectiveDateTime = "2024-11-04T14:20:00+02:00"
* performer = Reference(Org-SanLab)
* valueQuantity = 65168 '1/mL' "{Copies}/mL"
* interpretation = $v3-ObservationInterpretation#POS "Positive"
* specimen = Reference(50Doc-HIV-viremia-Spec)

Instance: 50Doc-HIV-viremia-Spec
InstanceOf: Specimen
Usage: #inline
* type.text = "Material declared by Observation.code or non-mandatory"
* subject = Reference(Pat-49Doc-HIV)
* collection.collectedDateTime = "2024-11-01T14:20:00+02:00"

Instance: 50Doc-HIV-viremia-SR
InstanceOf: ServiceRequest
Usage: #inline
* identifier.value = "26500923675"
* status = #completed
* intent = #order
* code = $loinc#62469-2
* subject = Reference(Pat-49Doc-HIV)
* requester = Reference(PR-PeterHauser-2)
* specimen = Reference(50Doc-HIV-viremia-Spec)

Instance: 50Doc-HIV-viremia-DR
InstanceOf: DiagnosticReport
Usage: #inline
* extension.url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-DiagnosticReport.composition"
* extension.valueReference = Reference(50Doc-HIV-viremia-Comp)
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:3401332d-6012-4434-9a90-6331adb23aab"
* basedOn = Reference(50Doc-HIV-viremia-SR)
* status = #final
* code = $loinc#11502-2 "Laboratory report"
* subject = Reference(Pat-49Doc-HIV)
* performer = Reference(Org-SanLab)
* specimen = Reference(50Doc-HIV-viremia-Spec)
* result = Reference(50Doc-HIV-viremia-Obs)
