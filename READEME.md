# Full Cycle Rocks - Go Challenge

Desafio Full Cycle: Criar uma imagem Docker em Go com menos de 2MB que imprime "Full Cycle Rocks!!"

## 🚀 Como usar

### Executar a imagem do Docker Hub:

```bash
docker run pedrovieira249/fullcycle
```

**Resultado esperado:**
```
Full Cycle Rocks!!
```

## 📦 Estrutura do Projeto

```
fullcycle-go/
├── main.go       # Código Go
├── Dockerfile    # Multi-stage build com scratch
└── README.md     # Este arquivo
```

## 🛠️ Build Local

### 1. Compilar e testar localmente:

```bash
# Compilar o programa Go
go build -o fullcycle main.go

# Executar
./fullcycle
```

### 2. Build da imagem Docker:

```bash
# Build da imagem
docker build -t pedrovieira249/fullcycle .

# Verificar o tamanho da imagem
docker images | grep fullcycle

# Executar
docker run pedrovieira249/fullcycle
```

### 3. Push para o Docker Hub:

```bash
# Login no Docker Hub
docker login

# Push da imagem
docker push pedrovieira249/fullcycle
```

## 📊 Tamanho da Imagem

A imagem final tem **menos de 2MB** graças ao uso de:
- **Multi-stage build**: Separa compilação da imagem final
- **Imagem scratch**: Imagem vazia (0 bytes)
- **Compilação estática**: Binário sem dependências externas
- **Flags de otimização**: `-ldflags="-s -w"` remove símbolos de debug

## 🔍 Como Funciona

### Multi-stage Build:

1. **Stage 1 (builder)**: Usa `golang:1.21-alpine` para compilar o código
2. **Stage 2 (final)**: Usa `scratch` (imagem vazia) e copia apenas o binário

### Flags de compilação:

- `CGO_ENABLED=0`: Desabilita CGO (dependências C)
- `GOOS=linux`: Compila para Linux
- `-ldflags="-s -w"`: Remove símbolos de debug e reduz tamanho
  - `-s`: Omite a tabela de símbolos
  - `-w`: Omite informações de debug DWARF

## 📝 Código Go

```go
package main

import "fmt"

func main() {
    fmt.Println("Full Cycle Rocks!!")
}
```

## 🎯 Objetivo do Desafio

- ✅ Imagem funcional que imprime "Full Cycle Rocks!!"
- ✅ Imagem com menos de 2MB
- ✅ Publicada no Docker Hub
- ✅ Código fonte no GitHub

## 🔗 Links

- **Docker Hub**: https://hub.docker.com/r/pedrovieira249/fullcycle
- **GitHub**: [Seu link aqui]

## 👤 Autor

Pedro Vieira - Full Cycle Student

---

**Full Cycle Rocks!!** 🚀