node "test" {

  file {'/var/www':
    ensure => 'directory',
    owner   => root,
    group   => root,
    mode    => '755'
  }

  file {'/var/www/test-app/current':
    ensure => 'directory',
    owner   => root,
    group   => root,
    mode    => '755'
  }

  file {'/var/www/test-app/current/index.html':
    ensure => 'file',
    content => 'This is devops assignment task1 and task3	',
    owner   => root,
    group   => root,
    mode    => '755'
  }

  file {'/var/www/test-app':
    ensure => 'directory',
    owner   => root,
    group   => root,
    mode    => '755'
  }

  file {'/var/www/test-app/releases':
    ensure => 'directory',
    owner   => root,
    group   => root,
    mode    => '0644'
  }

  file {'/var/www/test-app/shared':
    ensure => 'directory',
    owner   => root,
    group   => root,
    mode    => '0644'
  }

  package {'nginx':
  ensure => installed
  }

  class { 'nginx':
    client_max_body_size => '512M',
  }

  # NGINX Configuration
  file { '/etc/nginx/ssl':
    ensure => directory,
    owner => 'root',
    group => 'root',
  }

  file { '/etc/nginx/ssl/example.com.crt':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => '/etc/ssl/certs/example.com.crt',
  }

  file { '/etc/nginx/ssl/example.com.key':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => '/etc/ssl/private/example.com.key',
  }

  $server_name = "testapi.example.com"

  nginx::resource::server {"$server_name":
    ssl                  => true,
    ssl_port             => 443,
    ssl_redirect         => true,
    ssl_cert             => "/etc/nginx/ssl/example.com.crt",
    ssl_key              => "/etc/nginx/ssl/example.com.key",
    ssl_protocols        => 'TLSv1.2 TLSv1.1 TLSv1',
    ensure               => present,
    use_default_location => false,
    www_root             => "/var/www/test-app/current/",
  }

  nginx::resource::location {"/":
    server                => "$server_name",
    ensure                => present,
    www_root             => "/var/www/test-app/current/",
    priority              => 401,
  }

}
