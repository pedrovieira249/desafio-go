# Etapa 1: Build
FROM golang:1.21-alpine AS builder

WORKDIR /app

# Copia o código fonte
COPY main.go .

# Compila o binário de forma estática (sem dependências externas)
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o fullcycle main.go

# Etapa 2: Imagem final (usando scratch - imagem vazia)
FROM scratch

# Copia apenas o binário compilado
COPY --from=builder /app/fullcycle /fullcycle

# Define o comando padrão
ENTRYPOINT ["/fullcycle"]