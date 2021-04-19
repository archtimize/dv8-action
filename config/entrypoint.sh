#!/bin/bash

# Building the archreport.properties file with input variables from action.yml
if [[ -z "$INPUT_RESULT_PATH" ]]; then
    echo "outputFolder: dv8-output" >> archreport.properties
else
    echo "outputFolder: $INPUT_RESULT_PATH" >> archreport.properties
fi

if [[ -z "$INPUT_PROJECT_NAME" ]]; then
    echo "projectName: project" >> archreport.properties
else
    echo "projectName: $INPUT_PROJECT_NAME" >> archreport.properties
fi

if [[ -z "$INPUT_PROJECT_PATH" ]]; then
    echo "sourceCodePath: ./" >> archreport.properties
else
    echo "sourceCodePath: $INPUT_PROJECT_PATH" >> archreport.properties
fi

echo "sourceType: code" >> archreport.properties
echo "sourceCodeLanguage: $INPUT_SOURCE_LANGUAGE" >> archreport.properties
echo "revisionHistoryType: git" >> archreport.properties

# Performing analysis
dv8-console license:activate -licenseKey $INPUT_LICENSE_KEY -activationCode $INPUT_ACTIVATION_CODE
dv8-console arch-report -paramsFile archreport.properties
dv8-console license:deactivate -activationCode $INPUT_ACTIVATION_CODE