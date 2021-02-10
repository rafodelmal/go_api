FROM golang:alpine

LABEL maintainer="Jose Rafael Arrieta"
RUN go version

WORKDIR /

COPY . .

RUN go build -o main ./mvc
 
EXPOSE 80

CMD ["/main"]
