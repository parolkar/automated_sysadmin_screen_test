class core::ruby{
    $packageList = [
        'build-essential',
        'ruby',
        'rubygems',
        'ruby1.9.1-dev'
    ]

    package{ $packageList: }
}