#################
# ELB attachment
#################
resource "aws_elb_attachment" "this" {
  count    = "${var.create_elb ? var.number_of_instances : 0}"
  elb      = "${aws_elb.this.id}"
  instance = "${element(var.instances, count.index)}"
}
