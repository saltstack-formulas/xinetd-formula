require 'serverspec'

# Required by serverspec
set :backend, :exec

describe "xinetd" do
  it "package is installed" do
    expect(package("xinetd")).to be_installed
  end

  it "service is enabled" do
    expect(service("xinetd")).to be_enabled
  end

  it "service is running" do
    expect(service("xinetd")).to be_running
  end

end
