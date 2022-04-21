require 'spec_helper'

class ChildEntity < OpenDotaApi::Entity
  def a
    "special datum"
  end
end

describe OpenDotaApi::Entity do
  let(:data) { { "very_nice": "datum" } }

  subject { described_class.new(data) }

  describe "initializing with a hash adds instance methods to the Entity" do
      it { is_expected.to respond_to(:very_nice) }
      it { expect(subject.very_nice).to eq("datum") }
      it { is_expected.not_to respond_to(:not_nice) }
  end

  describe ".define_adder" do
    # these tests aren't perfectly isolated. Opening the
    # class and adding instance methods makes that method
    # available to all objects of that class, as long as the
    # class constant remains defined in the current scope.
    # To fully isolate these tests, we'd need a before block
    # that looked something like:
    #
    #   src_loc = OpenDotaApi.const_source_location(:Entity)
    #   OpenDotaApi.send(:remove_const, :Entity)
    #   Kernel.load(src_loc[0])
    #
    # This is pretty janky, and doesn't seem necessary, just
    # want to preserve in case others get confused

    let(:instance) { described_class.new({ "a": "a_datum" }) }

    subject { instance.class.define_adder(["a"]) }

    before(:each) { subject }

    it "adds an instance method #a to the Entity object" do
      expect(instance).to respond_to(:a)
    end

    it { expect(instance.a).to eq("a_datum") }

    describe ChildEntity do
      it "existing instance methods are not overridden" do
        expect(instance.a).to eq("special datum")
      end
    end

    it "appends instance methods for subsequently created instances" do
      second = OpenDotaApi::Entity.new({})
      expect(second).to respond_to(:a)
      expect(second.a).to be_nil
    end

    it "doesn't append an instance method in the parent" do
      subclass = ChildEntity.new({})
      subclass.class.define_adder(["b"])
      expect(subclass).to respond_to(:b)
      expect(instance).not_to respond_to(:b)
    end

    it "reopens the class of already-created instances" do
      OpenDotaApi::Entity.define_adder(["c"])
      expect(instance).to respond_to(:c)
    end
  end

  describe ".define_child_entity" do
    subject { described_class.new({"child_key" => {"d": "e"} }) }

    before(:each) { subject.class.define_child_entity(ChildEntity, "child_key") }

    it { is_expected.to respond_to(:child_key) }
    it { expect(subject.child_key).to be_a(ChildEntity) }
    it { expect(subject.child_key.d).to eq "e"}
  end
end
