class CreateSalaryRanges < ActiveRecord::Migration[6.0]
  def change
    create_table :salary_ranges do |t|
      t.float :min_salary
      t.float :max_salary
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
