class ntp {
  package { 'ntp':
    ensure => 'present',
    }

  file { '/etc/ntp.conf':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    source  => 'puppet:///modules/ntp/ntp_conf',
    require => Package['ntp'],
    notify  => Service['ntpd'],
    }

  service { 'ntpd':
    ensure  => 'running',
    enable  => true,
    require => File['/etc/ntp.conf'],
    }
}
