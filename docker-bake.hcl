group default {
  targets = [
    "proxy",
  ]
}

target proxy {
  tags = ["davidgageot135/http-proxy"]
  platforms = [
    "linux/amd64",
    "linux/arm64",
  ]
}