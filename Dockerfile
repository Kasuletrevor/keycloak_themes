FROM quay.io/keycloak/keycloak:24.0.3 AS builder

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
# Configure the database vendor
ENV KC_DB=postgres

WORKDIR /opt/keycloak

# Generate a self-signed certificate (for demonstration purposes only)
# RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 \
#     -dname "CN=server" -alias server \
#     -ext "SAN:c=DNS:localhost,IP:127.0.0.1" \
#     -keystore conf/server.keystore

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:24.0.3
COPY --from=builder /opt/keycloak/ /opt/keycloak/

# Copy the custom theme into the image
COPY ./my-theme/ /opt/keycloak/themes/my-theme

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--spi-theme-static-max-age=-1", "--spi-theme-cache-themes=false", "--spi-theme-cache-templates=false"]
