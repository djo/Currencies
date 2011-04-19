$(function () {
    var initDeleteFacility = function () {
        var toggle = function () {
            var countryInput = $(this);
            var deleteInput = countryInput.siblings('input.delete');

            deleteInput.attr('checked', !countryInput.is(':checked'));
        }

        $('ul.countries').delegate('li input.country', 'change', toggle);
    }

    initDeleteFacility();
});
