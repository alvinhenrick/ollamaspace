# Use the official Ollama Docker image
FROM ollama/ollama:latest

# Expose port 11434
EXPOSE 11434

# Create a new user "ollama" and a home directory
RUN adduser --disabled-password --gecos "" ollama && \
    mkdir -p /home/ollama/.ollama /home/ollama/.ollama/models && \
    chown -R ollama:ollama /home/ollama/.ollama

# Set environment variables to specify the custom directories
ENV OLLAMA_HOME=/home/ollama/.ollama \
    OLLAMA_MODELS=/home/ollama/.ollama/models

# Set the user to "ollama"
USER ollama

# Command to run Ollama and serve
ENTRYPOINT ["/bin/ollama"]
CMD ["serve"]