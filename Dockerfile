FROM nginx:1.13

LABEL \
  Description="Deploy nginx proxy in front of repo.jenkins-ci.org" \
  Project="https://github.com/jenkins-infra/repo-proxy" \
  Maintainer="infra@lists.jenkins-ci.org"

COPY conf.d/nginx.conf /etc/nginx/nginx.conf
COPY conf.d/default.conf /etc/nginx/conf.d/default.conf
