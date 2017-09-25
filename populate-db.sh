#!/bin/bash

while getopts d:l:r:t:u: option
do
 case "${option}"
 in
 d) TARGET_DB=${OPTARG};;
 l) LETTER_DATE=${OPTARG};;
 r) REF_NO=${OPTARG};;
 t) TEMPLATE_NO=${OPTARG};;
 u) UUID=$OPTARG;;
 esac
done
 
mysql $TARGET_DB <<EOF
INSERT INTO letters (uuid, reference_id, template_id, letter_date, created_at, updated_at) VALUES 
('$UUID', '$REF_NO', '$TEMPLATE_NO', '$LETTER_DATE', now(), now());
commit;
EOF
