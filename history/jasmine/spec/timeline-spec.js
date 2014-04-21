describe('Timeline', function() {
  describe('TimelineUtils module findRange method', function() {
    it('should return [1900, 1905] for input (1903, 10)', function() {
      var result = Hist.TimelineUtils.findRange(1903, 10);
      expect(result[0]).toBe(1900);
      expect(result[1]).toBe(1905);
    });

    it('should return [1905, 1910] for input (1906, 10)', function() {
      var result = Hist.TimelineUtils.findRange(1906, 10);
      expect(result[0]).toBe(1905);
      expect(result[1]).toBe(1910);
    });

    it('should return [1940, 1945] for input (1945, 10)', function() {
      var result = Hist.TimelineUtils.findRange(1945, 10);
      expect(result[0]).toBe(1940);
      expect(result[1]).toBe(1945);
    });

  });
});