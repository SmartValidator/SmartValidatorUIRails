Rails.configuration.global = {
  platform: {
    name: 'SmartValidatorUI',
  },
  pages: {
    index: {
      timeline_conflicts: {
        show_last_n_entries: 25
      }
    }
  },
  simulator: {
    mode_change_url: 'http://localhost:6662/modeChange'
  },
  users: {
    model: {
      password: {
        minimum_length: 8 # Change also in devise.rb!
      }
    }
  }
}
