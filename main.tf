# This quite clearly does not follow section 3.2.2 of RFC4193.
# https://datatracker.ietf.org/doc/html/rfc4193#section-3.2.2

resource "random_id" "ula" {
  byte_length = 5
}

locals {
  sub0    = substr(random_id.ula.hex, 0, 2)
  sub1    = substr(random_id.ula.hex, 2, 4)
  sub2    = substr(random_id.ula.hex, 6, 4)
  network = "fd${local.sub0}:${local.sub1}:${local.sub2}::/48"
}

