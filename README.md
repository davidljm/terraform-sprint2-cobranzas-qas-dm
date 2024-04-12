## Requirements

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.43.0 |
| <a name="provider_github"></a> [github](#provider\_github) | 6.2.1 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.5 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 5.6.0 |

## Resources

| Name | Type |
|------|------|
| [aws_instance.COBRANZAS_dev_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_instance.grafana_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.ec2-server-ssh-key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_security_group.instance_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.grafana_ingress_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [github_actions_secret.host](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_actions_secret.ssh_private_key](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [tls_private_key.ssh_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | ID de la AMI | `string` | `"ami-0a3c3a20c09d6f377"` | no |
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | Asociar dirección IP pública | `bool` | `true` | no |
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | Reglas de egreso para el grupo de seguridad | <pre>list(object({<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "cidr_blocks": [<br>      "0.0.0.0/0"<br>    ],<br>    "from_port": 22,<br>    "protocol": "tcp",<br>    "to_port": 22<br>  },<br>  {<br>    "cidr_blocks": [<br>      "0.0.0.0/0"<br>    ],<br>    "from_port": 443,<br>    "protocol": "tcp",<br>    "to_port": 443<br>  }<br>]</pre> | no |
| <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input\_enable\_nat\_gateway) | Habilitar el Nat Gateway | `bool` | `true` | no |
| <a name="input_enable_vpn_gateway"></a> [enable\_vpn\_gateway](#input\_enable\_vpn\_gateway) | Habilitar el Vpn Gateway | `bool` | `true` | no |
| <a name="input_github_owner"></a> [github\_owner](#input\_github\_owner) | Propietario del repositorio en GitHub | `string` | `"alkemytech"` | no |
| <a name="input_github_repository"></a> [github\_repository](#input\_github\_repository) | Nombre del repositorio en GitHub | `string` | `"UMSA-DevOps-T4"` | no |
| <a name="input_github_token"></a> [github\_token](#input\_github\_token) | n/a | `any` | n/a | yes |
| <a name="input_host_secret_name"></a> [host\_secret\_name](#input\_host\_secret\_name) | Nombre del secreto para el host en GitHub | `string` | `"HOST_COBRANZAS"` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | Reglas de ingreso para el grupo de seguridad | <pre>list(object({<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "cidr_blocks": [<br>      "0.0.0.0/0"<br>    ],<br>    "from_port": 22,<br>    "protocol": "tcp",<br>    "to_port": 22<br>  },<br>  {<br>    "cidr_blocks": [<br>      "0.0.0.0/0"<br>    ],<br>    "from_port": 443,<br>    "protocol": "tcp",<br>    "to_port": 443<br>  },<br>  {<br>    "cidr_blocks": [<br>      "0.0.0.0/0"<br>    ],<br>    "from_port": 3000,<br>    "protocol": "tcp",<br>    "to_port": 3000<br>  }<br>]</pre> | no |
| <a name="input_instance_tags"></a> [instance\_tags](#input\_instance\_tags) | Etiquetas para la instancia EC2 | `map(string)` | <pre>{<br>  "Name": "ORG-COBRANZAS-DEV"<br>}</pre> | no |   
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Tipo de instancia | `string` | `"t2.micro"` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | Subredes privadas | `list(string)` | <pre>[<br>  "10.0.1.0/24",<br>  "10.0.2.0/24"<br>]</pre> | no |    
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | Subredes públicas | `list(string)` | <pre>[<br>  "10.0.101.0/24",<br>  "10.0.102.0/24"<br>]</pre> | no |   
| <a name="input_security_group_description"></a> [security\_group\_description](#input\_security\_group\_description) | Descripción del grupo de seguridad | `string` | `"Security group for EC2 instance"` | no |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | Nombre del grupo de seguridad | `string` | `"instance_security_group"` | no |
| <a name="input_ssh_private_key_secret_name"></a> [ssh\_private\_key\_secret\_name](#input\_ssh\_private\_key\_secret\_name) | Nombre del secreto para la clave SSH en GitHub | `string` | `"SSH_PRIVATE_KEY_COBRANZAS"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Etiquetas para la VPC | `map(string)` | <pre>{<br>  "Environment": "dev",<br>  "Terraform": "true"<br>}</pre> | no |
| <a name="input_vpc_azs"></a> [vpc\_azs](#input\_vpc\_azs) | Zonas de disponibilidad de la VPC | `list(string)` | <pre>[<br>  "us-east-1b",<br>  "us-east-1c"<br>]</pre> | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | vpc cidr | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | nombre de la vpc | `string` | `"vpc-terraform-entregable"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_ip_dev"></a> [public\_ip\_dev](#output\_public\_ip\_dev) | Salida para mostrar la IP pública de la instancia EC2 después del despliegue |
| <a name="output_ssh_private_key"></a> [ssh\_private\_key](#output\_ssh\_private\_key) | n/a |


### Initial

1 - En linea de comandos por medio del comando  $ aws configure , ingresar acces_key y secret_key correspondientes.

2 - En el archivo github.tf modificar los valores del repositorio como token, owner y repository.

3 - Ejecutar los comandos para construir la infraestructura:

    $ terraform init 
    $ terraform plan 
    $ terraform apply
    
    # Se solicitara ingresar el token de Github en consola para cargar las secrets en el repositorio

### GRAFANA
OPEN EC2 CONSOLE OR SSH 

Step 1: sudo su  

Step 2: The installation is via yum repository, create a grafana.repo under:
cd /etc/yum.repos.d/
vi grafana.repo  

Step 3: Put below content in grafana.repo with i and save it with :wq!.

    [grafana]
    name=grafana
    baseurl=https://packages.grafana.com/oss/rpm
    repo_gpgcheck=1
    enabled=1
    gpgcheck=1
    gpgkey=https://packages.grafana.com/gpg.key
    sslverify=1
    sslcacert=/etc/pki/tls/certs/ca-bundle.crt 

Step 4: Once done with the above steps. It's time to install grafana now:

sudo yum -y install grafana  

Step 5: Start the server:

sudo systemctl start grafana-server

systemctl status grafana-server 

Step 6: Open in the browser with te public ip o public dns with :3000 (the port).

The user and pass the firs time is admin admin, change it. 

Step 7: In Grafana Home, go to Configuration --> Data Sources and select add Data source

Step 8: Search CloudWatch

Step 9: in CloudWatch's settings put in Auth Provider access & secret key

Step 10: put yours credentials

Step 11: in CloudWatch's Dashboards import AWS EC2 and AWS EBS, or you can make new dashboards.

Step 12: in Grafana Home select Dashboards and choice EC2 or EBS.
