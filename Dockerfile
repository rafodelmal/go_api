FROM golang:latest

LABEL maintainer="Jose Rafael Arrieta"

WORKDIR /

COPY . .

RUN go build -o main ./mvc
 
EXPOSE 80

CMD ["/main"]
