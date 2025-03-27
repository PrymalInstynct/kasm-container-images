variable "IMAGE" {
    default = "kasm-rhel-9"
}

variable "TAG" {
    default = "dev"
}

group "default" {
    targets = ["base", "desktop", "vs-code"]
}

target "base" {
    context = "."
    dockerfile = "containerfile-kasm-rhel-9-core"
    tags = ["${IMAGE}-base:${TAG}"]
}

target "desktop" {
    context = "."
    dockerfile = "containerfile-kasm-rhel-9-desktop"
    tags = ["${IMAGE}-desktop:${TAG}"]
    depends_on = ["base"]
}

target "vs-code" {
    context = "."
    dockerfile = "containerfile-kasm-rhel-9-vs-code"
    tags = ["${IMAGE}-vs-code:${TAG}"]
    depends_on = ["base"]
}
