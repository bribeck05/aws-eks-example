#!/bin/bash

echo ""

unset err
if [ "${CLUSTER_NAME}" == "" ]; then
	echo "Environment variable CLUSTER_NAME must be set"
	err="true"
fi

if [ "${nodegroup_name}" == "" ]; then
	echo "Environment variable nodegroup_name must be set"
	err="true"
fi

if [ "${err}" == "" ]; then
	echo ""
	echo "Status of nodegroup ${nodegroup_name} ..."
	CMD="eksctl get nodegroup --cluster ${CLUSTER_NAME} --name ${nodegroup_name}"
	if [ "${VERBOSE}" == "true" ]; then
		echo ""
		echo "${CMD}"
		echo ""
	fi
	if [ "${DRY_RUN}" == "" ]; then
		${CMD}
	fi
else
	echo "Please correct errors and try again"
fi

