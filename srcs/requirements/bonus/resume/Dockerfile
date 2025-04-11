FROM alpine:3.20.6

RUN apk update && apk upgrade && \
    apk add --no-cache \
    git vim curl

RUN curl -L https://go.dev/dl/go1.24.1.linux-amd64.tar.gz -o go.tar.gz && \
    tar -C /usr/local -xzf go.tar.gz && \
    rm go.tar.gz

ENV PATH="/usr/local/go/bin:${PATH}"

WORKDIR /home/app

RUN git clone https://github.com/alejuliao/go-first.git .

RUN go build -v -o main .

EXPOSE 3000

ENTRYPOINT ["./main"]