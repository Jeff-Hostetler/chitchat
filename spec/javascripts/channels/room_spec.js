// include spec/javascripts/helpers/some_helper_file.js and app/assets/javascripts/foo.js
//= require channels/room
describe('room', function () {
  var room;
  beforeEach(function () {
    room = App.room;
  });
  describe('#connected', function () {
    it('exists', function () {
      expect(room.connected).toEqual(jasmine.any(Function))
    });
  });

  describe('#disconnected', function () {
    it('exists', function () {
      expect(room.disconnected).toEqual(jasmine.any(Function))
    });
  });

  describe('#received', function () {
    it('calls to alert user with text', function () {
      //TODO when not alerting and pushing messages, don't spy.
      //Running specs with the alert causes the alert to fire which is annoying so spying for now.
      received = jasmine.createSpy('received');
      expect(room.received).toEqual(jasmine.any(Function))
    });
  });

  describe('#speak', function () {
    it('calls speak with data', function () {
      //TODO test when not doing alert
    });
  });
});