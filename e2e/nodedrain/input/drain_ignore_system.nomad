# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

job "drain_ignore_system_service" {

  type = "system"

  constraint {
    attribute = "${attr.kernel.name}"
    value     = "linux"
  }

  group "group" {

    task "task" {
      driver = "docker"

      config {
        image   = "busybox:1"
        command = "/bin/sh"
        args    = ["-c", "sleep 300"]
      }

      resources {
        cpu    = 256
        memory = 128
      }
    }
  }
}
