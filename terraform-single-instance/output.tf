output "my_console_output" {
    value = aws_instance.app_server.public_ip  
}