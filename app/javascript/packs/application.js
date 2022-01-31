// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "@popperjs/core"
import "chartkick/chart.js"

require("bootstrap/dist/js/bootstrap")
require('jquery')
require('packs/jquery.maphilight')
require('packs/jquery.maphilight.metadata')

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).on('turbolinks:load', function() {
    $('.map').maphilight({
        alwaysOn: true
    });

    // Na elemente `area` pod elementom `map` pocuvam na `click` event
    $('map area.is_seat_free').click(function () {
        let seat_id = $(this).data('id')
        
        var data = $(this).data('maphilight') || {};
        if (!jQuery.isEmptyObject(data)) {
            data = {}
            $('[name=seat_id]').val(null)
        } else {
            data.fillColor = 'E2F015'; // zlta
            $('[name=seat_id]').val(seat_id)
        }
        $('#seat_id').trigger('change')

        // This sets the new data, and finally checks for areas with alwaysOn set
        $('map area').data('maphilight', {}).trigger('alwaysOn.maphilight');
        $(this).data('maphilight', data).trigger('alwaysOn.maphilight');
    })

    $('#reserve_button').attr("disabled", true)

    $('[name=seat_id]').change(function () {
        let seat_id = $(this).val()

        if (seat_id == "") {
            $('#reserve_button').attr("disabled", true)
        } else {
            $('#reserve_button').attr("disabled", false)
        }
    })
});