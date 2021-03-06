shared_examples "no_redux_generator:base" do
  it "copies non-redux base files" do
    %w(client/app/bundles/HelloWorld/components/HelloWorldWidget.jsx
       client/app/bundles/HelloWorld/containers/HelloWorld.jsx
       client/app/bundles/HelloWorld/startup/HelloWorldAppClient.jsx
       client/package.json).each { |file| assert_file(file) }
  end

  it "does not place react folders in root" do
    %w(reducers store middlewares constants actions).each do |dir|
      assert_no_directory(dir)
    end
  end
end

shared_examples "no_redux_generator:no_server_rendering" do
  it "does not copy react server-rendering-specific files" do
    assert_no_file("client/webpack.server.rails.config.js")
    assert_no_file("client/app/bundles/HelloWorld/startup/HelloWorldAppServer.jsx")
  end
end

shared_examples "no_redux_generator:server_rendering" do
  it "copies the react server-rendering-specific files" do
    assert_file("client/webpack.server.rails.config.js")
    assert_file("client/app/bundles/HelloWorld/startup/HelloWorldAppServer.jsx")
  end
end
