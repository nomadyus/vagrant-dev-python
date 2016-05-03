class { 'python':
    version => 'system',
    virtualenv => true,
    pip => true,
    dev => true
}