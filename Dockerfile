FROM docker.io/debian:trixie AS download
ARG VERSION=1.6.8
RUN apt-get update && apt-get install -y curl tar
# Download Vesktop and unpack
RUN curl -L https://github.com/Vencord/Vesktop/releases/download/v$VERSION/vesktop-$VERSION.tar.gz -o /tmp/vesktop.tar.gz && \
    mkdir /tmp/vesktop-files && \
    tar -xzf /tmp/vesktop.tar.gz -C /tmp/vesktop-files --strip-components=1 vesktop-$VERSION

#-------------------------------------------------------------------------------#
FROM docker.io/debian:trixie    
COPY --from=download /tmp/vesktop-files /usr/bin/vesktop-files
RUN ln -s /usr/bin/vesktop-files/vesktop /usr/bin/vesktop && \
    mkdir -p /usr/share/applications /usr/share/icons/hicolor/scalable/apps

COPY ./assets/vesktop.svg /usr/share/icons/hicolor/scalable/apps/vesktop.svg
COPY ./assets/vesktop.desktop /usr/share/applications/vesktop.desktop

# Install dependencies
RUN apt-get update && apt-get install -y \
    libnspr4 \
    libnss3 \
    libasound2t64 \
    libglib2.0-0t64 \
    pulseaudio-utils \
    libpulse0 \
    libasound2-plugins \
    libatk1.0-0t64 \
    libatk-bridge2.0-0t64 \
    libcups2t64 \
    libgtk-3-0t64 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libxkbcommon0 \
    libatspi2.0-0t64 \
    libspa-0.2-modules \
    pipewire

WORKDIR /usr/bin
USER 1000:1000
ENTRYPOINT ["/usr/bin/vesktop","--ozone-platform=wayland","--enable-features=WebRTCPipeWireCapturer"]