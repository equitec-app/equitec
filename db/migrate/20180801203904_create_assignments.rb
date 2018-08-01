class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.references :visit, foreign_key: { on_delete: :cascade }, index: true
      t.references :employee, foreign_key: { on_delete: :cascade }, index: true

      t.timestamps
    end
  end
end
