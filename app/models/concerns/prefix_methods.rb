# Includes common methods for models with a prefix attribute.
module PrefixMethods
  extend ActiveSupport::Concern
  included do
    scope :in_prefix, -> (ip) {where('prefix <<= ?', ip.to_string)}
  end
end
