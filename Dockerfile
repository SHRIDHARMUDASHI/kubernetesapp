FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    bash \
    # Add additional packages needed by wisecow.sh here
    # e.g. curl, git, etc.
    && apt-get clean
RUN apt install fortune-mod cowsay -y
RUN apt install netcat-openbsd -y

# Set the working directory
WORKDIR /app

# Copy the shell script files and .bashrc
COPY wisecow.sh .
COPY .bashrc /root/.bashrc

# Set execute permissions for the shell script
RUN chmod +x wisecow.sh

# Set environment variables
ENV PATH="/usr/games:${PATH}"

# Expose the application port
EXPOSE 4499
# Start the application
CMD ["./wisecow.sh"]
