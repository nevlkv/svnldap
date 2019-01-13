#!/bin/bash

if [ -z $1 ]; then
   echo "usage $0 new_repo_name"
   exit 1;
fi

REPO=$1
pod=$(kubectl get pod -n svn  -o name -l app=svn -o jsonpath="{.items..metadata.name}")
kubectl exec ${pod} -n=svn -- sh -c "svnadmin create /opt/${REPO}  && chown apache:apache -R /opt/${REPO}"
exit 0
