# Use the official Ollama Docker image
FROM ollama/ollama:latest

# Expose port 11434
EXPOSE 11434

# Create a directory within /root with appropriate permissions (if running as root)
RUN mkdir -p /.ollama && \
    chmod -R 700 /.ollama

# Set environment variable to tell the application where to store its data
ENV OLLAMA_HOME=/.ollama

# Command to run Ollama and serve
ENTRYPOINT ["/bin/ollama"]
CMD ["serve"]