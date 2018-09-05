class ChangeDocusignEnvelopeIdToBeStringInDocuments < ActiveRecord::Migration[5.2]
  def change
    change_column :documents, :docusign_envelope_id, :string, default: "0"
  end
end
