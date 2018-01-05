class ChangeSnackMachinesToSnackmachines < ActiveRecord::Migration[5.1]
  def change
     rename_table :snack_machines, :snackmachines
  end
end
