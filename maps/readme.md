# Example Bundles

The example document Bundles of the IG are FSH instances in `input/fsh/examples/`. Bundles created from FOPH example data are generated with the scripts in this directory and then maintained as FSH.

Requirements: `yq`, `curl`, `npx` (for GoFSH).

## How it works

`QrToBundle.map` is a StructureMap that turns a flat list of `linkId` / value pairs (e.g. `LaboratoryReport.Patient.Surname: Dupont`) into a CH ELM document Bundle. Its input is a QuestionnaireResponse with one item per field. The map runs on matchbox (`test.ahdis.ch`).

1. `<id>.yaml` holds the fields as `linkId: value` lines. `qr-from-yaml.sh` builds the QuestionnaireResponse from it.
2. `new-example.sh` posts that QuestionnaireResponse to matchbox `$transform` with `QrToBundle.map`.
3. `bundle-to-fsh.sh` converts the resulting Bundle to FSH with GoFSH and writes `input/fsh/examples/<id>.fsh`.

The map creates every resource with a random `urn:uuid`, so each transform run produces different ids. `bundle-to-fsh.sh` replaces them with readable names:

- Patients, organizations, practitioners and practitioner roles go to `input/fsh/examples/shared.fsh` as `Pat-<name>`, `Org-<name>`, `Pract-<name>` and `PR-<name>`. An instance already there is reused when its rules match exactly, so the Bundles share them instead of each carrying its own copy.
- All other resources stay in the Bundle file as `<bundle id>-<type>`, e.g. `3Doc-CPE-Obs`.
- fullUrls become `http://test.fhir.ch/r4/<type>/<id>`, as in the hand-written examples.

Only ids, fullUrls and references change. The content of each resource stays as the map produced it.

## New example

1. Create `maps/<id>.yaml` from the FOPH example data, see `3Doc-CPE.yaml`. `LaboratoryReport.Id` sets the Bundle id. Values are read as strings and only need quotes when they contain `: ` or ` #`.
2. Run `npm run example:new -- <id>`. If `QrToBundle.map` changed, POST it to matchbox first (first request in `transform.http`).
3. Review the generated `input/fsh/examples/<id>.fsh` and the instances added to `shared.fsh`. From now on the FSH file is the source of the example, make later changes there.
4. Add name/description/exampleCanonical of the example to `sushi-config.yaml`.
5. Add the example in `input/pagecontent/document.md` for the xml and json versions.
6. Run the IG Publisher and check that no errors have been created.
7. Add new warnings to `input/resources/ignoreWarnings.txt`. Copy them from `output/qa.txt` instead of `qa.html`.
8. Add/Update Changelog.

## To do: convert the remaining XML examples

49 examples are still `input/resources/Bundle-*.xml`, generated with the previous flow and edited by hand afterwards. Their QuestionnaireResponse JSON in this directory is often outdated and is not the source of the example anymore.

Only 7 examples are converted so far, so the approach (readable ids, `shared.fsh`, naming) can be reviewed on a small diff first. Converting the rest is mechanical but produces a large diff, and the shared instances only pay off once all Bundles use them (the 56 example Bundles contain 55 patients, 12 of them distinct, and 110 organizations, 7 distinct).

Steps:

1. Convert all remaining Bundles:
   ```bash
   npm run example:to-fsh -- input/resources/Bundle-*.xml
   ```
2. Remove the XML and the QuestionnaireResponse JSON, which are all obsolete afterwards (5 JSON files have a different name than their Bundle, e.g. `12Doc-Monkeypox.json` for `12Doc-Mpox`):
   ```bash
   git rm input/resources/Bundle-*.xml maps/*.json
   ```
3. Compare each generated Bundle (`fsh-generated/resources/Bundle-<id>.json`) with its original XML, ignoring ids, fullUrls and references. The 7 converted Bundles were checked by flattening both to path/value pairs with `yq`.
4. Review the instance names added to `shared.fsh` and rename unclear ones, e.g. `Org-SanLab-2`. Fix source data errors that show up, e.g. the organization "A99684215 ABC" and the patient "Delemat Monika" with given and family name swapped.
5. Merge `Pract-PeterHauser-2` / `PR-PeterHauser-2` with the hand-written `Pract-PeterHauser` / `PR-PeterHauser` from `6Doc-Influenza.fsh`. They differ only in profile and telecom order.
6. Check the example links in `input/pagecontent/document.md`, e.g. the XML link of 71Doc-RSV points to `json.html`.
7. Remove `transform.sh`, `transform.http`, `docref.sh` and `bundle-docref.sh`, which only work with XML Bundles in `input/resources`.
8. Run the IG Publisher, check that no errors have been created and update `input/resources/ignoreWarnings.txt`.
9. Add/Update Changelog.

## History

FOPH provided the example data as an Excel file with one sheet per example. Columns A and B were copied into a Google Sheet that assembled a QuestionnaireResponse JSON in a single cell, which was copied into `maps/<id>.json`, cleaned up by hand and transformed with `transform.sh` / `transform.http`. The resulting XML went to `input/resources`, got its id added by hand and was often edited afterwards. As of autumn 2026 the source Excel was not maintained anymore, so the XML was the only up-to-date version of most examples.

The XML was hard to review, a regeneration produced new UUIDs for every resource and overwrote the manual edits, and patients, organizations and practitioners were copied into every Bundle. Several Bundles also share the same `Bundle.identifier`, because 18 of the QuestionnaireResponses use the same `LaboratoryReport.Header.DocumentIdentifier`.

## Other files

- `BundleToDocRef.map`, `docref.sh`, `docref_fsh.sh`, `bundle-docref.sh`: create the `DocumentReference-Publish-*` examples from a Bundle. Use `docref_fsh.sh` for Bundles defined in FSH, it reads `fsh-generated/resources`.
- `transform.sh`, `transform.http`: the previous transform of a QuestionnaireResponse JSON to XML.
