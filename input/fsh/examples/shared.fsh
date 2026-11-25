// Patients, organizations and practitioners referenced by the example Bundles

Instance: Org-KantonsspitalABC
InstanceOf: Organization
Usage: #inline
* identifier.system = "urn:oid:2.16.756.5.45"
* identifier.value = "A99684215"
* name = "Kantonsspital ABC"
* address.line = "Aortastrasse 22"
* address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[=].valueString = "Aortastrasse"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[=].valueString = "22"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-postBox"
* address.line.extension[=].valueString = "Postfach 18"
* address.city = "Bern"
* address.postalCode = "3000"

Instance: Org-PraxisDrHauser
InstanceOf: Organization
Usage: #inline
* identifier.system = "urn:oid:2.16.756.5.45"
* identifier.value = "A74966168"
* name = "Praxis Dr. Hauser"
* address.line = "Hauptstrasse 10"
* address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[=].valueString = "Hauptstrasse"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[=].valueString = "10"
* address.city = "Solothurn"
* address.postalCode = "4500"

Instance: Org-SanLab
InstanceOf: Organization
Usage: #inline
* identifier.system = "urn:oid:2.51.1.3"
* identifier.value = "7601002331470"
* name = "SanLab"

Instance: PR-MonikaGiacometti
InstanceOf: PractitionerRole
Usage: #inline
* practitioner = Reference(Pract-MonikaGiacometti)
* organization = Reference(Org-KantonsspitalABC)

Instance: PR-PeterHauser-2
InstanceOf: PractitionerRole
Usage: #inline
* practitioner = Reference(Pract-PeterHauser-2)
* organization = Reference(Org-PraxisDrHauser)

Instance: Pat-AntoineDupont
InstanceOf: Patient
Usage: #inline
* identifier.system = "urn:oid:2.16.756.5.32"
* identifier.value = "7561234567897"
* name.family = "Dupont"
* name.given = "Antoine"
* gender = #female
* birthDate = "1981-02-07"
* address.use = #home
* address.line = "rue de la république 10"
* address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[=].valueString = "rue de la république"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[=].valueString = "10"
* address.city = "Carouge"
* address.state = "GE"
* address.postalCode = "1227"
* address.country.extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-codedString"
* address.country.extension.valueCoding = urn:iso:std:iso:3166#CH
* address.country = "CH"

Instance: Pat-HF
InstanceOf: Patient
Usage: #inline
* identifier.system = "urn:oid:2.16.756.5.32"
* identifier.value = "7561733446723"
* name.family = "F"
* name.given = "H"
* gender = #female
* birthDate = "1985-10-17"
* address.use = #home
* address.city = "Derendingen"
* address.state = "SO"
* address.postalCode = "4552"
* address.country.extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-codedString"
* address.country.extension.valueCoding = urn:iso:std:iso:3166#CH
* address.country = "CH"

Instance: Pract-MonikaGiacometti
InstanceOf: Practitioner
Usage: #inline
* identifier.system = "urn:oid:2.51.1.3"
* identifier.value = "7601000234438"
* name.family = "Giacometti"
* name.given = "Monika"
* telecom[0].system = #phone
* telecom[=].value = "+41 79 111 44 55"
* telecom[+].system = #email
* telecom[=].value = "m.giacometti@ks-abc.ch"

Instance: Pract-PeterHauser-2
InstanceOf: Practitioner
Usage: #inline
* identifier.system = "urn:oid:2.51.1.3"
* identifier.value = "7601000000514"
* name.family = "Hauser"
* name.given = "Peter"
* telecom[0].system = #phone
* telecom[=].value = "+41 79 222 33 44"
* telecom[+].system = #email
* telecom[=].value = "peter.hauser@hauserpraxis.ch"

Instance: Org-A99684215ABC
InstanceOf: Organization
Usage: #inline
* identifier.system = "urn:oid:2.16.756.5.45"
* identifier.value = "A99684215"
* name = "A99684215 ABC"
* address.line = "Aortastrasse 22"
* address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[=].valueString = "Aortastrasse"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[=].valueString = "22"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-postBox"
* address.line.extension[=].valueString = "Postfach 18"
* address.city = "Bern"
* address.postalCode = "3000"

Instance: Org-NationalesZentrumFurMeningokokken
InstanceOf: Organization
Usage: #inline
* identifier.system = "urn:oid:2.51.1.3"
* identifier.value = "7601002131193"
* name = "Nationales Zentrum für Meningokokken"

Instance: Org-SanLab-2
InstanceOf: Organization
Usage: #inline
* identifier.system = "urn:oid:2.16.756.5.45"
* identifier.value = "A99684215"
* name = "SanLab"
* address.line = "rue de l'église 10"
* address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[=].valueString = "rue de l'église"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[=].valueString = "10"
* address.city = "Fribourg"
* address.postalCode = "1700"

Instance: PR-AndreaGasser
InstanceOf: PractitionerRole
Usage: #inline
* practitioner = Reference(Pract-AndreaGasser)
* organization = Reference(Org-SanLab-2)

Instance: PR-MonikaGiacometti-2
InstanceOf: PractitionerRole
Usage: #inline
* practitioner = Reference(Pract-MonikaGiacometti)
* organization = Reference(Org-A99684215ABC)

Instance: Pat-49Doc-HIV
InstanceOf: Patient
Usage: #inline
* identifier.system = "urn:oid:2.16.756.5.32"
* identifier.value = "7561234567897"
* name.extension.url = "http://fhir.ch/ig/ch-elm/StructureDefinition/ch-elm-ext-hiv-code"
* name.extension.valueString = "H5"
* name.family.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* name.family.extension.valueCode = #masked
* name.given.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* name.given.extension.valueCode = #masked
* gender = #female
* birthDate = "1981-02-07"
* address.use = #home
* address.city = "Carouge"
* address.state = "GE"
* address.postalCode = "1227"
* address.country.extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-codedString"
* address.country.extension.valueCoding = urn:iso:std:iso:3166#CH
* address.country = "CH"

Instance: Pat-DelematMonika
InstanceOf: Patient
Usage: #inline
* identifier.system = "urn:oid:2.16.756.5.32"
* identifier.value = "7562295883070"
* name.family = "Monika"
* name.given = "Delemat"
* gender = #male
* birthDate = "1960-08-22"
* address.use = #home
* address.line = "Bahnhofstrasse 27"
* address.city = "Bern"
* address.state = "BE"
* address.postalCode = "3000"
* address.country.extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-codedString"
* address.country.extension.valueCoding = urn:iso:std:iso:3166#CH
* address.country = "CH"

Instance: Pract-AndreaGasser
InstanceOf: Practitioner
Usage: #inline
* identifier.system = "urn:oid:2.51.1.3"
* identifier.value = "7601002331470"
* name.family = "Gasser"
* name.given = "Andrea"
* telecom.system = #email
* telecom.value = "andrea.gasser@sanlab.ch"
