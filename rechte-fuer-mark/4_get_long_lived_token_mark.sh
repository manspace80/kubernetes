#!/bin/bash 

USER="mark"

for U in ${USER}
do
	echo "${U}:"
	TOKEN=$(kubectl get secrets token-${U} -n tt3 -o json| jq -r '.data.token'|base64 -d)
	echo "${TOKEN}"
	#echo "${TOKEN}" > ${DATADIR}/${U}_long_live.token
	/usr/bin/cp ${HOME}/.kube/config ${HOME}/.kube/config-mark
	kubectl config set-context super-${U} --cluster default --user ${U} --kubeconfig ${HOME}/.kube/config-mark
	kubectl config set-credentials ${U} --token=${TOKEN} --kubeconfig ${HOME}/.kube/config-mark
	kubectl config use-context super-${U} --kubeconfig ${HOME}/.kube/config-mark
	kubectl config delete-context default --kubeconfig ${HOME}/.kube/config-mark
	kubectl config delete-user default --kubeconfig ${HOME}/.kube/config-mark
done
