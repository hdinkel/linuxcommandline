#!/bin/bash
cd attendees
cat attendees.csv |while read name; do sed -e "0,/FIRSTNAME LASTNAME/s/FIRSTNAME LASTNAME/$name/" ../CertificateOfParticipation_ALC.svg >| ${name}.svg; convert ${name}.svg ${name}.pdf;done ; pdfjoin *.pdf
cd -
