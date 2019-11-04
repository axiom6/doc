

// Full list of configuration options available here:
// https://github.com/hakimel/reveal.js#configuration
$(document).ready( function() {
  var jsdir  = '../../lib/js/';
  var cssdir = '../../lib/css/';
  initialize( jsdir );
  pdfCSS(     cssdir ) } );


initialize = function(  jsdir ) {
  Reveal.initialize( { controls:true, progress:true, history:true, center:true, slideNumber:true,
    transition: 'slide', // none/fade/slide/convex/concave/zoom
    dependencies: [                                            // Optional libraries used to extend on reveal.js
    //{ src: jsdir + 'zoom.js',      async: true },
    //{ src: jsdir + 'notes.js',     async: true },
      { src: jsdir + 'classList.js', condition: function() { return  !document.body.classList; } },
      { src: jsdir + 'marked.js',    condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
      { src: jsdir + 'markdown.js',  condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
      { src: jsdir + 'highlight.js', condition: function() { return !!document.querySelector( 'pre code'        ); },
        callback:  function() { window['hljs'].initHighlightingOnLoad(); }, async:true } ]
  }); };

// PDF and Paper printing
pdfCSS = function(  revdir ) {
  var link = document.createElement( 'link' );
  link.rel  = 'stylesheet';
  link.type = 'text/css';
  link.href = window.location.search.match( /print-pdf/gi )
    ? revdir + 'pdf.css'
    : revdir + 'paper.css';
  document.getElementsByTagName( 'head' )[0].appendChild( link ); };