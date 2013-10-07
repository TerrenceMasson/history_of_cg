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