module PathRewrite
  describe PathTranslation do

    context "validation" do

      before { PathTranslation.create!(old_path: "from", new_path: "to") }

      it "enforces unique FROM path" do
        expect{PathTranslation.create!(old_path: "from", new_path: "to")}.to raise_error(ActiveRecord::RecordInvalid)
      end

    end

  end
end
