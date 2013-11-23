require 'spec_helper'

describe SiteConfig do
  describe "copy_attrs_and_errors" do
    it "should copy whitelisted attributes" do
      sc1 = FactoryGirl.create :site_config
      sc2 = SiteConfig.new
      sc2.copy_attrs_and_errors(sc1)
      sc2.site_name.should eq(sc1.site_name)
    end

    it "should not copy blacklisted attributes" do
      sc1 = FactoryGirl.create :site_config
      sc2 = SiteConfig.new
      sc2.copy_attrs_and_errors(sc1)
      sc2.password_digest.should_not eq(sc1.password_digest)
    end

    it "copies warnings" do
      sc1 = FactoryGirl.create :site_config
      sc1.errors.add(:base, "Danger!")
      sc2 = SiteConfig.new
      sc2.copy_attrs_and_errors(sc1)
      sc2.errors.count.should be(1)
    end
  end

  describe "save" do
    it "scrubs the description" do
      description = "something to be scrubbed"
      sc1 = FactoryGirl.create :site_config, description: description
      Loofah.should_receive(:scrub_fragment).with(description, :whitewash)
      sc1.save
    end
  end
end
