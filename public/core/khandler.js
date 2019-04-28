define(["jquery"], function ($) {

    // controle de navegacao pelo ENTER
    $('body').on('keydown', 'input, select, textarea', function (e) {
        var self = $(this)
            , form = self.parents('form:eq(0)')
            , focusable
            , next
            ;
        if (e.keyCode == 13 && !e.shiftKey) {
            focusable = form.find('input,a,select,button,textarea').filter(':visible');
            next = focusable.eq(focusable.index(this) + 1);
            next.focus();
            return false;
        }
    });
});