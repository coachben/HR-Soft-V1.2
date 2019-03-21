class Employment < ApplicationRecord
    belongs_to :worker
    belongs_to :company
end
