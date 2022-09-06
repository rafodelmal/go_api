FROM golang:1.19-alpine

# Set the Current Working Directory inside the container
WORKDIR $GOPATH/src/github.com/rafodelmal/go-api

# Copy everything from the current directory to the PWD (Present Working Directory) inside the container
COPY . .

# Download all the dependencies
RUN go get -d -v ./...

# Install the package
RUN go install -v ./...

RUN go build -o main

# This container exposes port 8080 to the outside world
EXPOSE 80


# Run the executable
CMD ["./main"]