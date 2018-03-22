######
# ELB
######
resource "aws_elb" "this" {
  count           = "${var.create_elb ? 1 : 0}"
  name            = "${var.name}"
  subnets         = ["${var.subnets}"]
  internal        = "${var.internal}"
  security_groups = ["${var.security_groups}"]

  cross_zone_load_balancing   = "${var.cross_zone_load_balancing}"
  idle_timeout                = "${var.idle_timeout}"
  connection_draining         = "${var.connection_draining}"
  connection_draining_timeout = "${var.connection_draining_timeout}"

  listener     = ["${var.listener}"]
  access_logs  = ["${var.access_logs}"]
  health_check = ["${var.health_check}"]

  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"
}

resource "aws_proxy_protocol_policy" "this" {
  count          = "${var.create_elb ! ? 0 : var.proxy_protocol ? 1 : 0}"
  load_balancer  = "${aws_elb.this.name}"
  instance_ports = ["${var.proxy_protocol_instance_ports}"]
}
