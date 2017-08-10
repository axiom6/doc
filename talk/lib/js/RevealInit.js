

// Full list of configuration options available here:
// https://github.com/hakimel/reveal.js#configuration
$(document).ready( function() {
  var modules = '../../node_modules/';
  var revdir  = modules + 'reveal.js/';
  initialize( revdir );
  pdfCSS(     revdir ) } );


initialize = function(  revdir ) {
  Reveal.initialize( { controls:true, progress:true, history:true, center:true, slideNumber:true,
    transition: 'slide', // none/fade/slide/convex/concave/zoom
    dependencies: [                                            // Optional libraries used to extend on reveal.js
      { src: revdir + 'lib/js/classList.js',           condition: function() { return !document.body.classList; } },
      { src: revdir + 'plugin/markdown/marked.js',     condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
      { src: revdir + 'plugin/markdown/markdown.js',   condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
      { src: revdir + 'plugin/highlight/highlight.js', condition: function() { return !!document.querySelector( 'pre code'        ); },
                                                                               callback:  function() { hljs.initHighlightingOnLoad(); }, async:true },
      { src: revdir + 'plugin/zoom-js/zoom.js', async: true },
      { src: '../../lib/js/notes.js',  async: true }    ]
  }); };

// PDF and Paper printing
pdfCSS = function(  revdir ) {
  var link = document.createElement( 'link' );
  link.rel = 'stylesheet';
  link.type = 'text/css';
  link.href = window.location.search.match( /print-pdf/gi )
    ? revdir + 'css/print/pdf.css'
    : revdir + 'css/print/paper.css';
  document.getElementsByTagName( 'head' )[0].appendChild( link ); };