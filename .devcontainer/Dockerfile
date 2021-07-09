# Use cirrusci flutter image as base
FROM cirrusci/flutter:stable

ENV USER="dev"

# Create user with proper privileges and give it access to required folders for flutter to work
RUN useradd -ms /bin/bash $USER
RUN chown -R $USER /sdks
RUN chown -R $USER /root

# Use newly created user
USER $USER
WORKDIR /home/$USER
