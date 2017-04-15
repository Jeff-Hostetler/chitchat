// include spec/javascripts/helpers/some_helper_file.js and app/assets/javascripts/foo.js
//= require cable
describe('cable', function() {
  it('initializes an App with cable', function() {
    expect(App).not.toEqual(undefined);
    expect(App.cable).not.toEqual(undefined);
  });
});