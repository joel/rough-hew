require 'spec_helper'

describe Post do
  let(:post) { build :post }

  subject { post }

  describe "Testing validations" do
    it { should be_valid }
    it { subject.save.should be_true }

    context 'attributes_for' do
      it { expect { attributes_for(:post) }.to_not raise_error }
    end

    context 'build_stubbed' do
      it { expect { build_stubbed(:post) }.to_not raise_error }
    end
  end
end
