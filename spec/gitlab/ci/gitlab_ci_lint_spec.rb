RSpec.describe Gitlab::Ci::Lint do
  it "Has a version number" do
    expect(Gitlab::Ci::Lint::VERSION).not_to be nil
  end
end
