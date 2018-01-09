resource "aws_route53_record" "alb_nodes" {
  zone_id = "${data.aws_route53_zone.service.zone_id}"
  name = "*.${var.service_domain_name}"
  type = "A"
  alias {
    name = "${aws_lb.alb_external.dns_name}"
    zone_id = "${aws_lb.alb_external.zone_id}"
    evaluate_target_health = false
  }
}
