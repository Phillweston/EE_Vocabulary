#!/bin/bash

InputFile="EE_Vocabulary.txt"
OutputFile="EE_Vocabulary.md"

while IFS= read -r line || [[ -n "$line" ]]; do
    if [[ $line == \#* ]]; then
        echo "$line" >> "$OutputFile"
        echo "|English|Chinese|" >> "$OutputFile"
        echo "|-|-|" >> "$OutputFile"
    else
        # Replace tabs with spaces and remove spaces around commas
        line=${line//$'\t'/ }
        line=${line// ,/,}
        line=${line//, /,}

        # Split the line into two parts and format it as a table row
        IFS=',' read -r english chinese <<< "$line"
        echo "|$english|$chinese|" >> "$OutputFile"
    fi
done < "$InputFile"

echo "Done. Table is in $OutputFile"
