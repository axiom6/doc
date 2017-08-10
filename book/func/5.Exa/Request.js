
var $  = require('jquery');
var Rx = require('rxjs/Rx');

var requestStream = Rx.Observable.just('https://api.github.com/users');

requestStream.subscribe( function(requestUrl) {

  var responseStream = Rx.Observable.create(function (observer) {
    $.getJSON(requestUrl)
      .done(   function(response)             { observer.onNext(response); })
      .fail(   function(jqXHR, status, error) { observer.onError(error);   })
      .always( function()                     { observer.onCompleted();    });
  });

  responseStream.subscribe(function(response) {
    // do something with the response
  });
});

var responseStream = requestStream
  .flatMap(function(requestUrl) {
    return Rx.Observable.fromPromise(jQuery.getJSON(requestUrl));
  });

responseStream.subscribe(function(response) {
  // render `response` to the DOM however you wish
});