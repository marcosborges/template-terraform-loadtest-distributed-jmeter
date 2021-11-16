module "loadtest" {

  source = "marcosborges/loadtest-distribuited/aws"

  name = "execution-name-jmeter-loadtest"

  executor            = var.executor
  loadtest_dir_source = "../plans/"
  nodes_size          = 2

  loadtest_entrypoint = <<-EOT
    jmeter \
        -n \
        -t basic.jmx  \
        -R "{NODES_IPS}" \
        -l /loadtest/logs -e -o /var/www/html/jmeter \
        -Dnashorn.args=--no-deprecation-warning \
        -Dserver.rmi.ssl.disable=true
  EOT

  subnet_id = data.aws_subnet.current.id
}