# DV8 Action
Executes complexity and dependency analysis over a project.

## Inputs

### `license_key`

**Required** The licence of the product, [contact us](mailto:support@archdia.com) to apply for a license_key and activation_code.

### `activation_code`

**Required** The activation code of the product.

### `source_language`

**Required** The language of the source code, accepted values are: java, cpp, python and ruby. The default value is **java**

### `result_path`

**Optional** The path of the dv8 output, by default is dv8-output

### `project_name`

**Optional** The name of the input project, by default is project, should be valid characters as filename

### `project_path`

**Optional** The path of the input project. The default value is /github/workspace

## Outputs

### `dv8-output`

A folder containing the results of the DV8 analysis, the results can be parsed or they can be uploaded to the workflow as artifacts. Customizing `result_path` and `project_name` if different names are preferred.

The structure of the output folder is as follows by default:

* dv8-output/
  + project/
    + config/
      * history-extended-config.xml
      * structure-extended-config.xml
    + depends-output/
      * dependency.csv
      * depends-dv8map.mapping
      * dependency.json
    + dv8-analysis-output/
      * anti-pattern/
      * dsm/
      * hotspot/
      * maintenance-costs/
      * root/
      * file-measure-report.csv
      * analysis-summary.html
    + project.dv8.proj

## Example usage

Create a yml file inside the .github/workflows folder to define a new workflow, check examples folder for more cases.

_.github/workflows/main.yml_

```
name: DV8 Analysis
on:
  push:
    branches: [ master ]
jobs:
  dv8-analysis:
    runs-on: ubuntu-latest
    name: A job to perform DV8 analysis of source code over a project
    steps:
      - uses: actions/checkout@v2.3.4
        with:
          fetch-depth: 0
      - name: DV8 analysis
        id: dv8
        uses: archtimize/dv8-action@master
        with: 
          license_key: ${{ secrets.LICENSE_KEY }}
          activation_code: ${{ secrets.ACTIVATION_CODE }}
          source_language: java
          project_name: depends
      # Store the DV8 results as an artifact in the workflow
      - name: Store DV8 analysis
        uses: actions/upload-artifact@v2
        with:
          name: dv8-output
          path: dv8-output
```
