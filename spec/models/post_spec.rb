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

  context 'legacy behavior' do
    before { subject.comment = 'legacy comment' }
    its(:comment) { should eql 'legacy comment' }
    it { subject.comments.size.should eql 1 }
    context 'update' do
      let(:post) { build :post, comment: 'legacy comment' }
      before { subject.comment = 'new legacy comment' }
      its(:comment) { should eql 'new legacy comment' }
      it { subject.comments.size.should eql 1 }
    end
  end

  context 'new behavior' do
    let(:post) { build :post, :with_comments }
    it { subject.comments.size.should eql 3 }
  end
end
