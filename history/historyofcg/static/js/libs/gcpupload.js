(function() {

  window.GCPUpload = (function() {

    GCPUpload.prototype.gcp_object_name = 'default_name';

    GCPUpload.prototype.gcp_sign_put_url = '/signGCPput';

    GCPUpload.prototype.file_dom_selector = 'file_upload';

    GCPUpload.prototype.onFinishGCPPut = function(public_url) {
      return console.log('base.onFinishGCPPut()', public_url);
    };

    GCPUpload.prototype.onProgress = function(percent, status) {
      return console.log('base.onProgress()', percent, status);
    };

    GCPUpload.prototype.onError = function(status) {
      return console.log('base.onError()', status);
    };

    function GCPUpload(options) {
      if (options == null) options = {};
      for (option in options) {
        this[option] = options[option];
      }
      this.handleFileSelect(document.getElementById(this.file_dom_selector));
    }

    GCPUpload.prototype.handleFileSelect = function(file_element) {
      var f, files, output, _i, _len, _results;
      this.onProgress(0, 'Upload started.');
      files = file_element.files;
      output = [];
      _results = [];
      for (_i = 0, _len = files.length; _i < _len; _i++) {
        f = files[_i];
        _results.push(this.uploadFile(f));
      }
      return _results;
    };

    GCPUpload.prototype.createCORSRequest = function(method, url) {
      var xhr;
      xhr = new XMLHttpRequest();
      if (xhr.withCredentials != null) {
        xhr.open(method, url, true);
      } else if (typeof XDomainRequest !== "undefined") {
        xhr = new XDomainRequest();
        xhr.open(method, url);
      } else {
        xhr = null;
      }
      return xhr;
    };

    GCPUpload.prototype.executeOnSignedUrl = function(file, callback) {
      var this_gcpupload, xhr;
      this_gcpupload = this;
      xhr = new XMLHttpRequest();
      xhr.open('GET', this.gcp_sign_put_url + '?gcp_object_type=' + file.type + '&gcp_object_name=' + this.gcp_object_name, true);
      xhr.overrideMimeType('text/plain; charset=x-user-defined');
      xhr.onreadystatechange = function(e) {
        var result;
        if (this.readyState === 4 && this.status === 200) {
          try {
            result = JSON.parse(this.responseText);
          } catch (error) {
            this_gcpupload.onError('Signing server returned some ugly/empty JSON: "' + this.responseText + '"');
            return false;
          }
          return callback(decodeURIComponent(result.signed_request), result.url);
        } else if (this.readyState === 4 && this.status !== 200) {
          return this_gcpupload.onError('Could not contact request signing server. Status = ' + this.status);
        }
      };
      return xhr.send();
    };

    GCPUpload.prototype.uploadToGCP = function(file, url, public_url) {
      var this_gcpupload, xhr;
      this_gcpupload = this;
      xhr = this.createCORSRequest('PUT', url);
      if (!xhr) {
        this.onError('CORS not supported');
      } else {
        xhr.onload = function() {
          if (xhr.status === 200) {
            this_gcpupload.onProgress(100, 'Upload completed.');
            return this_gcpupload.onFinishGCPPut(public_url);
          } else {
            return this_gcpupload.onError('Upload error: ' + xhr.status);
          }
        };
        xhr.onerror = function() {
          return this_gcpupload.onError('XHR error.');
        };
        xhr.upload.onprogress = function(e) {
          var percentLoaded;
          if (e.lengthComputable) {
            percentLoaded = Math.round((e.loaded / e.total) * 100);
            return this_gcpupload.onProgress(percentLoaded, percentLoaded === 100 ? 'Finalizing.' : 'Uploading.');
          }
        };
      }
      xhr.setRequestHeader('Content-Type', file.type);
      xhr.setRequestHeader('x-amz-acl', 'public-read');
      return xhr.send(file);
    };

    GCPUpload.prototype.uploadFile = function(file) {
      var this_gcpupload;
      this_gcpupload = this;
      return this.executeOnSignedUrl(file, function(signedURL, publicURL) {
        return this_gcpupload.uploadToGCP(file, signedURL, publicURL);
      });
    };

    return GCPUpload;

  })();

}).call(this);
