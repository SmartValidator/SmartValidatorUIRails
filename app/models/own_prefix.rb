# Stores a prefix from the operator which should be highlighted in the UI.
class OwnPrefix < ApplicationRecord
  validates_presence_of :prefix
end
