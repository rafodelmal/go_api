FROM golang:alpine

# ENV GO111MODULE=on \
#    CGO_ENABLED=0 \
#    GOOS=linux \
#    GOARCH=amd64

LABEL maintainer="Jose Rafael Arrieta Dominguez"
RUN go version

ENV GOPATH /go

COPY ./mvc/app /go/src/github.com/rafodelmal/go_api/mvc/app
COPY ./mvc/services /go/src/github.com/rafodelmal/go_api/mvc/services
COPY ./mvc/utils /go/src/github.com/rafodelmal/go_api/mvc/utils
COPY ./mvc/domain /go/src/github.com/rafodelmal/go_api/mvc/domain
COPY ./mvc/controllers /go/src/github.com/rafodelmal/go_api/mvc/controllers


WORKDIR /

COPY . .

RUN go mod init
RUN go build -o main ./mvc
 
EXPOSE 80

CMD ["/main"]
