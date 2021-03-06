# == Define: qpid::router::ssl_profile
#
# Configures an SSL profile for Qpid Dispatch Router
#
# == Parameters
#
# $ca::         Location of CA pem file
#
# $cert::       Location of certificate pem file
#
# $key::        Location of private key pem file
#
# $password::   Password, if required
#
# == Advanced
#
# $config_file::    The config file to use
#
define qpid::router::ssl_profile(
  Stdlib::Absolutepath $ca,
  Stdlib::Absolutepath $cert,
  Stdlib::Absolutepath $key,
  Optional[String] $password = undef,
  String $config_file = $::qpid::router::config_file,
) {
  concat::fragment {"qdrouter+ssl_${title}.conf":
    target  => $config_file,
    content => template('qpid/router/ssl_profile.conf.erb'),
    order   => '02',
  }
}
