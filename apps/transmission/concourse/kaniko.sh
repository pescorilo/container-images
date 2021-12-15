#!/bin/sh
mkdir -p /kaniko/.docker
          echo '{\"auths\":{\"${CI_REGISTRY}\":{\"auth\":\"$(printf "%s:%s" "${CI_REGISTRY_USER}" "${CI_REGISTRY_PASSWORD}" | base64 | tr -d '\n')\"}}}" > /kaniko/.docker/config.json
          /kaniko/executor \
          --context "${DOCKER_DIR}" \
          --dockerfile "${DOCKER_DIR}/Dockerfile" \
          --destination "${DESTINATION}:${TAG}"