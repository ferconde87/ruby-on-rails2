class Hobby < ApplicationRecord
    has_and_belong_to_many :people
end
