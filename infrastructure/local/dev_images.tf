# Build base Meltano docker image
resource "docker_image" "meltano" {
  name = "localhost:5000/meltano:latest"
  build {
    path       = "../../"
    dockerfile = "infrastructure/local/Dockerfile"
    label = {
      # Forces rebuild on tf apply
      build_ts: timestamp()
    }
  }
  provisioner "local-exec" {
    command = "docker push localhost:5000/meltano:latest"
  }
  depends_on = [docker_container.registry]
}
