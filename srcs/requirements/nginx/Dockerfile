FROM alpine:3.19

RUN apk update && apt upgrade && apk add --no-cache nginx

EXPOSE 443

CMD ["nginx","-g", "daemon off;"]