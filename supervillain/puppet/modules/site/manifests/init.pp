class site::init{
    # configures actions for first and last stages
    class{'site::apt-get': stage => first }
    class{'site::configuration': stage => last }
}