# kasm-container-images

Store and Build custom Kasm Workspace Container Images

## Dependencies

- Red Hat Enterprise Linux Entitlements PEM files
  - The easiest way I have found to do this is to register the system in which the Container images will be built
  - Then copy the /etc/pki/entitlement folder to `kasm-container-images/src/rhel9/subscription-manager` in this project
  - Then copy the /etc/rhsm folder to `kasm-container-images/src/rhel9/subscription-manager` in this project

## Build Process

1. Log into the Red Hat Contianer Registry

```bash
docker login registry.redhat.io
```

2. Log into the Remote Container Registry you will push the container images into

```bash
docker login ghcr.io
```

3. Build the base image

```bash
docker image build -f containerfile-kasm-rhel-9-base -t kams-custom-images/kasm-rhel-9:base-dev -o type=registry .
```

4. Build the Desktop image

```bash
docker image build -f containerfile-kasm-rhel-9-desktop -t kams-custom-images/kasm-rhel-9:desktop-dev -o type=registry .
```

4. Build the VSCode image

```bash
docker image build -f containerfile-kasm-rhel-9-vs-code -t kams-custom-images/kasm-rhel-9:vs-code-dev -o type=registry .
```
