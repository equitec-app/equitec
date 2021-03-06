class AddInformationToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :nit, :string
    add_column :customers, :phone, :string
    add_column :customers, :principal_direction, :string
    add_column :customers, :legal_agent, :string
    add_column :customers, :legal_agent_phone, :string
    add_column :customers, :legal_agent_mail, :string

    add_column :customers, :mainteance_agent, :string
    add_column :customers, :mainteance_phone, :string

    add_column :customers, :payments_manager, :string
    add_column :customers, :payments_phone, :string
    add_column :customers, :payments_mail, :string

    add_column :customers, :cost_center, :string
    add_reference :customers, :employee, foreign_key: true, index:true

  end
end
