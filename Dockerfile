# Usa uma imagem oficial do Python, versão leve
FROM python:3.10-slim

# Define o diretório de trabalho dentro do contentor
WORKDIR /app

# Copia o ficheiro de dependências para o contentor
COPY requirements.txt .

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia o resto do código da aplicação
COPY . .

# Expõe a porta que a API vai utilizar (geralmente 8000 para FastAPI)
EXPOSE 8000

# Comando para iniciar a aplicação
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]