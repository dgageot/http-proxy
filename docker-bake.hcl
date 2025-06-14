group default {
  targets = [
    "proxy",
  ]
}

# Required by docker/metadata-action and docker/bake-action gh actions.
target "docker-metadata-action" {}

target _base {
  inherits = ["docker-metadata-action"]
  output = ["type=docker"]
  platforms = ["linux/arm64", "linux/amd64"]
  attest = [
    {
      type = "provenance",
      mode = "max",
    },
    {
      type = "sbom",
    }
  ]
}

target proxy {
  inherits = ["_base"]
  tags = ["davidgageot135/http-proxy"]
}