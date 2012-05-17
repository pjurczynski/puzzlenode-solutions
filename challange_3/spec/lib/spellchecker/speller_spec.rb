require_relative '../../spec_helper'

module SpellChecker
  describe Speller do
    let(:messenger) { double("messenger").as_null_object }
    let(:speller) { Speller.new(messenger) }
    context "starting up" do
      it "should start the spell checker with passed suggestions" do
        messenger.should_receive(:puts).with("Enter the word:")
        speller.run(%w{nom numb})
      end
    end

    context "checking a word" do
      it "should return numb" do
        messenger.should_receive(:puts).with("numb")
        speller.run(%w{nom numb})
        speller.check('numm')
      end

      it "should return remembrance" do
        pending
        messenger.should_receive(:puts).with("remembrance")
        speller.run(%w{reminiscence remembrance})
        speller.check('remimance')
      end
    end
  end
end
