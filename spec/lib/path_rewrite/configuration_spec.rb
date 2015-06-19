module PathRewrite
  describe Configuration do

    it "exposes a singleton through #configuration" do
      expect(PathRewrite.configuration).to be PathRewrite.configuration
    end

    it "allows configuration of singleton through #configure block" do
      PathRewrite.configure do |config|
        expect(config).to be PathRewrite.configuration
      end
    end

    context "check_redirect" do

      after do
        PathRewrite.configuration.check_redirect = nil
      end

      it "supports static value setting" do
        PathRewrite.configuration.check_redirect = false
        expect(PathRewrite.configuration.check_redirect?).to eq false
      end

      it "supports lambda setting" do
        PathRewrite.configuration.check_redirect = -> { true }
        expect(PathRewrite.configuration.check_redirect?).to eq true
      end

    end

  end
end