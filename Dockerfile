FROM golang:alpine

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

LABEL maintainer="Jose Rafael Arrieta"
RUN go version

WORKDIR /

COPY . .

RUN go build -o main ./mvc
 
EXPOSE 80

CMD ["/main"]
