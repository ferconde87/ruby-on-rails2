class Person < ApplicationRecord
    has_one :personal_info
    has_many :jobs
    has_many :my_jobs, class_name "Job"
end
