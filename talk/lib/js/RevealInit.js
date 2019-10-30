

// Full list of configuration options available here:
// https://github.com/hakimel/reveal.js#configuration
$(document).ready( function() {
  var jsdir  = '../lib/';
  var cssdir = '../../lib/';
  var hljs    = window['hljs'];
  initialize( jsdir, hljs );
  pdfCSS(     cssdir ) } );


initialize = function(  revdir, hljs ) {
  Reveal.initialize( { controls:true, progress:true, history:true, center:true, slideNumber:true,
    transition: 'slide', // none/fade/slide/convex/concave/zoom
    dependencies: [                                            // Optional libraries used to extend on reveal.js
    //{ src: revdir + 'js/zoom.js',      async: true },
    //{ src: revdir + 'js/notes.js',     async: true },
      { src: revdir + 'js/classList.js', condition: function() { return !document.body.classList; } },
      { src: revdir + 'js/marked.js',    condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
      { src: revdir + 'js/markdown.js',  condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
      { src: revdir + 'js/highlight.js', condition: function() { return !!document.querySelector( 'pre code'        ); },
        callback:  function() { hljs.initHighlightingOnLoad(); }, async:true } ]
  }); };

// PDF and Paper printing
pdfCSS = function(  revdir ) {
  var link = document.createElement( 'link' );
  link.rel  = 'stylesheet';
  link.type = 'text/css';
  link.href = window.location.search.match( /print-pdf/gi )
    ? revdir + 'css/pdf.css'
    : revdir + 'css/paper.css';
  document.getElementsByTagName( 'head' )[0].appendChild( link ); };