require "rails_helper"

RSpec.describe Sale, :type => :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of :file_import }
  end
 
  describe "Relations" do
    it { is_expected.to belong_to :file_import }
  end
end
