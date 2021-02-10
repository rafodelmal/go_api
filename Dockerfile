FROM golang:alpine

# ENV GO111MODULE=on \
#    CGO_ENABLED=0 \
#    GOOS=linux \
#    GOARCH=amd64

LABEL maintainer="Jose Rafael Arrieta Dominguez"
RUN go version

ENV GOPATH /go

COPY ./mvc/app /go/src/app
COPY ./mvc/services /go/src/services
COPY ./mvc/utils /go/src/utils
COPY ./mvc/domain /go/src/domain
COPY ./mvc/controllers /go/src/controllers


WORKDIR /

COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

RUN go build -o main ./mvc
 
EXPOSE 80

CMD ["/main"]
