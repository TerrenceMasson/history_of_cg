describe('prototype extensions', function() {
  describe('String extension', function() {
    describe('contains', function() {
      var testingString;
      beforeEach(function() {
        testingString = "TESTING SHRED jAsMiNe";
      });
      it('shouldnt find the word testing when case interested in case', function() {
        expect(testingString.contains("testing", false)).toBe(false);
      });
      it('should find the word jasmine when case insensitive', function() {
        expect(testingString.contains("jasmine", true)).toBe(true);
      });
      it('should find the word shred', function() { expect(testingString.contains("SHRED")).toBe(true); });
    });
  });
});