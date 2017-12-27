Rails.configuration.global = {
  platform: {
    name: 'SmartValidatorUI',
  },
  users: {
    model: {
      password: {
        minimum_length: 8 # Change also in devise.rb!
      }
    }
  }
}
