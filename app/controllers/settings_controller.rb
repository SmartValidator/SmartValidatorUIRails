# Responsible for the settings view.
class SettingsController < ApplicationController
  before_action :authenticate_user!

  # GET /settings
  def index
    authorize self

    @settings = {
      conflict_handler_heuristics: Setting.value_for_key('conflict_handler.heuristics', 'inactive').to_sym,
      conflict_handler_whitelist_after_days: Setting.value_for_key('conflict_handler.whitelist_after_days', '1'),
      simulator_mode: (Setting.value_for_key('simulator.mode', '0') == '1')
    }
  end

  # POST /settings/set_key
  def set_key
    authorize self

    # Abort if no key is provided of the key isn't known.
    if Setting::KEYS.reject {|x| x[:key] != params[:key]}.count == 0
      render body: nil, status: 404
      return
    end

    # Abort if the value is invalid.
    # Check the regular expression against the provided value.
    val = params[:value]
    key_hash = Setting::KEYS.reject {|x| x[:key] != params[:key]}.first
    if (key_hash[:type] == :string && !val.match(key_hash[:valid_values])) || (key_hash[:type] == :int && !val.to_i.between?(key_hash[:minimum_value], key_hash[:maximum_value]))
      render body: nil, status: 422
      return
    end

    # The key and the value is save.

    # Retrieve the existing settings entry.
    setting_entry = Setting.where(key: params[:key]).first

    # Create a new one, if no entry exists yet.
    setting_entry = Setting.new(
      key: params[:key]
    ) unless setting_entry

    # Store the value.
    setting_entry.value = params[:value]

    # Update the entry and return.
    render(body: nil, status: setting_entry.save ? 200 : 500)
  rescue
    render body: nil, status: 500
  end

end


