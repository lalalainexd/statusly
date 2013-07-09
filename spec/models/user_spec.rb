require 'spec_helper'

describe User do
  describe "#add_feed_source" do
    it "adds a source to the feed" do
      u = User.create_with_password("test", "123", "123")
      source = User.create_with_password("source", "123", "123")
      u.add_feed_source(source)
      expect(u.feed.feed_sources.first.user).to eq(source)
    end
  end

  describe "#feed_items" do

    it "gets all the statuses" do
      u = User.create_with_password("test", "123", "123")
      source1 = User.create_with_password("source1", "123", "123")
      source2 = User.create_with_password("source2", "123", "123")
      u.add_feed_source(source1)
      u.add_feed_source(source2)

      status1 = source1.statuses.create(text: "hello")
      status2 = source1.statuses.create(text: "hello2")
      status3 = source2.statuses.create(text: "hello3")
      status4 = source2.statuses.create(text: "hello4")

      expect(u.feed_items).to include(status1)
      expect(u.feed_items).to include(status2)
      expect(u.feed_items).to include(status3)
      expect(u.feed_items).to include(status4)
    end

  end
end
