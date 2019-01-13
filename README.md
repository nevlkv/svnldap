# svnldap
Svn storage with ldap auth for kubernetes and standalone docker 

**Kubernetes or standalone usage**

For kubernetes
```
  kubectl apply -f ./deployment.yml -n exist_ns
```
_Need to change hostname in ingress example_

For standalone
```
 docker-compose up -d svn
```
Recomended nginx+ssl
