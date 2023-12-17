# Stage 1: Build the executable
FROM golang:alpine as builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -tags lambda.norpc -o bootstrap .

# Stage 2: Create the scratch container
FROM scratch
COPY --from=builder /app/bootstrap .
ENTRYPOINT ["./bootstrap"]
