require "rails_helper"

RSpec.describe FileImport, :type => :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of :content }
  end
 
  describe "Relations" do
    it { is_expected.to have_many :sales }
  end
end