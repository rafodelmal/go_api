# Api Go

This project was develop in GoLand 2020.3 (Jetbrains)

## Prerequsites
Use Microsoft Terminal and check:

`go version`

![Go not install](/doc/img/img1.png "Go not install locally")

GOROOT:

SDK Go Path

GOPATH:

Project Path


Build

`go build file.go`

Run

`go run file.go`

or

`./file`

Add Github Actions v5

```mermaid
graph TD
    A[Christmas] -->|Get money| B(Go shopping)
    B --> C{Let me think}
    C -->|One| D[Laptop]
    C -->|Two| E[iPhone]
    C -->|Three| F[fa:fa-car Car]
```
```flow
st=>start: Start
op=>operation: Your Operation
cond=>condition: Yes or No?
e=>end

st->op->cond
cond(yes)->e
cond(no)->op
```
```sequence
participant C
participant B
participant A
Note right of A: By listing the participants\n you can change their order
```
