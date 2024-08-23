#!/bin/bash 

DATADIR="./data"
USER="ui-admin ui-viewer"

for U in ${USER}
do
	echo "${U}:"
<<<<<<< HEAD
	TOKEN=$(kubectl get secrets ${U}-token -n kubernetes-dashboard -o json| jq -r '.data.token'|base64 -d)
	echo "${TOKEN}"
	#echo "${TOKEN}" > ${DATADIR}/${U}_long_live.token
=======
	TOKEN=$(kubectl get secrets ${U}-token -n kubernetes-dashboard --kubeconfig=$(pwd)/kubeconfig -o json| jq -r '.data.token'|base64 -d)
	echo "${TOKEN}"
	echo "${TOKEN}" > ${DATADIR}/${U}_long_live.token
>>>>>>> f2d2183 (new files)
done
