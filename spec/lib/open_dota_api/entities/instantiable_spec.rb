require 'spec_helper'

class InstantiableClass
  include OpenDotaApi::Entities::Instantiatable

  attr_accessor :data

  def initialize(data)
    @data = data
  end
end

describe InstantiableClass do
  it { expect(described_class).to respond_to(:instantiate) }

  describe ".instantiate" do
    let(:data) { {"a" => "b" } }

    subject { InstantiableClass.instantiate(data) }

    it { is_expected.to be_a InstantiableClass }
    it { is_expected.to have_attributes(data: data) }

    context "when the given data does not respond to :keys" do
      let(:data) { ["a", "b"] }

      it "instantiates an instance per member of the enumerable" do
        expect(subject).to all(be_instance_of(InstantiableClass))
        expect(subject.map(&:data)).to eq(data)
      end
    end

    context "when the data passed in isn't mappable" do
      let(:data) { 1 }

      it { expect { subject }.to raise_error(ArgumentError) }
    end
  end
end
