FROM node:18-alpine

USER root

RUN apk add --no-cache git
RUN apk add --no-cache python3 py3-pip make g++
# needed for pdfjs-dist
RUN apk add --no-cache build-base cairo-dev pango-dev

# Install Chromium
RUN apk add --no-cache chromium

ENV PUPPETEER_SKIP_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# You can install a specific version like: flowise@1.0.0
RUN npm install -g flowise@1.6.5
# RUN npm install -g git+https://github.com/FlowiseAI/Flowise.git

WORKDIR /data



# Expose the specified port
EXPOSE ${PORT}

# Start the application with a delay
CMD /bin/sh -c "sleep 3; flowise start"

