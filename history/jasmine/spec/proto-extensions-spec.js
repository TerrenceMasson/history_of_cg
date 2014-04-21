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
      it('should find the word shred', function() { 
        expect(testingString.contains("SHRED")).toBe(true); 
      });
    });
    describe('isEmpty', function() {
      it('should return true on an empty string', function() {
        expect(''.isEmpty()).toBe(true);
      });
      it('should return false on a non empty string', function() {
        expect('SHRED'.isEmpty()).toBe(false);
      })
    });
  });


  describe('Array extensions', function() {
    describe('unique', function() {
      var testArray;
      beforeEach(function() {
        testArray = [ 1, 7, 47, '2', '1', 47, 1, '2', 47 ];
      });

      it('should only contain one 47 after calling unique', function() {
        var result = testArray.unique(),
            arrayOf47 = result.filter(function(item, idx) { return item === 47 });
        expect(arrayOf47.length).toBe(1);
      });

      it('should only contain one "2" after calling unique', function() {
        var result = testArray.unique(),
            arrayOf2 = result.filter(function(item, idx) { return item === '2' });
        expect(arrayOf2.length).toBe(1);
      });

    });
  })

});