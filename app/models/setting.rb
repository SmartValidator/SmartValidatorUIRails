# Setting entry
class Setting < ApplicationRecord
  validates_presence_of :key
  validates_uniqueness_of :key

  # Returns a value for the given key or an empty string.
  def self.value_for_key(key, default = '')
    self.where(:key => key.to_s).first.value
  rescue
    return default
  end

  KEYS = [
    {
      key: 'conflict_handler.heuristics',
      type: :string,
      valid_values: /inactive|filter_all|whitelist_all|whitelist_after_n_days/
    },
    {
      key: 'conflict_handler.whitelist_after_days',
      type: :int,
      minimum_value: 1,
      maximum_value: 32
    }
  ].freeze

  enum conflict_handler_heuristics: [
    :inactive,
    :filter_all,
    :whitelist_all,
    :whitelist_after_n_days
  ].freeze
  CONFLICT_HANDLER_HEURISTICS_OPTIONS = [
    [I18n.t('activerecord.meta.setting.conflict_handler_heuristics.inactive'), :inactive],
    [I18n.t('activerecord.meta.setting.conflict_handler_heuristics.filter_all'), :filter_all],
    [I18n.t('activerecord.meta.setting.conflict_handler_heuristics.whitelist_all'), :whitelist_all],
    [I18n.t('activerecord.meta.setting.conflict_handler_heuristics.whitelist_after_n_days'), :whitelist_after_n_days] # Has to be the last item!
  ].freeze

end
