/*!
 * bespoke-mouse.1.1 v0.1.1 - Patched for bespoke 1.1
 *
 * Originally
 * https://github.com/kedarvaidya/bespoke-mouse
 * Copyright 2014, Kedar Vaidya
 */

bespoke.plugins.mouse = function(options) {
  return function(deck) {

    var isClick = options === true || options == 'click';
    var isWheel = options === true || options == 'wheel';

    if (isClick) {
        document.addEventListener('click', function (e) {
            e = e || window.event;
            if (('which' in e && e.which == 1) || ('button' in e && e.button == 0))
                deck.next();
        });

        document.addEventListener('contextmenu', function (e) {
            if (('which' in e && e.which == 3) || ('button' in e && e.button == 2)) {
                e.preventDefault();
                deck.prev();
                return false;
            }
        });
    }

    if (isWheel) {
        document.addEventListener('DOMMouseScroll', handleMouseWheel, false );  // FF
        document.addEventListener('mousewheel',     handleMouseWheel, false );

        var lastMouseWheelStep = 0;

        function handleMouseWheel(e) {
            if (new Date() - lastMouseWheelStep > 600) {
                lastMouseWheelStep = new Date();

                var delta = e.detail || -e.wheelDelta;
                if (delta > 0)
                    deck.next();
                else
                    deck.prev();
            }
        }
    }

} };
