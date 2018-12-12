FROM swift:4.2

RUN mkdir -p /var/www/gaia
WORKDIR /var/www/gaia
COPY / .
RUN swift build -c release
CMD ./.build/x86_64-unknown-linux/release/GaiaWeb

