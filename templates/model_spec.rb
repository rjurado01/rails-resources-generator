require 'rails_helper'

RSpec.describe XXX do
  describe "Document" do
    it { is_expected.to be_timestamped_document }
  end

  describe "Fields" do
    # it { is_expected.to have_field(:field).of_type(String) }
  end

  describe "Relations" do
    # it { is_expected.to belong_to(:relation) }
    # it { is_expected.to have_many(:relation) }
    # it { is_expected.to have_and_belong_to_many(:relation) }
  end

  describe "Validations" do
    # it { is_expected.to validate_presence_of(:field) }
    # it { is_expected.to validate_uniqueness_of(:field) }
    # it { is_expected.to validate_numericality_of(:field) }
    # it { is_expected.to validate_inclusion_of(:field).to_allow([]) }
  end

  describe "Hooks" do
    context "when create" do
    end

    context "when update" do
    end

    context "when destroy" do
    end
  end

  describe "Methods" do
  end
end
