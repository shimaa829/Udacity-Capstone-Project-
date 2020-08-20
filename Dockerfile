# hadolint ignore=DL3007
FROM nginx:latest

# hadolint ignore=DL3003,SC1035
COPY ./index.html /usr/share/nginx/html/index.html
