if Rails.env.production?
  Recaptcha.configure do |config|
    config.public_key  = '6LcDz-0SAAAAAHfUF582MNYmcHRpgSALJ0POUMVl'
    config.private_key = '6LcDz-0SAAAAAIksUxNM3t6QeLo9jreA6pFytd26'
  end
else
  Recaptcha.configure do |config|
    config.public_key  = '6LdwzO0SAAAAAG6ggK_SfUjcELIVINe3av7pQFLs'
    config.private_key = '6LdwzO0SAAAAADWFi8rpcKgNrCM3vsoQVkRy3Jl3'
  end
end
