FROM golang:latest

LABEL maintainer="Jose Rafael Arrieta"

WORKDIR /

COPY . .
# We specify that we now wish to execute 
# any further commands inside our /app
# directory

# we run go build to compile the binary
# executable of our Go program
RUN go build -o main ./mvc
# Our start command which kicks off
# our newly created binary executable


ENTRYPOINT [ "./sampleapp" ]
 
EXPOSE 80
