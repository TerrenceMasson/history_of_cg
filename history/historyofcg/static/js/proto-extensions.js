// String Additions
////////////////////
String.prototype.contains = function(substring, ignoreCase) {
  var lowerSubString = substring.toLowerCase(),
  lowerThis = this.toLowerCase();
  if (ignoreCase) {
    return lowerThis.indexOf(lowerSubString) > -1;
  } else {
    return this.indexOf(substring) > -1;
  }
}


String.prototype.isEmpty = function() {
  return this.trim() === "";
}

// Array Additions
///////////////////

Array.prototype.clone = function() {
  return this.slice(0);
}

Array.prototype.unique = function() {
  return this.filter(function(item, idx, array) {
    return array.indexOf(item) === idx;
  });
}