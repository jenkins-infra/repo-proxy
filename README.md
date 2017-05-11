#README

repo-proxy is a nginx caching proxy in front of repo.jenkins-ci.org

## Validate
In order to validate if the proxy is still working as expected, you can run following commands:

```make build```: Build container
```make run```: Run container on localhost:80


```curl -I http://localhost/releases/cf/pgmann/plugins/url-auth-sso/1.0/url-auth-sso-1.0-javadoc.jar```
  -> Should have return code 200 with HEADER 'X-Cache-Status' set to 'HIT' or 'MISS' 
```curl -I http://localhost/snapshots/jenkins/repository/1.1-SNAPSHOT/repository-1.1-20140112.102452-1-javadoc.jar```
  -> Should have return code 200 without HEADER 'X-Cache-Status'
```curl -I http://localhost/snapshots/com/deveo/plugins/deveo/maven-metadata.xml```
  -> Should have return code 200 without HEADER 'X-Cache-Status'

! All requests should have return code '200'
! Cached requests contain HEADER 'X-Cache-Status':
    set to HIT if response get from  cache
    Set to MISS if response didn't get from cache
