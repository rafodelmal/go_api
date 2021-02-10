FROM golang:alpine

# ENV GO111MODULE=on \
#    CGO_ENABLED=0 \
#    GOOS=linux \
#    GOARCH=amd64

LABEL maintainer="Jose Rafael Arrieta Dominguez"
RUN go version

ENV GOPATH /go

COPY ./github.com/rafodelmal/go_api/mvc/app /go/src/app
COPY ./github.com/rafodelmal/go_api/mvc/services /go/src/services
COPY ./github.com/rafodelmal/go_api/mvc/utils /go/src/utils
COPY ./github.com/stretchr/testify/assert /go/src/stretchr/testify/assert
COPY ./github.com/rafodelmal/go_api/mvc/domain /go/src/domain
COPY ./github.com/rafodelmal/go_api/mvc/controllers /go/src/controllers

WORKDIR /

COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

RUN go build -o main ./mvc
 
EXPOSE 80

CMD ["/main"]
