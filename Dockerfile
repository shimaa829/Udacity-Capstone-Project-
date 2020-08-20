FROM nginx:latest

# hadolint ignore=DL3013
 # hadolint ignore=DL3007 
COPY ./index.html /usr/share/nginx/html/index.html
