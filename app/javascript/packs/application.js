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

$(function () {
    $('.map').maphilight({
        /*fillColor: '880808',*/
        alwaysOn: true
    });

    // Na elemente `area` pod elementom `map` pocuvam na `click` event
    $('map area.is_seat_free').click(function () {
        let seat_id = $(this).data('id')

        $('[name=seat_id]').val(seat_id)

        var data = $(this).data('maphilight') || {};
        if (!jQuery.isEmptyObject(data)) {
            data = {}
        } else {
            data.fillColor = '00ffff'; // svetlomodra
        }

        // This sets the new data, and finally checks for areas with alwaysOn set
        $('map area').data('maphilight', {}).trigger('alwaysOn.maphilight');
        $(this).data('maphilight', data).trigger('alwaysOn.maphilight');
    })
});